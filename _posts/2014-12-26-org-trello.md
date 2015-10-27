---
comments: true
tags:
  - emacs
  - trello
  - tool
categories:
  - tool
summary: "使用org-trello管理Trello"
title: "使用org-trello管理Trello"
layout: post
---

本文将介绍使用 `Emacs` 配合 `org-trello` 来管理 `Trello`。

## 链接
- [org-mode](http://orgmode.org/)
- [Trello](http://trello.com/)
- [org-trello](https://org-trello.github.io/)

## 安装
使用 `package` 包管理插件安装，我将假设你已经配置好了插件仓库 `melpa`。在 *Emacs* 中 `M-x package-install RET org-trello RET` 就可下载 `org-trello` 软件包。

## 配置
在 `init.el` 中添加以下内容：

```emacs-lisp
(require 'org-trello)
```

*注意：* 不建议所有的 org file 都启用 org-trello 模式，利用以下配置使 `org-trello` 只对特定文件有效。

```emacs-lisp
(custom-set-variables '(org-trello-files '("/path/to/file0" "/path/to/file1")))
```

当打开 _file0_ 和 _file1_ 时，`org-trello` 才会激活。

## 使用
### 获取Trello授权
为了使 `org-trello` 能够访问 `Trello`，并能操作 `Trello` 的 `board` ，需要从 `Trello` 获取 *consumer-key* 和 *access-token*。使用快捷键 **C-c o i**，或者运行命令 **org-trello/install-key-and-token** , 此时默认浏览器会打开 `Trello` 的相关页面，复制 *Key* 部分的字符串，粘贴到 *Emacs* 的 *minibuffer* ，之后又会打开一个 `org-trello` 请求 `Trello` 授权的页面，点击 *Allow*, 浏览器会跳转至显示 `access-token` 页面，复制粘贴到 `Emacs` 的 `minibuffer`，回车。以上过程至需要执行一次即可。

### 与Trello的board相关联
每一个 org 文件都需要与一个 `Trell` 的 `board` 相关联。

#### 与已有的board相关联
打开一个 org 文件，执行：**C-c o I** 或者 **M-x org-trello/install-board-metadata** ，Emacs会在minibuffer中返回一个已有board的列表，输入你想要同步的board对应的编号即可。

**注意：** 确保board中的list名称和 `org` 中设置的 `org-todo-keywords` 保持一致，否则会同步出错。

<!-- more -->

#### 新建一个board
执行：**C-c o b** 或者 **M-x org-trello/create-board-and-install-metadata** 。该命令会根据 org 中设置的 `org-todo-keywords` 建立对应的 board list。

### 同步org文件和Trello
#### 从Trello同步到 org 缓冲
- 执行：**C-u C-c o s** 或者 **C-u M-x org-trello/sync-buffer** 会将Trello的board内容同步到org文件缓冲里。
- **C-u C-c o c** 或者 **C-u C-c o C** 从Trello同步card内容。

#### 同步org文件至Trello
- 执行：**C-c o c** 或者 **C-c o C** 将会把本地org条目同步至board中对应list下的card。
- 执行：**C-c o s** 将同步整个org文件缓冲同步至board。




