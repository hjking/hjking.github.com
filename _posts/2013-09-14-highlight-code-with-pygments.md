---
comments: true
date: 2013-09-14 11:29:00
layout: post
slug: highlight-code-with-pygments
title: "Highlight Code with Pygments"
summary: "This post shows how to highlight code with Pygments in Github Pages."
image: 'why-its-important-to-know-how-to-use-your-tools/cover.png'
categories: git
tags: [git, github, jekyll, gist, pygments]
---


{% highlight ruby linenos %}
def foo
  puts 'foo'
end
{% endhighlight %}

{% highlight verilog linenos %}
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
{% endhighlight %}

{% highlight vim linenos %}
    if !has('gui_running')
          finish
    endif

    let g:gvimrc_loaded = 1

    " Max width
    set columns=90

    " Color Setting
    colo molokai
    set background=dark

{% endhighlight %}
