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

- [pathogen](https://github.com/tpope/vim-pathogen)

  该插件用来管理Vim的插件，可以让插件的安装与卸载更加方便。配合Github和Submodule效果更佳。

- [NERDTree](https://github.com/scrooloose/nerdtree)

  该插件会生成工程目录树，显示树形结构。

- [Tabularize](https://github.com/godlygeek/tabular)

  格式化对齐文本。

- [EasyMotion](https://github.com/easymotion/vim-easymotion)

  提供在文件中快速跳转和定位位置。

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

- [ctrlp](https://github.com/kien/ctrlp.vim)

  搜索目录下的文件，没有依赖于其他语言，轻量级的。

- [CamelCaseMotion](https://github.com/henrik/CamelCaseMotion)

- [a](https://github.com/vim-scripts/a.vim)

  让cpp文件在.h和.cpp文件中切换。

- expand region
- gundo
- multiple-cursors

- [neocomplcache](https://github.com/Shougo/neocomplcache)

  关键字补全、文件路径补全、tag补全等等，各种，非常好用，速度超快。[neocomplete](https://github.com/Shougo/neocomplete.vim) 也不错，但是它是基于lua的。

- unite
- [fugitive](https://github.com/tpope/vim-fugitive.git)

  方便在Vim里面使用Git的插件。

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