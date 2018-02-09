FROM ogomez/java-docker
LABEL maintainer="Pavel Skvortsov <skv.pavel@gmail.com>"

ENV SCALA_VERSION 2.11.8
ENV SBT_VERSION 0.13.15
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN apk add --no-cache curl bash tar ca-certificates

RUN set -ex && \
    curl -fsL https://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /root/ && \
    echo >> /root/.bashrc && \
    echo "export PATH=~/scala-$SCALA_VERSION/bin:$PATH" >> /root/.bashrc 

RUN set -ex && \
    curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built
