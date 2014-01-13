---
comments: true
date: 2013-09-16 17:35:00
layout: post
slug: install-mutt-and-msmtp-on-centos
title: "Using Gmail on CentOS with mutt and msmtp"
summary: "This post shows how to receive/send email using Gmail on CentOS with mutt and msmtp."
image: 'why-its-important-to-know-how-to-use-your-tools/cover.png'
categories: admin
tags: [gmail, mutt, msmtp, centos, mail]
---

## System Environment
	CentOS release 5.5 x64 (Final)

## Software Environment
	1. Mutt 1.4.2.2-3.0.2.el5.x86_64

	2. gnutls-1.4.1-3.el5_4.8.x86_64

	3. [libgsasl-1.4.4-1.el5.x86_64.rpm](http://flexbox.sourceforge.net/centos/5/x86_64/)

	4. [libntlm-1.2-1.el5.x86_64.rpm](http://flexbox.sourceforge.net/centos/5/x86_64/)

	5. [msmtp-1.4.23](http://msmtp.sourceforge.net/)

## Install
### Install dependence
	{% highlight bash linenos %}
	[root@localhost ~]# rpm -ivh libgsasl-1.4.4-1.el5.x86_64.rpm
	[root@localhost ~]# rpm -ivh libntlm-1.2-1.el5.x86_64.rpm
	{% endhighlight %}

### Install msmtp
	{% highlight bash linenos %}
	tar xjf msmtp-1.4.23.tar.bz2
　　cd msmtp-1.4.23
　　./configure
　　make
　　make install
	{% endhighlight %}

## Setting
### Mutt Setting

	{% highlight bash linenos %}
	vim ~/.muttrc
	{% endhighlight %}

	{% highlight bash linenos %}
	set from = "username@gmail.com"
	set realname = "YourName"

	set imap_user = "username@gmail.com"
	set imap_pass = "password"

	set folder = "imaps://imap.gmail.com:993"
	set spoolfile = "+INBOX"
	set postponed = "+[Gmail]/Drafts"
	set certificate_file = ~/.mutt/certificates

	set sendmail="/usr/local/bin/msmtp"
	set use_from=yes
	set envelope_from=yes

	set move = no
	set imap_keepalive = 900

	set charset=”UTF-8″

	set send_charset=”UTF-8″

	set locale=”zh_CN.UTF-8″

	charset-hook ^us-ascii$ gb2312

	charset-hook !UTF-8 gb2312

	set sort=reverse-threads
	set sort_aux=last-date-received
	set editor = "vim"

	{% endhighlight %}

### msmtp Setting
	{% highlight bash linenos %}
	touch ~/.msmtp.log
	vim ~/.msmtprc
	chmod 600 ~/.msmtprc
	{% endhighlight %}

	{% highlight vim linenos %}
	defaults

	logfile ~/.msmtp.log

	#Gmail

	account gmail

	tls on
	auth on

	host smtp.gmail.com
	port 587

	from username@gmail.com
	tls_certcheck off

	user username
	password password

	account default : gmail
	{% endhighlight %}


## Test
	{% highlight bash %}
	echo "test" | mutt -s " first_test" test2@domain.com
	{% endhighlight %}

## Refrence
　　1. http://blitiri.com.ar/p/other/mutt-labels/

　　2. http://blog.chinaunix.net/space.php?uid=145571&do=blog&id=2798800

　　3. http://mutt.blackfish.org.uk/

　　4. http://www.mutt.org/

　　5. http://xhc.me/wp-content/uploads/mutt/manual_1.5.19_zh.html

　　6. http://docs.huihoo.com/homepage/shredderyin/mutt_frame.html

　　7. http://msmtp.sourceforge.net/