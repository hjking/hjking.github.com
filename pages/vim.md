---
layout: page
title: Vim
---

# Vim

some description


## Distributions

Vim distributions are Vim + custom settings + custom plugins from certain authors and are therefore very opinionated.

- [cream](http://cream.sourceforge.net/)

  A modern configuration of the powerful and famous Vim, Cream is for Microsoft Windows, GNU/Linux, and FreeBSD.

- [janus](https://github.com/carlhuda/janus)

  This is a distribution of plug-ins and mappings for Vim, Gvim and MacVim.

  It is designed to provide minimal working environment using the most popular plug-ins and the most common mappings.

  The distribution is completely customisable using a ~/.vimrc.before and ~/.vimrc.after Vim RC files.

- [spf13](https://github.com/spf13/spf13-vim)

  spf13-vim is a distribution of vim plugins and resources for Vim, Gvim and MacVim.

  It is a good starting point for anyone intending to use VIM for development running equally well on Windows, Linux, *nix and Mac.

  The distribution is completely customisable using a ~/.vimrc.local, ~/.vimrc.bundles.local, and ~/.vimrc.before.local Vim RC files.

## Featured Plugins

### 插件管理器

- [pathogen](https://github.com/tpope/vim-pathogen)

  该插件用来管理Vim的插件，可以让插件的安装与卸载更加方便。配合Github和Submodule效果更佳。

### 文件，代码搜索工具

- [ctrlp](https://github.com/kien/ctrlp.vim)

  搜索目录下的文件，没有依赖于其他语言，轻量级的。

### 自动补全

- [neocomplcache](https://github.com/Shougo/neocomplcache)

  关键字补全、文件路径补全、tag补全等等，各种，非常好用，速度超快。[neocomplete](https://github.com/Shougo/neocomplete.vim) 也不错，但是它是基于lua的。

- [neocomplete](https://github.com/Shougo/neocomplete.vim)
  需要Vim支持Lua

-[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

  前Google的C++工程师Valloric (Val Markovic) 开发的一款，专门用于C系（C,C++,C#) 的自动补全工具, 优点是速度非常快，而且支持变量跳转，函数关联跳转，检测代码报错, 可以说是最牛逼的补全工具，缺点是太难配置，对于除了C系语言的其他语言补全支持并不好. 对于刚接触Vim的同学来说相当不友好, 不过文档比较齐全.

### 代码检测

### 代码对齐，格式化

- [Tabularize](https://github.com/godlygeek/tabular)

  格式化对齐文本。可以将常用的格式，排版方式做成键位映射，更加方便，速度感人.

- [vim-easy-align](https://github.com/junegunn/vim-easy-align)

  代码排版，格式化插件， 它参考了tabular, 并且集成了tabular的优点，同时集成了自己的一套规则方法，有一定的学习成本，适合想装逼，想挑战的同学，本文作者没用过，所以就不吹牛逼了

### 极速跳转

- [EasyMotion](https://github.com/easymotion/vim-easymotion)

  提供在文件中快速跳转和定位位置。

- [CamelCaseMotion](https://github.com/henrik/CamelCaseMotion)

- [wildfire](https://github.com/Shougo/wildfire.vim)

  快速的就近选择一个候选文本对象，并能通过快捷键继续简单的扩大文本对象范围。

- [vim-expand-region](https://github.com/terryma/vim-expand-region)

  快速选择文本。

- [vim-sneak](https://github.com/justinmk/vim-sneak)

  我们知道, vim中F和f 键位只能快速定位当前行，对。仅仅只是当前这一行，但是sneak 可以使其完全支持多行 f 和 F 进行跳转！

- [incsearch.vim](https://github.com/haya14busa/incsearch.vim)

  作者haya14busa (haya14busa)是个日本萌妹， incsearch 是增强vim 中自带的 ? 和 ／ 搜索功能， 并且支持更加高级的正则表达式匹配, vim默认搜索是只能高亮一个当前匹配的字符，但是incsearch却可以同时高亮所有匹配的字符！！！

### 版本控制

- [gitv](https://github.com/gregsexton/gitv)

  展开项目的Git Tree ，需要 vim-git 和vim-fugitive 的支持

- [fugitive](https://github.com/tpope/vim-fugitive.git)

  方便在Vim里面使用Git的插件。

### 文本处理

- [vim-surround](https://github.com/tpope/vim-surround)

  快速添加，删除，修改 [ ] {} "" '' ，XML tag， HTML tags等。

  cs"'   : "Hello world!"   ->    'Hello world!'
  cs'<q> : 'Hello world!'   ->    <q>Hello world!<q>
  ds"    : "Hello world!"   ->    Hello world!
  ysiw]  : Hello world!     ->    [Hello] world!
  cs]{   : [Hello] world!   ->    { Hello } world!
  yssb or yss) : { Hello } world!  ->  ({ Hello } world!)
  ds{ds) : ({ Hello } world!)  ->  Hello world!

- [multiple-cursors]()

  多重选取,多光标输入。在 Normal模式下按 Ctrl-n 高亮选中当前光标下的单词，并且将光标放在单词尾部；继续按，会选中下一个重复的单词。如果在Visual模式下选中一行, 按 Ctrl-n 选中每一相同行，并将光标放在末尾，并回到 Normal 模式。

- [gundo](https://github.com/sjl/gundo.vim)

  显示撤销树浏览器。


### 编程相关

- [a](https://github.com/vim-scripts/a.vim)

  让cpp文件在.h和.cpp文件中切换。

- [vim-commentary]()

  快速注释插件，绝对改善生活, 但是在HTML文件中还是有小bug的

- [NERDTree](https://github.com/scrooloose/nerdtree)

  该插件会生成工程目录树，显示树形结构。

- [Tagbar](https://github.com/majutsushi/tagbar)

  该插件生成函数、变量列表。

- [NERDCommenter](https://github.com/scrooloose/nerdcommenter)

  注释代码的插件。

  - [count]<leader>cc |NERDComComment|

    Comment out the current line or text selected in visual mode.

  - [count]<leader>cn |NERDComNestedComment|

    Same as cc but forces nesting.

  - [count]<leader>c<space> |NERDComToggleComment|

    Toggles the comment state of the selected line(s). If the topmost selected line is -   commented, all selected lines are uncommented and vice versa.

  - [count]<leader>cm |NERDComMinimalComment|

    Comments the given lines using only one set of multipart delimiters.

  - [count]<leader>ci |NERDComInvertComment|

    Toggles the comment state of the selected line(s) individually.

  - [count]<leader>cs |NERDComSexyComment|

    Comments out the selected lines with a pretty block formatted layout.

  - [count]<leader>cy |NERDComYankComment|

    Same as cc except that the commented line(s) are yanked first.

  - <leader>c$ |NERDComEOLComment|

    Comments the current line from the cursor to the end of line.

  - <leader>cA |NERDComAppendComment|

    Adds comment delimiters to the end of line and goes into insert mode between them.

  - <leader>ca |NERDComAltDelim|

    Switches to the alternative set of delimiters.

  - [count]<leader>cl
  - [count]<leader>cb |NERDComAlignedComment|

    Same as \|NERDComComment\| except that the delimiters are aligned down the left side (<leader- >  cl) or both sides (<leader>cb).

  - [count]<leader>cu |NERDComUncommentLine|

    Uncomments the selected line(s).

### 其他

- unite

- [vim-airline](https://github.com/vim-airline/vim-airline)
  各种line已经成为过去，基本 airline 已经实现了统一 ，同时支持各种插件，当然带来的负担就是会导致vim启动慢了一点. 当然如果要用vim装逼的话，这个是必不可少的.

- [vim-repeat]

  点命令( . 重复上一次修改)的扩展

- [delimitMate](https://github.com/Raimondi/delimitMate.git)

  成对生成(),{},[]


## Customize

### Custom Settings

### Misc

## Other Awesome Stuff

### Colors

### Additional Syntaxes

## Tips

### 调试

- 查看启动时间

  加上参数 _--startuptime file.log_ ，file.log是指定的log文件。

- 查看加载的插件

  在vim中运行 _scriptnames_ 。

- Tip 2