FROM thothbot/alpine-sbt
MAINTAINER Alex Usachev <thothbot@gmail.com>

RUN echo $'name := """play-java""" \n\
version := "1.0-SNAPSHOT" \n\
lazy val root = (project in file(".")).enablePlugins(PlayJava, PlayEbean, DebianPlugin) \n\
scalaVersion := "2.11.8" \n\
libraryDependencies += evolutions \n\
libraryDependencies += javaJdbc \n\
libraryDependencies += cache \n\
libraryDependencies += javaWs' > /app/build.sbt && \

mkdir /app/project && \

echo $'addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "2.5.14") \n\
addSbtPlugin("com.typesafe.sbt" % "sbt-play-ebean" % "3.1.0") \n\
addSbtPlugin("com.typesafe.sbt" % "sbt-coffeescript" % "1.0.0") \n\
addSbtPlugin("com.typesafe.sbt" % "sbt-less" % "1.1.0") \n\
addSbtPlugin("com.typesafe.sbt" % "sbt-jshint" % "1.0.4") \n\
addSbtPlugin("com.typesafe.sbt" % "sbt-rjs" % "1.0.8") \n\
addSbtPlugin("com.typesafe.sbt" % "sbt-digest" % "1.1.1") \n\
addSbtPlugin("com.typesafe.sbt" % "sbt-mocha" % "1.1.0") \n\
addSbtPlugin("org.irundaia.sbt" % "sbt-sassify" % "1.4.6") \n\
addSbtPlugin("com.typesafe.sbt" % "sbt-play-enhancer" % "1.1.0") \n\
addSbtPlugin("com.typesafe.sbt" % "sbt-native-packager" % "1.2.0-M7") \n\
libraryDependencies += "org.javassist" % "javassist" % "3.20.0-GA"' > /app/project/plugins.sbt && \

echo "sbt.version=0.13.15" > /app/project/build.properties && \

cd /app && sbt package && \

rm -fr /app/*

EXPOSE 9000 9999 9443
