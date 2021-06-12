FROM openjdk:16-jdk-alpine AS builder

WORKDIR /workspace
RUN apk add --no-cache git
ADD https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar .

ARG VERSION=1.15.2
RUN git config --global --unset core.autocrlf
RUN java -jar BuildTools.jar --rev ${VERSION}

FROM openjdk:16-alpine

COPY --from=builder /workspace/spigot-*.jar /opt/spigot/spigot.jar

CMD ["-jar", "/opt/spigot/spigot.jar"]
