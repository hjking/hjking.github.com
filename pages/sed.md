---
layout: page
title: sed
---

sed被称为流编辑器（stream editor），可以根据命令来处理数据流中的数据。 本身是一个管道命令，主要是以行为单位进行处理，可以将数据行进行替换、删除、新增、选取等特定工作。

# Sed命令行格式

	sed -Options "Features" File


## Options

	-n ：使用安静(silent)模式。在一般 sed 的用法中，所有来自 STDIN 的数据一般都会被列出到终端上。但如果加上 -n 参数后，则只有经过sed 特殊处理的那一行(或者动作)才会被列出来。
	-e ：直接在命令列模式上进行 sed 的动作编辑；
	-f ：直接将 sed 的动作写在一个文件内， -f filename 则可以运行 filename 内的 sed 动作；
	-r ：sed 的动作支持的是延伸型正规表示法的语法。(默认是基础正规表示法语法)
	-i ：直接修改读取的文件内容，而不是输出到终端。

## Features

	a ：新增， a 的后面可以接字串，而这些字串会在新的一行出现(目前的下一行)
	c ：取代， c 的后面可以接字串，这些字串可以取代你指定行的所有内容
	d ：删除， 因为是删除啊，所以 d 后面通常不接任何东西
	i ：插入， i 的后面可以接字串，而这些字串会在新的一行出现(目前的上一行)
	p ：列印， 亦即将某个选择的数据印出。通常 p 会与参数 sed -n 一起运行
	r ：引入， sed中的 r 命令会把其后面的任何字符判读为文件名，直到回车符或是单引号
	s ：替换， 通常这个 s 的动作可以搭配正则表达式。 例如 sed “s/要被取代的字串/新的字串/g”


# sed Tips

`sed` refers to Stream Editor. It can perform text transformations on a given file or an input stream.


- 打印一行: p

~~~ shell
# treat this as using 'grep'
# same with 'cat file.txt'
sed '' file.txt

# print every line that matches the regex pattern
sed -n '/test/p' file.txt

# match different patterns
sed -n '/test1/, /test2/p' file.txt

sed -n "1p"   file.txt         # 只显示文件的第一行
sed -n "$p"   file.txt         # 只显示文件的最后一行
sed -n "1,2p" file.txt         # 只显示文件的第一行到第二行
sed -n "2,$p" file.txt         # 显示文件的第二行到最后一行

sed -n "/ruby/p" file.txt      # 输出关键字ruby所在行的内容；其中"/str/p"，str为搜索的文本内容
sed -n "/\$/p" file.txt        # 输出关键字$所在行的内容，使用反斜线\屏蔽特殊含义

~~~


- 删除一行: d

~~~ shell
# remove every line that matches the regex pattern
sed '/test/d' file.txt

# remove 2nd line
sed '2d' file.txt

# remove from 2nd line to the end of the file
sed '2,$d' file.txt

sed "$d"   file.txt       # 输出删除最后一行后的文件内容

sed "1,2d" file.txt       # 输出删除第一行到第二行后的文件内容

sed "2,$d" file.txt       # 输出删除第2行到最后1行后的文件内容

sed 'd' file   # 将file的流中所有行全部删除

~~~


- 替换: s

注意：如果不加上-i选项，修改的都是流中的内容，file本身的内容没有变化。

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

sed -n 's/pattern/replacement/p' file   将file的流中每行的第一个pattern替换成replacement，并打印出修改过的行

sed -n 's/pattern/replacement/2p' file   将file的流中每行的第二个pattern替换成replacement，并打印出修改过的行（标记符号可以多个一起使用，且顺序不影响结果）

sed 's/pattern/replacement/gw outFile' file   将file的流中每行的每一个pattern替换成replacement，并将输出保存到outFile中（w标记必须要放在最后，如果写作wg，标记g将无效，并生成名为g outFile的输出文件）

sed '2s/pattern/replacement/' file   将file的流中第二行的第一个pattern替换成replacement

