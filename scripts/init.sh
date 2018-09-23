#!/usr/bin/env bash
sourceBase=$(dirname $SOURCE)/../
cd ${basedir:-$sourceBase}

basedir=$(pwd -P)
cd -

FORK_NAME="AlphheimCraft"
API_REPO="https://electronicboy@atlas.valaria.pw/stash/scm/al/alphheimcraft-api.git"
SERVER_REPO="https://electronicboy@atlas.valaria.pw/stash/scm/al/alphheimcraft-server.git"
PAPER_API_REPO="https://electronicboy@atlas.valaria.pw/stash/scm/al/paper-api.git"
PAPER_SERVER_REPO="https://electronicboy@atlas.valaria.pw/stash/scm/al/paper-server.git"
MCDEV_REPO="https://electronicboy@atlas.valaria.pw/stash/scm/al/mc-dev.git"

function bashColor {
if [ $2 ]; then
	echo -e "\e[$1;$2m"
else
	echo -e "\e[$1m"
fi
}
function bashColorReset {
	echo -e "\e[m"
}

function cleanupPatches {
	cd "$1"
	for patch in *.patch; do
		gitver=$(tail -n 2 $patch | grep -ve "^$" | tail -n 1)
		diffs=$(git diff --staged $patch | grep -E "^(\+|\-)" | grep -Ev "(From [a-z0-9]{32,}|\-\-\- a|\+\+\+ b|.index|Date\: )")

		testver=$(echo "$diffs" | tail -n 2 | grep -ve "^$" | tail -n 1 | grep "$gitver")
		if [ "x$testver" != "x" ]; then
			diffs=$(echo "$diffs" | tail -n +3)
		fi

		if [ "x$diffs" == "x" ] ; then
			git reset HEAD $patch >/dev/null
			git checkout -- $patch >/dev/null
		fi
	done
}
function pushRepo {
	if [ "$(git config minecraft.push-${FORK_NAME})" == "1" ]; then
	echo "Pushing - $1 ($3) to $2"
	(
		cd "$1"
		git remote rm emc-push > /dev/null 2>&1
		git remote add emc-push $2 >/dev/null 2>&1
		git push emc-push $3 -f
	)
	fi
}
function basedir {
	cd "$basedir"
}
function gethead {
	(
		cd "$1"
		git log -1 --oneline
	)
}
