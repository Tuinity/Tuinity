Concrete
==

Experimental fork of paper. I would personally not recommend using this in a
production server (or at all). The fork is based off of aikar's EMC framework found here:
https://github.com/starlis/empirecraft

## Contact
[IRC](http://irc.spi.gt/iris/?channels=concrete) | [Discord](https://discord.gg/CgDPu27)

## License
The PATCHES-LICENSE file describes the license for api & server patches, 
found in `./patches/api` and `./patches/server` except when noted otherwise.

Everything else is licensed under the MIT license, except when note otherwise. 
See https://github.com/starlis/empirecraft and https://github.com/electronicboy/byof 
for the license of material used/modified by this project.

## Plugin developers
In order to use Concrete as a dependency you must following the steps laid out
in `Building and setting up` and build concrete. Each time you want to update
your dependency you must re-build concrete.

Concrete-API maven dependency:
```xml
<dependency>
    <groupId>ca.spottedleaf.concrete</groupId>
    <artifactId>concrete-api</artifactId>
    <version>1.14.4-R0.1-SNAPSHOT</version>
    <scope>provided</scope>
 </dependency>
 ```
 
 Concrete-Server maven dependency:
 ```xml
 <dependency>
     <groupId>ca.spottedleaf.concrete</groupId>
     <artifactId>concrete</artifactId>
     <version>1.14.4-R0.1-SNAPSHOT</version>
     <scope>provided</scope>
  </dependency>
  ```

There is no repository required since the artifacts should be locally installed
via building concrete.

## Building and setting up
Run the following commands in the root directory:

```
git submodule init
git submodule update
./concrete up
./concrete patch
```

Concrete uses `concurrentutil`, which is not yet published to maven
central. You must clone https://github.com/Spottedleaf/ConcurrentUtil
and build that project using the following commands:

```
git clone https://github.com/Spottedleaf/ConcurrentUtil.git
cd ConcurrentUtil
mvn clean install
```

This should initialize the repo such that you can now start modifying and creating 
patches. The folder `Concrete-API` is the api repo and the `Concrete-Server` folder
is the server repo and will contain the source files you will modify.

#### Creating a patch
Patches are effectively just commits in either `Concrete-API` or `Concrete-Server`. 
To create one, just add a commit to either repo and run `./concrete rb`, and a 
patch will be placed in the patches folder. Modifying commits will also modify its 
corresponding patch file.


#### Building

Use the command `./concrete build` to build the api and server. Compiled jars
will be placed under `Concrete-API/target` and `Concrete-Server/target`.