sed '2,4s/pattern/replacement/' file   将file的流中第二行到第四行的第一个pattern替换成replacement

sed '2,$s/pattern/replacement/' file   将file的流中第二行到最后一行的第一个pattern替换成replacement

sed '/word/s/pattern/replacement/' file   将file的流中含有word的行中的第一个pattern替换成replacement，可以使用正则表达式
~~~


- 插入或者附加文本: i & a

（1）插入（insert）命令（i）会在指定行前增加一个新行。

（2）附加（append）命令（a）会在指定行后增加一个新行。

~~~ shell
# insert a new line before the 2nd line
sed '2i test' file.txt

# append a new line after the 2nd line
sed '2a test' file.txt

# append a new line after each line that matches the regex pattern
sed '/test/a test' file.txt

sed "1a drink tea" 98k.txt            # 在第一行后增加字符串"drink tea"

sed "1,3a drink tea" 98k.txt          # 在第一行到第三行后增加字符串"drink tea"

sed "1a drink tea\nor coffee" 98k.txt # 在第一行后增加两行，换行使用\n，可多次使用\n添加多行

sed "1r 1.txt" 98k.txt     # 把1.txt的内容增加到98k.txt的第一行后
~~~


- 修改行: c

~~~ shell
# replace the 2nd line with 'test'
sed '2 c test' file.txt

# replace each line that matches the regex pattern with 'text'
sed '/test/c text' file.txt

sed "1c Hi" 98k.txt    # 把98k.txt的第一行替换为Hi

sed "1,2c Hi" 98k.txt  # 把98k.txt的第一行到第二行替换为Hi
~~~


- 直接文本操作

`sed -i` 是直接对文件进行操作

~~~ shell
# make immediate change!
sed -i 's/test/text/g' file.txt

# 对每行匹配到的第一个字符串进行替换
sed -i "s/原字符串/新字符串/" 98k.txt

# 对全局匹配上的所有字符串进行替换
sed -i "s/原字符串/新字符串/g" 98k.txt

# 删除所有匹配到字符串的行
sed -i "/匹配字符串/d"  98k.txt

# 特定字符串的行后插入新行
sed -i "/特定字符串/a 新行字符串" 98k.txt

# 特定字符串的行前插入新行
sed -i "/特定字符串/i 新行字符串" 98k.txt

# 把匹配行中的某个字符串替换为目标字符串
sed -i "/匹配字符串/s/源字符串/目标字符串/g" 98k.txt

# 在文件98k.txt中的末行之后，添加bye
sed -i "$a bye" 98k.txt

# 对于文件第3行，把匹配上的所有字符串进行替换
sed -i "3s/原字符串/新字符串/g" 98k.txt
~~~


- 文本间隔：

~~~ shell
# 在每一行后面增加一空行
sed G

# 将原来的所有空行删除并在每一行后面增加一空行。
# 这样在输出的文本中每一行后面将有且只有一空行。
sed ‘/^$/d;G’

# 在每一行后面增加两行空行
sed ‘G;G’

# 将第一个脚本所产生的所有空行删除（即删除所有偶数行）
sed ‘n;d’

# 在匹配式样“regex”的行之前插入一空行
sed ‘/regex/{x;p;x;}’

# 在匹配式样“regex”的行之后插入一空行
sed ‘/regex/G’

# 在匹配式样“regex”的行之前和之后各插入一空行
sed ‘/regex/{x;p;x;G;}’
~~~


- 编号：

~~~shell
# 为文件中的每一行进行编号（简单的左对齐方式）。这里使用了“制表符”
# （tab，见本文末尾关于’\t’的用法的描述）而不是空格来对齐边缘。
sed = filename | sed ‘N;s/\n/\t/’

# 对文件中的所有行编号（行号在左，文字右端对齐）。
sed = filename | sed ‘N; s/^/ /; s/ *\(.\{6,\}\)\n/\1 /’

