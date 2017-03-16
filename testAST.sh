#!/usr/bin/env fish
for file in testprograms/lab3/valid/*.p0;
    echo $file;
    scala -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --ast $file | diff - $file.ast
end;
for file in testprograms/lab3/invalid/*.p0;
    echo $file;
    set -l output (scala -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --ast $file);
    if test $status -ne 1;
        echo 'Exit code not 1';
        exit 1;
    end;
    if test "$output" -eq "";
        echo 'Empty output';
        exit 1;
    end;
end;
