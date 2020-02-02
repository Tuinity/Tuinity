Tuinity
==

Experimental fork of paper. I would personally not recommend using this in a
production server (or at all). The fork is based off of aikar's EMC framework found here:
https://github.com/starlis/empirecraft

## Contact
[IRC](http://irc.spi.gt/iris/?channels=tuinity) | [Discord](https://discord.gg/CgDPu27)

## License
The PATCHES-LICENSE file describes the license for api & server patches,
found in `./patches` and its subdirectories except when noted otherwise.

Everything else is licensed under the MIT license, except when note otherwise.
See https://github.com/starlis/empirecraft and https://github.com/electronicboy/byof
for the license of material used/modified by this project.

## Plugin developers
In order to use Tuinity as a dependency you must following the steps laid out
in `Building and setting up` and build tuinity. Each time you want to update
your dependency you must re-build tuinity.

Tuinity-API maven dependency:
```xml
<dependency>
    <groupId>ca.spottedleaf.tuinity</groupId>
    <artifactId>tuinity-api</artifactId>
    <version>1.15.2-R0.1-SNAPSHOT</version>
    <scope>provided</scope>
 </dependency>
 ```

 Tuinity-Server maven dependency:
 ```xml
 <dependency>
     <groupId>ca.spottedleaf.tuinity</groupId>
     <artifactId>tuinity</artifactId>
     <version>1.15.2-R0.1-SNAPSHOT</version>
     <scope>provided</scope>
  </dependency>
  ```

There is no repository required since the artifacts should be locally installed
via building tuinity.

## Building and setting up
Run the following commands in the root directory:

```
./tuinity patch
```

This should initialize the repo such that you can now start modifying and creating
patches. The folder `Tuinity-API` is the api repo and the `Tuinity-Server` folder
is the server repo and will contain the source files you will modify.

#### Creating a patch
Patches are effectively just commits in either `Tuinity-API` or `Tuinity-Server`.
To create one, just add a commit to either repo and run `./tuinity rb`, and a
patch will be placed in the patches folder. Modifying commits will also modify its
corresponding patch file.


#### Building

Use the command `./tuinity build` to build the api and server. Compiled jars
will be placed under `Tuinity-API/target` and `Tuinity-Server/target`.

To get paperclip jars, run `./tuinity jar`.
