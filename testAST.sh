#!/bin/bash
for file in testprograms/lab3/valid/*.p0;
do
    echo $file;
    scala -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --ast $file | diff - $file.ast
done;
for file in testprograms/lab3/invalid/*.p0;
do
    echo $file;
    output=$(scala -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --ast $file);
    if [ $? -ne 1 ]
    then
        echo 'Exit code not 1';
        exit 1;
    fi;
    if [ -z "$output" ]
    then
        echo 'Empty output';
        exit 1;
    fi;
done;
