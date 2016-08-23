---
comments: true
tags:
  - vim
  - verilog
  - systemverilog
  - UVM
  - ctags
categories:
  - tool
summary: "使用 Vim 编写 Verilog/SystemVerilog"
title: "使用 Vim 编写 Verilog/SystemVerilog"
layout: post
---

由于 VIM 自身对 Verilog/SystemVerilog 的支持不是很完美，所以需要额外配置一下，本文记录了我在使用过程中一些常用的配置。其中用到了一些第三方插件和网上的代码片段。

### 语法高亮

使用插件 [verilog_systemverilog](https://github.com/vhda/verilog_systemverilog.vim) 。增加了语法高亮等。

### 文件浏览

安装插件[nerdtree](https://github.com/scrooloose/nerdtree)，通过运行命令 `NERDTree` 可以在VIM中打开文件浏览，方便在文件间切换。

### tag 跳转

首先得利用 `ctags` 到生成 TAGS 文件。

如果是使用 [exuberant-ctags](http://ctags.sourceforge.net/)，默认是不识别 verilog 和 SystemVerilog 代码的。需要通过修改配置文件，增加语法识别。

编辑 `~/.ctags`， 添加以下代码：

~~~shell
--exclude=.SOS
--exclude=.git
--exclude=nobackup
--exclude=nobkp
--exclude=results
--exclude=*.log

--langdef=SystemVerilog
--langmap=SystemVerilog:.sv.v.svh.tv.vg.vinc

--regex-SystemVerilog=/^\s*(\b(static|local|virtual|protected)\b)*\s*\bclass\b\s*(\b\w+\b)/\3/c,class/
--regex-SystemVerilog=/^\s*(\b(static|local|virtual|protected)\b)*\s*\btask\b\s*(\b(static|automatic)\b)*\s*(\w+::)*\s*(\b\w+\b)/\6/t,task/
--regex-SystemVerilog=/^\s*(\b(static|local|virtual|protected)\b)*\s*\bfunction\b\s*(\b(\w+)\b)*\s*(\w+::)*\s*(\b\w+\b)/\6/f,function/

--regex-SystemVerilog=/^\s*\bmodule\b\s*(\b\w+\b)/\1/m,module/
--regex-SystemVerilog=/^\s*\bprogram\b\s*(\b\w+\b)/\1/p,program/
--regex-SystemVerilog=/^\s*\binterface\b\s*(\b\w+\b)/\1/i,interface/
--regex-SystemVerilog=/^\s*\btypedef\b\s+.*\s+(\b\w+\b)\s*;/\1/e,typedef/
--regex-SystemVerilog=/^\s*`define\b\s*(\w+)/`\1/d,define/
--regex-SystemVerilog=/}\s*(\b\w+\b)\s*;/\1/e,typedef/

--regex-SystemVerilog=/^\s*(\b(static|local|private|rand)\b)*\s*(\b(shortint|int|longint)\b)\s*(\bunsigned\b)?(\s*\[.+\])*\s*(\b\w+\b)/\7/v,variable/
--regex-SystemVerilog=/^\s*(\b(static|local|private|rand)\b)*\s*(\b(byte|bit|logic|reg|integer|time)\b)(\s*\[.+\])*\s*(\b\w+\b)/\6/v,variable/
--regex-SystemVerilog=/^\s*(\b(static|local|private)\b)*\s*(\b(real|shortreal|chandle|string|event)\b)(\s*\[.+\])*\s*(\b\w+\b)/\6/v,variable/
--regex-SystemVerilog=/(\b(input|output|inout)\b)?\s*(\[.+\])*\s*(\b(wire|reg|logic)\b)\s*(\[.+\])*\s*(#(\(.+\)|\S+)\))?\s*(\b\w+\b)/\9/v,variable/
--regex-SystemVerilog=/(\b(parameter|localparam)\b).+(\b\w+\b)\s*=/\3/a,parameter/

--SystemVerilog-kinds=+ctfmpied

--languages=SystemVerilog,C,C++,HTML,Lisp,Make,Perl,Python,Sh
~~~

然后就可以运行 ctags 产生 TAGS 文件： `ctags -Re --languages=SystemVerilog -f my.tags /path/to/your/source/code`

之后配置 VIM， 使 VIM 能读到已经产生的 TAGS 文件:

~~~vim
set tags+=./my.tags
~~~

以后在 VIM 中打开代码时，就可以通过 `CTRL-]` 跳转到当前光标处的变量/函数等的定义位置。

### 在module和endmodule间跳转

在 VIM 中，可以通过 `%` 在匹配的 `( 与 ) ，{ 与 } ， [ 与 ]` 间跳转。增加以下配置后，可以实现在 module 与 endmodule，task 与 endtask等之间跳转。

~~~
runtime! macros/matchit.vim
if exists('loaded_matchit')
  let b:match_ignorecase=0
  let b:match_words=
    \ '\<begin\>:\<end\>,' .
    \ '\<if\>:\<else\>,' .
    \ '\<module\>:\<endmodule\>,' .
    \ '\<class\>:\<endclass\>,' .
    \ '\<program\>:\<endprogram\>,' .
    \ '\<clocking\>:\<endclocking\>,' .
    \ '\<property\>:\<endproperty\>,' .
    \ '\<sequence\>:\<endsequence\>,' .
    \ '\<package\>:\<endpackage\>,' .
    \ '\<covergroup\>:\<endgroup\>,' .
    \ '\<primitive\>:\<endprimitive\>,' .
    \ '\<specify\>:\<endspecify\>,' .
    \ '\<generate\>:\<endgenerate\>,' .
    \ '\<interface\>:\<endinterface\>,' .
    \ '\<function\>:\<endfunction\>,' .
    \ '\<task\>:\<endtask\>,' .
    \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
    \ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
    \ '`ifdef\>:`else\>:`endif\>,'
endif
~~~
