#!/bin/bash

# Написать скрипт, выводящий в файл (имя файла задаётся
# пользователем в качестве первого аргумента командной строки) имена всех
# файлов с заданным расширением (третий аргумент командной строки) из
# заданного каталога (имя каталога задаётся пользователем в качестве второго
# аргумента командной строки).

echo > $1
items=`dir $2`

for item in $items
    do
    [[ "${item##*.}" == "$3" ]] && echo $item >> $1
    done
