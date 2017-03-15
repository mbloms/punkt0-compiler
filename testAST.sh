#!/usr/bin/env fish
rm out
for file in testprograms/lab3/valid/*.p0;
    echo $file;
    scala -cp ./target/scala-2.12/classes:./frege3.24.100.jar punkt0.Main --ast $file | diff - $file.ast
end;
