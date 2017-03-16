name := "punkt0"

version := "1.0"

scalaVersion := "2.11.8"

scalacOptions ++= Seq("-deprecation", "-unchecked")

mainClass in Compile := Some("punkt0.Main")
selectMainClass in Compile := (mainClass in Compile).value

selectMainClass in Test := Some("Test")

fregeOptions ++= Seq("-target", "1.7")
fregeLibrary := "org.frege-lang" % "frege" % "3.24.100.1" classifier "jdk7"
