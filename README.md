# WIP
This repo is currently work in progress.

# docker-farming-simulator-server
This is a docker image to run the Farming Simulator 19 in a docker container.
The game files are **not** included and must be mounted into the container.

# Example

```
$ docker run -v gamedata:'/app/drive_c/Program Files (x86)/Farming Simulator 2019' cbeneke/farming-simulator-server
```
