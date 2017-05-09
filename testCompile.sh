#!/bin/bash
for file in testprograms/lab5/valid/*.p0;
do
    echo $file;
    scala -cp ./target/scala-2.11/classes:./frege.jar:./lib/cafebabe_2.11-1.2.jar punkt0.Main $file;
    java Main > our.txt;
    scala -cp ./punkt0_2.11-1.0.jar:./lib/cafebabe_2.11-1.2.jar punkt0.Main $file;
    java Main > thiers.txt;
    diff our.txt thiers.txt;
done;
