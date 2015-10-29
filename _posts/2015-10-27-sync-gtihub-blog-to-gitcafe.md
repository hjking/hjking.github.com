---
comments: true
tags:
  - github
  - gitcafe
  - blog
  - git
categories:
  - tool
summary: "Sync github blog to gitcafe"
title: "同步github上的博客到gitcafe"
layout: post
---

## 原因：

什么？你问原因？地球人都知道的：由于众所周知的原因，访问 github 的速度很慢，所以为了提高访（用）问（户）速（体）度（验），就把 blog 从 github 同步到 gitcafe 上。


## 操作过程：

### 建立 gitcafe 项目

创建一个与用户名 (如果是组织，就是组织名) 相同名称的项目 repo。如果你创建的项目名与用户名相同，GitCafe 会自动识别成这是一个 Page 项目

<!-- more -->

### 添加一个 git remote 源

push 博客内容到 github 时，也把它 push 到 gitcafe 上。进入本地博客项目目录，执行以下代码：

{% highlight bash %}
git remote add gitcafe git@gitcafe.com:username/username.git
{% endhighlight %}

上面代码添加了一个名为 `gitcafe` 的远程仓库，执行一次就可以。此时如果打开目录下的 `.git/config` ，会发现增加了一下内容：

~~~
  [remote "gitcafe"]
    url = git@gitcafe.com:username/username.git
    fetch = +refs/heads/*:refs/remotes/gitcafe/*
~~~

### push 到 gitcafe

当博客有更新时，先提交，然后依次 push 到 github 和 gitcafe 上。

{% highlight bash %}
git push origin master
git push gitcafe master:gitcafe-pages
{% endhighlight %}

第一行： push 当前 master 分支到 github 的 master 分支。

第二行： push 当前 master 分支到 gitcafe 的 gitcafe-pages 分支。


## 参考
1. [博客迁移回国内的Gitcafe Page](http://www.besteric.com/2014/11/16/build-blog-mirror-site-on-gitcafe/)
2. [同步github上的项目到gitcafe](http://cxh.me/2014/06/28/gitsync-github-gitcafe/)
3. [将博客从GitHub迁移到GitCafe](http://blog.devtang.com/blog/2014/06/02/use-gitcafe-to-host-blog/)