# 对文件中的所有行编号，但只显示非空白行的行号。
sed ‘/./=’ filename | sed ‘/./N; s/\n/ /’

# 计算行数 （模拟 “wc -l”）
sed -n ‘$=’
~~~


- 文本转换和替代：

~~~shell
# Unix环境：转换DOS的新行符（CR/LF）为Unix格式。
sed 's/.$//' # 假设所有行以CR/LF结束
sed 's/^M$//' # 在bash/tcsh中，将按Ctrl-M改为按Ctrl-V
sed 's/\x0D$//' # ssed、gsed 3.02.80，及更高版本

# Unix环境：转换Unix的新行符（LF）为DOS格式。
sed "s/$/`echo -e \\\r`/" # 在ksh下所使用的命令
sed "s/$'”/`echo \\\r`/" # 在bash下所使用的命令
sed "s/$/`echo \\\r`/" # 在zsh下所使用的命令
sed 's/$/\r/' # gsed 3.02.80 及更高版本

# DOS环境：转换Unix新行符（LF）为DOS格式。
sed "s/$//" # 方法 1
sed -n p # 方法 2

# DOS环境：转换DOS新行符（CR/LF）为Unix格式。
# 下面的脚本只对UnxUtils sed 4.0.7 及更高版本有效。要识别UnxUtils版本的
# sed可以通过其特有的“–text”选项。你可以使用帮助选项（“–help”）看
# 其中有无一个“–text”项以此来判断所使用的是否是UnxUtils版本。其它DOS
# 版本的的sed则无法进行这一转换。但可以用“tr”来实现这一转换。
sed "s/\r//" infile >outfile # UnxUtils sed v4.0.7 或更高版本
tr -d \r <infile >outfile # GNU tr 1.22 或更高版本

# 将每一行前导的“空白字符”（空格，制表符）删除
# 使之左对齐
sed 's/^[ \t]*//' # 见本文末尾关于’\t’用法的描述

# 将每一行拖尾的“空白字符”（空格，制表符）删除
sed 's/[ \t]*$//' # 见本文末尾关于’\t’用法的描述

# 将每一行中的前导和拖尾的空白字符删除
sed 's/^[ \t]*//;s/[ \t]*$//'

# 在每一行开头处插入5个空格（使全文向右移动5个字符的位置）
sed 's/^/ /'

# 以79个字符为宽度，将所有文本右对齐
sed -e :a -e 's/^.\{1,78\}$/ &/;ta' # 78个字符外加最后的一个空格

# 以79个字符为宽度，使所有文本居中。在方法1中，为了让文本居中每一行的前
# 头和后头都填充了空格。 在方法2中，在居中文本的过程中只在文本的前面填充
# 空格，并且最终这些空格将有一半会被删除。此外每一行的后头并未填充空格。
sed -e :a -e 's/^.\{1,77\}$/ & /;ta' # 方法1
sed -e :a -e 's/^.\{1,77\}$/ &/;ta’ -e ‘s/\( *\)\1/\1/' # 方法2

# 在每一行中查找字串“foo”，并将找到的“foo”替换为“bar”
sed 's/foo/bar/' # 只替换每一行中的第一个“foo”字串
sed 's/foo/bar/4' # 只替换每一行中的第四个“foo”字串
sed 's/foo/bar/g' # 将每一行中的所有“foo”都换成“bar”
sed 's/\(.*\)foo\(.*foo\)/\1bar\2/' # 替换倒数第二个“foo”
sed 's/\(.*\)foo/\1bar/' # 替换最后一个“foo”

# 只在行中出现字串“baz”的情况下将“foo”替换成“bar”
sed '/baz/s/foo/bar/g'

# 将“foo”替换成“bar”，并且只在行中未出现字串“baz”的情况下替换
sed '/baz/!s/foo/bar/g'

# 不管是“scarlet”“ruby”还是“puce”，一律换成“red”
sed 's/scarlet/red/g;s/ruby/red/g;s/puce/red/g' #对多数的sed都有效
gsed 's/scarlet\|ruby\|puce/red/g' # 只对GNU sed有效

