name := "compiler"

version := "1.0"

scalaVersion := "2.12.1"

mainClass in Compile := Some("Main")
selectMainClass in Compile := (mainClass in Compile).value

selectMainClass in Test := Some("Test")

