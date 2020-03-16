FROM ubuntu:19.10 AS builder

WORKDIR /workspace
RUN apt update && apt install -y git openjdk-11-jre-headless
ADD https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar .

ARG VERSION=1.15.2
RUN java -jar BuildTools.jar --rev ${VERSION}

FROM gcr.io/distroless/java:11

COPY --from=builder /workspace/spigot-*.jar /opt/spigot/spigot.jar

CMD ["-jar", "/opt/spigot/spigot.jar"]
