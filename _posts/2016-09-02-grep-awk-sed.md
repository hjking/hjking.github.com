---
comments: true
tags:
  - grep
  - awk
  - sed
categories:
  - Linux
summary: "介绍 grep, awk, sed 的基本用法"
title: "grep, awk, sed 简介"
layout: post
---

`grep`, `awk` and `sed` are three of the most useful command-line tools1 in *nix world. And this article will give you a brief introduction and basic usages of these three different commands.

### grep

`grep` (Global Regular Expression Print) is used to search for specific terms in a file.

Different from `awk` and `sed`, `grep` can’t add/modify/remove the text in a specific file. But it’s useful when we just want to search and filter out matches.

#### 典型用法

~~~ shell
# print every line that contains the word 'test'
grep 'test' file.txt
~~~

  - \-E / -P: Use extended / Perl compatible regular expression syntax.

  - \-n: Show line number before each line.

  - \-o: Only show the matching segment of the line.

  - \-v: Print all of the lines that DO NOT match the search pattern.

  - \-c: Show the number of the lines that contains the search pattern.

  - \-i: Ignore case.


<!-- more -->

### awk

`awk` is a text pattern scanning and processing language, which is created by Aho, Weinberger & Kernighan. `awk` is mostly used for data extraction and reporting (dealing with .csv files).

Each `awk` procedure can be divided into three sections:

>  BEGIN { ... initialization awk commands ...}
>  { ... awk commands for each line of the file ...}
>  END { ... finalization awk commands ...}


- Control flow

>  if (condition) statement [ else statement ]
>  while (condition) statement
>  do statement while (condition)
>  for (expr1; expr2; expr3) statement
>  for (var in array) statement
>  break
>  continue
>  exit [ expression ]

- Built-in variables

Variable  | Meaning
--------- | -------
\$0      | Current line
\$1 - \$n |  The nth field
FS     | Input field separator, default value is “ “
NF     | The number of fields/columns
NR     | The number of records/rows
FNR    | The number of records relative to the current input file
OFS    | The output field separator, default value is “ “
ORS    | The output record separator, default value is “\n”

- Typical use

~~~ shell
# print 1st and 4th column
awk '{print $1, $4}' file.txt

# same with 'cat file.txt'
awk '{print $0}' file.txt
~~~

- \-F: Set input field sparator

~~~ shell
# print 1st and 4th column separated by ':'
awk -F: '{print $1, $4}' file.txt
# or
awk 'BEGIN {FS = ":"} {print $1, $4}' file.txt
~~~

- Pattern matching

~~~ shell
# print 2nd column when 1st field is precisely 'test'
awk '$1 == "test" { print $2 }' file.txt

# print 2nd column when 1st field contains 'test'
awk '$1 ~ /test/ { print $2 }' file.txt

# print 2nd column when 1st field DOES NOT contain 'test'
awk '$1 !~ /test/ { print $2 }' file.txt

# print 2nd column when this record contains 'test'
awk '/test/ { print $2 }' file.txt

# print 2nd column when this record DOES NOT contain 'test'
awk '! /test/ { print $2 }' file.txt
~~~

- In-place editing: -i (GNU awk 4.1.0 or later…)


### sed

`sed` refers to Stream Editor. It can perform text transformations on a given file or an input stream.


- Print a line: p

~~~ shell
# treat this as using 'grep'
# same with 'cat file.txt'
sed '' file.txt

# print every line that matches the regex pattern
sed -n '/test/p' file.txt

# match different patterns
sed -n '/test1/, /test2/p' file.txt
~~~

- Remove a line: d

~~~ shell
# remove every line that matches the regex pattern
sed '/test/d' file.txt

# remove 2nd line
sed '2d' file.txt

# remove from 2nd line to the end of the file
sed '2,$d' file.txt
~~~

- Substitution: s

~~~ shell
# replace the 1st 'test' with 'text' in each line
sed 's/test/text/' file.txt

# replace all 'test' with 'text' in each line
sed 's/test/text/g' file.txt

# replace the 2nd 'test' with 'text' in each line
sed 's/test/text/2' file.txt

# replace all 'test' from the 2nd to the end of each line with 'text'
sed 's/test/text/2g' file.txt

# replace the 'test' in the 2nd line with 'text'
sed '2s/test/text/g' file.txt
~~~

- Insert & Append a whole line: i & a

~~~ shell
# insert a new line before the 2nd line
sed '2 i test' file.txt

# append a new line after the 2nd line
sed '2 a test' file.txt

# append a new line after each line that matches the regex pattern
sed '/test/a test' file.txt
~~~

- Replace a whole line: c

~~~ shell
# replace the 2nd line with 'test'
sed '2 c test' file.txt

# replace each line that matches the regex pattern with 'text'
sed '/test/c text' file.txt
~~~

- In-place editing: \-i

~~~ shell
# make immediate change!
sed -i 's/test/text/g' file.txt
~~~