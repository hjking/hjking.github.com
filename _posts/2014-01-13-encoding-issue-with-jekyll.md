---
comments: true
date: 2014-01-13 16:48:00
layout: post
slug: encoding-issue-with-jekyll
title: "Jekyll与中文编码问题"
summary: "新版本jekyll下处理中文编码已经不是问题"
categories: git
tags: [git, github]
---

之前在用jekyll和github pages写博客的时候，一直存在一个问题：如果有中文，那么是以GBK编码读取的，所以读取utf-8文件编码会报错。在网上搜索了很多答案，不外乎修改jekyll代码里的读取文件的代码，给它加上编码参数，如utf-8。但是这个方法不是很管用，有时候依然不能解决问题。

最近在网上搜索发现，有人提到了新版jekyll已经支持在\_config.yml里配置文件编码了，只需在\_config.yml写入如下配置即可（默认未配置）：

    encoding: utf-8

然后问题就迎刃而解了。

<!-- more -->

