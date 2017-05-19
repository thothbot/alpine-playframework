Docker image which provides a sbt 0.13.13, designed to launch play applications 2.5.13

# Contains:
* Oracle Java
* sbt
* play framework v2.5.15 dependencies
* Alpine Linux

# Play framework dependencies

```
lazy val root = (project in file(".")).enablePlugins(PlayJava, PlayEbean, DebianPlugin)
scalaVersion := "2.11.8"
libraryDependencies += evolutions
libraryDependencies += javaJdbc
libraryDependencies += cache
libraryDependencies += javaWs
```

Plugins:
```
"com.typesafe.play" % "sbt-plugin" % "2.5.13"
"com.typesafe.sbt" % "sbt-play-ebean" % "3.1.0"
"com.typesafe.sbt" % "sbt-coffeescript" % "1.0.0"
"com.typesafe.sbt" % "sbt-less" % "1.1.0"
"com.typesafe.sbt" % "sbt-jshint" % "1.0.4"
"com.typesafe.sbt" % "sbt-rjs" % "1.0.8"
"com.typesafe.sbt" % "sbt-digest" % "1.1.1"
"com.typesafe.sbt" % "sbt-mocha" % "1.1.0"
"org.irundaia.sbt" % "sbt-sassify" % "1.4.6"
"com.typesafe.sbt" % "sbt-play-enhancer" % "1.1.0"
"com.typesafe.sbt" % "sbt-native-packager" % "1.2.0-M7"
"org.javassist" % "javassist" % "3.20.0-GA"' 
```

# Run your app

Your play app has to be mounted in the container in the /app directory. 

```
docker run -d \
  -v /path/to/your/play/app:/app:rw \
  -p 80:9000 \
  thothbot/alpine-play-sbt sbt run
```

In some cases, you'll need to run play with the current user:
```
docker run -d \
  -v /path/to/your/play/app:/app:rw \
  -p 80:9000 \
  -u $(id -u)
  thothbot/alpine-play-sbt sbt run
```

For logs:

```
docker run -it \
  -v /path/to/your/play/app:/app:rw \
  -p 80:9000 \
  thothbot/alpine-play-sbt sbt run
```