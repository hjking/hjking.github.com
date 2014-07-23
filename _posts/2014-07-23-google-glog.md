---
comments: true
tags:
  - google
  - log
categories:
  - code
summary: "Google Log System"
title: "Google 开源 C++ 日志系统"
layout: post
---

glog 是 google 的开源 C++ 日志系统。

## 项目地址

[glog](https://code.google.com/p/google-glog/)

## 安装

安装到系统，需要root权限

{% highlight bash linenos %}
    tar zxvf glog-0.3.3.tar.gz
    ./configure
    make
    make install
{% endhighlight %}

安装到用户主目录

{% highlight bash linenos %}
    tar zxvf glog-0.3.3.tar.gz
    ./configure --prefix=/home/username/app/glog
    make
    make install
{% endhighlight %}

安装完成后，设置LB_LIBRARY_PATH环境变量，添加glog的lib目录。

{% highlight bash linenos %}
    export LD_LIBRARY_PATH=/home/username/app/glog/lib:${LD_LIBRARY_PATH}
{% endhighlight %}

## 说明

glog默认对log分为4级：INFO，WARNING，ERROR，FATAL。打印log语句类似于C++中的stream。

## 简单示例

`main.cc`

{% highlight c linenos %}
    #include <iostream>
    #include "glog/logging.h"
    using namespace std;
    int main(int argc, char** argv) {
      // Initialize Google's logging library.
      google::InitGoogleLogging(argv[0]);

      LOG(INFO) << "hello glog";
    }
{% endhighlight %}

`Makefile`

{% highlight bash linenos %}
    LIB=/home/username/app/glog/lib
    INCLUDE=/home/username/app/glog/include
    glog.x : main.o
        g++ -o $@ $^ -L$(LIB) -lglog –lpthread
    main.o: main.cc
        g++ -c -o $@ $^ -I$(INCLUDE)
{% endhighlight %}

编译运行上述demo， glog默认会在/tmp/目录下生成log日志文件：glog.x.dell14.username.log.INFO.20140723-101911.2533

文件名各字段对应含义为：`<program name>.<hostname>.<user name>.log.<severity level>.<date>.<time>.<pid>`。

其中：

- `program name` 其实对应代码里 google::InitGoogleLogging(argv[0])中的argv[0]，即通过改变 google::InitGoogleLogging 的参数可以修改日志文件的名称。

- 每个级别的日志会输出到不同的文件中。并且高级别日志文件会同样输入到低级别的日志文件中。 即：FATAL的信息会同时记录在INFO，WARNING，ERROR，FATAL日志文件中。默认情况下，glog还会将会将FATAL的日志发送到stderr中。

## 参数设置

### 设置方法
- 如果安装了 [Google gflags](https://code.google.com/p/gflags/)，则可以采用命令的方式来来配置参数。
    ./your_application --log_dir=.

- 修改环境变量：`export GLOG_log_dir=.`。log文件将生成到当前目录下。或者，运行前设置：GLOG_logtostderr=1 ./your_application。 通过环境变量设置时，在参数前加上 `GLOG_` 。

- 在代码中修改：在参数前加上 `FLAGS_` 。如 ` FLAGS_log_dir = "/some/log/directory"; ` （设置FLAGS_log_dir时，必须在调用google::InitGoogleLogging之前）

### 常用参数
- logtostderr：log输出到stderr，而不是文件中。
- stderrthreshold：处于或超过此设置的级别的log将输出到stderr。log级别分为INFO, WARNING, ERROR, 和 FATAL，对应值为 0, 1, 2, and 3。
- minloglevel：记录处于或高于此级别的log。 
- log_dir：设置log保存目录。
