---
layout: page
title: UVM
---

## 书籍

- SystemVerilog验证，第二版

- UVM实战，张强

- 芯片验证漫游指南，刘斌

- The UVM Primer

- Pratical UVM step by step examples

- A Prtical Guide to Adopting the universal verification methodology (UVM) second edition

- ASIC/SOC functional design verification

- systemverilog assertions and functional coverage

## 学习资源

- 首推“验证学院”，由Mentor编写，有Cookbook，有视频教程。

    https://verificationacademy.com/

- “验证指导”，包括SystemVerilog教程、UVM教程、SystemC教程等。

    https://www.verificationguide.com/p/home.html

- “ASIC World”的SV教程，据说这个网站每月有超过3百万的浏览量。

    http://www.asic-world.com/systemverilog/tutorial.html

- doulos教程

    https://www.doulos.com/knowhow/sysverilog/

    https://www.doulos.com/knowhow/sysverilog/uvm/

- UVM candy lovers 教程

    http://cluelogic.com/category/uvm/

    http://cluelogic.com/2011/07/uvm-tutorial-for-candy-lovers-overview/

    https://github.com/cluelogic/uvm-tutorial-for-candy-lovers

- chipverify

    https://www.chipverify.com/system-verilog/system-verilog

    https://www.chipverify.com/uvm/uvm-tutorial

- uvm tutorial

    http://uvmtutorial.com/

- UVM教程

    http://www.testbench.in/UT_00_INDEX.html

## UVM仿真参数
### UVM Compile options

    - +UVM_REPORT_DISABLE_FILE
    - +UVM_REPORT_DISABLE_LINE
    - +UVM_REPORT_DISABLE_FILE_LINE

### UVM runtime options

    - +UVM_TESTNAME :
    - +UVM_VERBOSITY :  allows the user to specify the initial verbosity for all components
    - +UVM_TIMEOUT : allows users to change the global timeout of the UVM framework
    - +UVM_MAX_QUIT_COUNT : allows users to change max quit count for the report server
    - +UVM_CONFIG_DB_TRACE : turns on tracing of configuration DB access
    - +UVM_DUMP_CMDLINE_ARGS
    - +UVM_OBJECTION_TRACE :  turns on tracing of objection activity
    - +UVM_PHASE_TRACE : turns on tracing of phase executions
    - +UVM_RESOURCE_DB_TRACE : turns on tracing of resource DB access
    - +uvm_set_config_int
    - +uvm_set_config_string
    - +uvm_set_inst_override
    - +uvm_set_type_override
    - +uvm_set_verbosity
        +uvm_set_verbosity=<comp>,<id>,<verbosity>,<phase> and +uvm_set_verbosity=<comp>,<id>,<verbosity>,time,<time> allow the users to manipulate the verbosity of specific components at specific phases
    - +uvm_set_action
    - +uvm_set_severity