# 倒置所有行，第一行成为最后一行，依次类推（模拟“tac”）。
# 由于某些原因，使用下面命令时HHsed v1.5会将文件中的空行删除
sed '1!G;h;$!d' # 方法1
sed -n '1!G;h;$p' # 方法2

# 将行中的字符逆序排列，第一个字成为最后一字，……（模拟“rev”）
sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//'

# 将每两行连接成一行（类似“paste”）
sed '$!N;s/\n/ /'

# 如果当前行以反斜杠“\”结束，则将下一行并到当前行末尾
# 并去掉原来行尾的反斜杠
sed -e :a -e '/\\$/N; s/\\\n//; ta'

# 如果当前行以等号开头，将当前行并到上一行末尾
# 并以单个空格代替原来行头的“=”
sed -e :a -e '$!N;s/\n=/ /;ta' -e 'P;D'

# 为数字字串增加逗号分隔符号，将“1234567”改为“1,234,567”
gsed ':a;s/\B[0-9]\{3\}\>/,&/;ta' # GNU sed
sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta' # 其他sed

# 为带有小数点和负号的数值增加逗号分隔符（GNU sed）
gsed -r ':a;s/(^|[^0-9.])([0-9]+)([0-9]{3})/\1\2,\3/g;ta'

# 在每5行后增加一空白行 （在第5，10，15，20，等行后增加一空白行）
gsed '0~5G' # 只对GNU sed有效
sed 'n;n;n;n;G;' # 其他sed
~~~

- 选择性地显示特定行：

~~~shell
# 显示文件中的前10行 （模拟“head”的行为）
sed 10q

# 显示文件中的第一行 （模拟“head -1”命令）
sed q

# 显示文件中的最后10行 （模拟“tail”）
sed -e :a -e '$q;N;11,$D;ba'

# 显示文件中的最后2行（模拟“tail -2”命令）
sed '$!N;$!D'

# 显示文件中的最后一行（模拟“tail -1”）
sed '$!d' # 方法1
sed -n '$p' # 方法2

# 显示文件中的倒数第二行
sed -e '$!{h;d;}' -e x # 当文件中只有一行时，输入空行
sed -e '1{$q;}' -e '$!{h;d;}' -e x # 当文件中只有一行时，显示该行
sed -e '1{$d;}' -e '$!{h;d;}' -e x # 当文件中只有一行时，不输出

# 只显示匹配正则表达式的行（模拟“grep”）
sed -n '/regexp/p' # 方法1
sed '/regexp/!d' # 方法2

# 只显示“不”匹配正则表达式的行（模拟“grep -v”）
sed -n '/regexp/!p' # 方法1，与前面的命令相对应
sed '/regexp/d' # 方法2，类似的语法

# 查找“regexp”并将匹配行的上一行显示出来，但并不显示匹配行
sed -n '/regexp/{g;1!p;};h'

# 查找“regexp”并将匹配行的下一行显示出来，但并不显示匹配行
sed -n '/regexp/{n;p;}'

# 显示包含“regexp”的行及其前后行，并在第一行之前加上“regexp”所
# 在行的行号 （类似“grep -A1 -B1”）
sed -n -e '/regexp/{=;x;1!p;g;$!N;p;D;}' -e h

# 显示包含“AAA”、“BBB”或“CCC”的行（任意次序）
sed '/AAA/!d; /BBB/!d; /CCC/!d' # 字串的次序不影响结果

# 显示包含“AAA”、“BBB”和“CCC”的行（固定次序）
sed '/AAA.*BBB.*CCC/!d'

# 显示包含“AAA”“BBB”或“CCC”的行 （模拟“egrep”）
sed -e '/AAA/b' -e '/BBB/b' -e '/CCC/b' -e d # 多数sed
gsed '/AAA\|BBB\|CCC/!d' # 对GNU sed有效

