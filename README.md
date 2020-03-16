# docker-spigot
A Dockerfile for Spigot

Build [Spigot](https://www.spigotmc.org) for a spesific version of [Minecraft](https://www.minecraft.net/).

For the same [reason that the Spigot project can't publish prebuilt Spigot JARs](https://www.spigotmc.org/wiki/faq/#where-do-i-get-the-spigot-or-bukkit-jar-file-for-my-server), I can't publish the built images. But you can use this Dockerfile to make your own. The Docker build will download and invoke the Spigot [build tools](https://www.spigotmc.org/wiki/buildtools/), and copy the output `spigot.jar` into a [Distroless](https://github.com/GoogleContainerTools/distroless/tree/master/java) Java image.

## Building

```bash
export MC_VERSION=1.15.2
export DOCKER_REPO=myrepo/spigot
docker build . --build-arg VERSION=$MC_VERSION --tag $DOCKER_REPO:$MC_VERSION
docker push $DOCKER_REPO
```
