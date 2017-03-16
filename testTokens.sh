#!/usr/bin/env fish
for file in ./testprograms/lab2/valid/*.p0
    echo $file;
    set -l dirname (dirname $file);
    set -l filename (basename $file .p0);
    scala -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --tokens $file | diff - $dirname/$filename.check;
end;
for file in ./testprograms/lab2/invalid/*.p0
    echo $file;
    set -l output (scala -cp ./target/scala-2.11/classes:./frege.jar punkt0.Main --tokens $file);
    if test $status -ne 1;
        echo 'Error code not 1';
        exit 1
    end;
    if test "$output" -eq "";
        echo 'Empty output';
        exit 1
    end;
end;