# 显示包含“AAA”的段落 （段落间以空行分隔）
# HHsed v1.5 必须在“x;”后加入“G;”，接下来的3个脚本都是这样
sed -e '/./{H;$!d;}' -e 'x;/AAA/!d;'

# 显示包含“AAA”“BBB”和“CCC”三个字串的段落 （任意次序）
sed -e '/./{H;$!d;}' -e 'x;/AAA/!d;/BBB/!d;/CCC/!d'

# 显示包含“AAA”、“BBB”、“CCC”三者中任一字串的段落 （任意次序）
sed -e ‘/./{H;$!d;}’ -e ‘x;/AAA/b’ -e ‘/BBB/b’ -e ‘/CCC/b’ -e d
gsed ‘/./{H;$!d;};x;/AAA\|BBB\|CCC/b;d’ # 只对GNU sed有效

# 显示包含65个或以上字符的行
sed -n ‘/^.\{65\}/p’

# 显示包含65个以下字符的行
sed -n ‘/^.\{65\}/!p’ # 方法1，与上面的脚本相对应
sed ‘/^.\{65\}/d’ # 方法2，更简便一点的方法

# 显示部分文本——从包含正则表达式的行开始到最后一行结束
sed -n ‘/regexp/,$p’

# 显示部分文本——指定行号范围（从第8至第12行，含8和12行）
sed -n ‘8,12p’ # 方法1
sed ‘8,12!d’ # 方法2

# 显示第52行
sed -n ’52p’ # 方法1
sed ’52!d’ # 方法2
sed ’52q;d’ # 方法3, 处理大文件时更有效率

# 从第3行开始，每7行显示一次
gsed -n ‘3~7p’ # 只对GNU sed有效
sed -n ‘3,${p;n;n;n;n;n;n;}’ # 其他sed

# 显示两个正则表达式之间的文本（包含）
sed -n ‘/Iowa/,/Montana/p’ # 区分大小写方式
~~~

- 选择性地删除特定行：

~~~shell
# 显示通篇文档，除了两个正则表达式之间的内容
sed ‘/Iowa/,/Montana/d’

# 删除文件中相邻的重复行（模拟“uniq”）
# 只保留重复行中的第一行，其他行删除
sed ‘$!N; /^\(.*\)\n\1$/!P; D’

# 删除文件中的重复行，不管有无相邻。注意hold space所能支持的缓存
# 大小，或者使用GNU sed。
sed -n ‘G; s/\n/&&/; /^\([ -~]*\n\).*\n\1/d; s/\n//; h; P’

# 删除除重复行外的所有行（模拟“uniq -d”）
sed ‘$!N; s/^\(.*\)\n\1$/\1/; t; D’

# 删除文件中开头的10行
sed ‘1,10d’

# 删除文件中的最后一行
sed ‘$d’

# 删除文件中的最后两行
sed ‘N;$!P;$!D;$d’

# 删除文件中的最后10行
sed -e :a -e ‘$d;N;2,10ba’ -e ‘P;D’ # 方法1
sed -n -e :a -e ‘1,10!{P;N;D;};N;ba’ # 方法2

# 删除8的倍数行
gsed ‘0~8d’ # 只对GNU sed有效
sed ‘n;n;n;n;n;n;n;d;’ # 其他sed

# 删除匹配式样的行
sed ‘/pattern/d’ # 删除含pattern的行。当然pattern
# 可以换成任何有效的正则表达式

# 删除文件中的所有空行（与“grep ‘.’ ”效果相同）
sed ‘/^$/d’ # 方法1
sed ‘/./!d’ # 方法2

# 只保留多个相邻空行的第一行。并且删除文件顶部和尾部的空行。
# （模拟“cat -s”）
sed ‘/./,/^$/!d’ #方法1，删除文件顶部的空行，允许尾部保留一空行
sed ‘/^$/N;/\n$/D’ #方法2，允许顶部保留一空行，尾部不留空行

