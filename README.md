# A Haskell Container for Raspberry Pi

Raspberry Pi 4 works in an `aarch64` (ARMv8) CPU architecture.

There are not many distributions running the latest versions of Haskell compiler and tools for this arch.

Tried the following base images with `apt-get install cabal-install haskell-stack` or similar

```
CONTAINER ID   IMAGE                             SIZE                       GHC     Stack
072d05463f52   balenalib/aarch64-debian:bullseye 1.57GB (virtual 1.7GB)     8.8.4   2.3.3
9f5b9a933dde   navikey/raspbian-bullseye         1.77GB (virtual 2GB)       8.8.4   2.3.3
ab86dbfeebde   balenalib/aarch64-ubuntu:focal    1.37GB (virtual 1.49GB)    8.6.5   1.9.3.1
067daa0bd015   navikey/raspbian-buster           1.39GB (virtual 1.59GB)    8.4.4   1.7.1
```

And chose `balenalib/aarch64-debian:bullseye`

Balenalib is a popular repository for IoT images

The `stack` resolver for GHC 8.8.4 is [LTS Haskell 16.31](https://www.stackage.org/lts-16.31) published on 2021-01-17

This tool doesn't support ARM binaries, so it is configured in the image to always use the system GHC.

## How to start with a new project

Start a container

```
$ docker run -it pinei/haskell-pi
```

Create a project with `stack`

```
~# stack --resolver lts-16.31 new haskell-for-good
Downloading template "new-template" to create project "haskell-for-good" in haskell-for-good/ ...
```

I think you can ignore `--resolver` because `stack` will not try to get another GHC.

Test the project

```
~# cd haskell-for-good/
~/haskell-for-good# stack test
...
haskell-for-good> Test suite haskell-for-good-test passed
Completed 2 action(s).
```

