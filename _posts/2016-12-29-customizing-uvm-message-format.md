---
comments: true
tags:
  - uvm
  - sv
categories:
  - IC
summary: "自定义 UVM 打印信息的格式"
title: "自定义 UVM 打印信息的格式"
layout: post
---

## 默认格式

默认情况下，当我们调用 `uvm_info 宏时，打印信息格式如下:

>  # UVM_INFO my_uvm_report.sv(83) @ 0: reporter [top] This is a message from top.
>  # UVM_INFO my_uvm_report.sv(68) @ 0: uvm_test_top [my_test] This is a message from my_test.
>  # UVM_INFO my_uvm_report.sv(39) @ 0: uvm_test_top.my_env_h [my_env] This is a message from my_env.

## 自定义格式

通过重载 `uvm_report_server` 类的 `compose_message` 函数可以达到目的。 首先创建一个继承自 `uvm_report_server` 的 `my_report_server` 类，在类中实现 `compose_message` 函数。 需要注意的是对 `uvm_severity` 类型的 severity 做了强制转换为 `uvm_severity_type`，为的是显示打印类型。

~~~ verilog
class my_report_server extends uvm_report_server;
   virtual function string compose_message( uvm_severity severity,
                                            string name,
                                            string id,
                                            string message,
                                            string filename,
                                            int line );
      uvm_severity_type severity_type = uvm_severity_type'( severity );
      return $psprintf( "%-8s | %16s | %2d | %0t | %-21s | %-7s | %s",
             severity_type.name(), filename, line, $time, name, id, message );
   endfunction: compose_message
endclass: my_report_server
~~~

## 如何使用自定义格式

使用 `my_report_server` 替换 `uvm_report_server`。 `uvm_report_server` 是一个全局 server，处理由 `uvm_report_handler` 句柄产生的打印信息。

首先, 实例化 `my_report_server`。 然后，通过 `uvm_report_server` 的静态函数 `set_server()` 设置 `my_server` 为全局。这里，我们在 testcase 的 `start_of_simulation()` 函数中做以上处理。

~~~ verilog
class my_test extends uvm_test;
   // ...
   function void start_of_simulation();
      my_report_server my_server = new;
      uvm_report_server::set_server( my_server );
   endfunction: start_of_simulation
endclass: my_test
~~~

现在的打印信息格式如下:

>  # UVM_INFO my_uvm_report.sv(83) @ 0: reporter [top] This is a message from top.
>  # UVM_INFO | my_uvm_report.sv | 68 | 0 | uvm_test_top          | my_test | This is a message from my_test.
>  # UVM_INFO | my_uvm_report.sv | 39 | 0 | uvm_test_top.my_env_h | my_env  | This is a message from my_env.

需要注意的是，由于我们是在testcase里替换的，第一行的打印是在替换之前调用的。