# 只保留多个相邻空行的前两行。
sed ‘/^$/N;/\n$/N;//D’

# 删除文件顶部的所有空行
sed ‘/./,$!d’

# 删除文件尾部的所有空行
sed -e :a -e ‘/^\n*$/{$d;N;ba’ -e ‘}’ # 对所有sed有效
sed -e :a -e ‘/^\n*$/N;/\n$/ba’ # 同上，但只对 gsed 3.02.*有效

# 删除每个段落的最后一行
sed -n ‘/^$/{p;h;};/./{x;/./p;}’
~~~

- 特殊应用

~~~shell
# 移除手册页（man page）中的nroff标记。在Unix System V或bash shell下使
# 用’echo’命令时可能需要加上 -e 选项。
sed “s/.`echo \\\b`//g” # 外层的双括号是必须的（Unix环境）
sed ‘s/.^H//g’ # 在bash或tcsh中, 按 Ctrl-V 再按 Ctrl-H
sed ‘s/.\x08//g’ # sed 1.5，GNU sed，ssed所使用的十六进制的表示方法

# 提取新闻组或 e-mail 的邮件头
sed ‘/^$/q’ # 删除第一行空行后的所有内容

# 提取新闻组或 e-mail 的正文部分
sed ‘1,/^$/d’ # 删除第一行空行之前的所有内容

# 从邮件头提取“Subject”（标题栏字段），并移除开头的“Subject:”字样
sed ‘/^Subject: */!d; s///;q’

# 从邮件头获得回复地址
sed ‘/^Reply-To:/q; /^From:/h; /./d;g;q’

# 获取邮件地址。在上一个脚本所产生的那一行邮件头的基础上进一步的将非电邮
# 地址的部分剃除。（见上一脚本）
sed ‘s/ *(.*)//; s/>.*//; s/.*[:<] *//’

# 在每一行开头加上一个尖括号和空格（引用信息）
sed ‘s/^/> /’

# 将每一行开头处的尖括号和空格删除（解除引用）
sed ‘s/^> //’

# 移除大部分的HTML标签（包括跨行标签）
sed -e :a -e ‘s/<[^>]*>//g;/</N;//ba’

# 将分成多卷的uuencode文件解码。移除文件头信息，只保留uuencode编码部分。
# 文件必须以特定顺序传给sed。下面第一种版本的脚本可以直接在命令行下输入；
# 第二种版本则可以放入一个带执行权限的shell脚本中。（由Rahul Dhesi的一
# 个脚本修改而来。）
sed ‘/^end/,/^begin/d’ file1 file2 … fileX | uudecode # vers. 1
sed ‘/^end/,/^begin/d’ “$@” | uudecode # vers. 2

# 将文件中的段落以字母顺序排序。段落间以（一行或多行）空行分隔。GNU sed使用
# 字元“\v”来表示垂直制表符，这里用它来作为换行符的占位符——当然你也可以
# 用其他未在文件中使用的字符来代替它。
sed ‘/./{H;d;};x;s/\n/={NL}=/g’ file | sort | sed ‘1s/={NL}=//;s/={NL}=/\n/g’
gsed ‘/./{H;d};x;y/\n/\v/’ file | sort | sed ‘1s/\v//;y/\v/\n/’

# 分别压缩每个.TXT文件，压缩后删除原来的文件并将压缩后的.ZIP文件
# 命名为与原来相同的名字（只是扩展名不同）。（DOS环境：“dir /b”
# 显示不带路径的文件名）。
echo @echo off >zipup.bat
dir /b *.txt | sed “s/^\(.*\)\.TXT/pkzip -mo \1 \1.TXT/” >>zipup.bat
~~~

- 写入文件

~~~shell
sed 'w outFile' file   #将file的内容写入到outFile中

sed '1,2w outFile' file   #将file第一行到第二行的内容写入到outFile中
~~~


- 从文件读取数据

~~~shell
sed '3r newFile' file   # 将newFile的内容添加到file的流的第三行之后
~~~
