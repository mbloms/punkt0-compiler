#!/bin/bash
for file in testprograms/lab5/valid/*.p0;
do
    echo $file;
    scala -cp ./target/scala-2.11/classes:./frege.jar:./lib/cafebabe_2.11-1.2.jar punkt0.Main -d classes $file;
    java -cp classes Main > our.txt;
    scala -cp ./punkt0_2.11-1.0.jar:./lib/cafebabe_2.11-1.2.jar punkt0.Main -d classes $file;
    java -cp classes Main > thiers.txt;
    diff our.txt thiers.txt;
done;
