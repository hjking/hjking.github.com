---
comments: true
date: 2013-09-13 21:39:00
layout: post
slug: highlight-code-with-google-code-prettify
title: "Highlight Code with Google-code-prettify"
summary: "This post shows how to highlight code with google-code-prettify in Jekyll."
categories: jekyll
tags: [jekyll, prettify]
---

本文介绍在Jekyll中使用[google-code-prettify](https://code.google.com/p/google-code-prettify/)来高亮显示代码。

#### 1.下载google-code-prettify

直接到[google-code-prettify](https://code.google.com/p/google-code-prettify/)官网下载代码，解压后放到项目里。

#### 2.加载css和js

    <link rel="stylesheet" href="/assets/google-code-prettify/prettify.css">
    <script src="/assets/google-code-prettify/prettify.js"></script>
    <body onload="prettyPrint()">

还可以使用自动加载，具体可参考[Wiki](https://code.google.com/p/google-code-prettify/wiki/GettingStarted)。

#### 3.更换主题
只要更换加载的prettify.css即可，可以到[这里](http://google-code-prettify.googlecode.com/svn/trunk/styles/index.html)选择自己喜欢的主题，然后在google-code-prettify目录下styles里找到对应的css文件加载即可。比如：

    <link rel="stylesheet" href="/assets/google-code-prettify/styles/desert.css">

#### 4.示例

<code class="prettyprint">
    class Voila {
        public:
        // Voila
            static const string VOILA = "Voila";

        // will not interfere with embedded tags.
    }
</code>

<pre class="prettyprint linenums">
    Many
    lines
    of
    code
</pre>

<pre class="prettyprint linenums">
    <script>
        $(window).load(function () {
            $("pre").addClass("prettyprint linenums"); // line number and highlight
            prettyPrint();
        });
    </script>
</pre>

<pre class="prettyprint lang-html">
  The lang-* class specifies the language file extensions.
  File extensions supported by default include
    "bsh", "c", "cc", "cpp", "cs", "csh", "cyc", "cv", "htm", "html",
    "java", "js", "m", "mxml", "perl", "pl", "pm", "py", "rb", "sh",
    "xhtml", "xml", "xsl".
</pre>


<pre class="prettyprint lang-vhdl linenums">

    module encoder(clk, rstn, ilevel, ivld, irdy, imsg, ilen, ovld, ordy, omsg, olen, olevel);
     input             clk;
     input             rstn;
     input[6:0]      ilevel;
     input             ivld;
     output            irdy;
     input[16383:0]      imsg;
     input[13:3]      ilen;//len-1
     output reg        ovld;
     input             ordy;
     output reg[16383:0] omsg;
     output reg[13:3] olen;//len-1
     output reg[6:0] olevel;

    reg           dfirst;
    reg           dv;
    reg [13:3]   iptr;

    wire        iv    = ivld&irdy;
    wire        dlast = iptr==0;
    wire[7:0] din   = imsg[iptr*8+:8];
    wire        pvld;
    wire        plast;
    wire[7:0] pout;
    reg         prdy;
    always @(posedge clk)
          prdy <= ($random & 'h3f)!=0;
    //wire        prdy  = 1'b1;
    wire        pv    = pvld&prdy;
    wire        plast_v = plast & pv;
    wire        start = !(dv||pvld&&!plast_v)&&ivld&&ordy;
    assign      irdy  = dv&dlast;

    always @(posedge clk)
        if(start)      iptr<=ilen;
        else if(dv)    iptr<=iptr-1;

    always @(posedge clk)
      dfirst <= start;

    always @(posedge clk)
      if(!rstn)      dv <= 0;
      else if(start) dv <= 1;
      else if(dlast) dv <= 0;

    always @(posedge clk)
        if(dv&&dlast) begin
              omsg    <= imsg;
              olen    <= ilen;
              olevel  <= ilevel;
              end
        else if(pv) begin
              omsg <= {omsg,pout};
              olen <= olen+1;
              end

    always @(posedge clk)
        if(!rstn)         ovld <= 0;
        else if(plast_v)  ovld <= 1;
        else if(ordy)     ovld <= 0;

    bch_enc u_enc(.clk(clk),.rstn(rstn),
            .ilevel(ilevel),.ifirst(dfirst),.ilast(dlast),.ivalid(dv),.idata(din),
            .ovalid(pvld),.oready(prdy),.odata(pout),.olast(plast),.ocnt());

    endmodule

</pre>