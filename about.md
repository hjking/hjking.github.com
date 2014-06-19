---
layout: page
title: About
---

<section id="about">
### About Me
Hey there! I'm HJKing. Welcome to my blog built on github pages. I'm an ASIC Design Engineer from China, also an EDA server administrator.

Hope to get known some guys here. Thanks.

### About Blog
This <a href="{{ site.links.blog }}" target="_blank">site</a> is for personal usage to take some notes and share things in my life and work.

The source code of this site is <a href="{{ site.links.blog_repo }}" target="_blank">HERE</a>. Feel free to fork it.

Have questions or suggestions? Feel free to <a href="{{ site.links.feedback }}" title="Leave a feedback for {{ site.author.name }}"  target="_blank" >Leave a Feedback</a>.

Thanks for reading!

<p>
<a href="{{ site.links.blog_zip }}" class="btn">Download</a>
 · 
<a href="{{ site.links.blog_repo }}" target="_blank" class="btn">View in Github</a>
 · 
<a href="{{ site.links.feedback }}" target="_blank" class="btn">Feedback</a> 
</p>


### Follow me:
<div id="stalker">
  <ul class="list-inline">
  <li><a title="Email Me" href="mailto:{{ site.author.email }}" target="_blank">
    <i class="fa fa-envelope"></i>
  </a>
  {% for nav in site.sociallink %}
      <li><a title="{{ nav.title }}" href="{{ nav.href }}" target="_blank">
        <i class="{{ nav.class }}"></i>
      </a>
  {% endfor %}
  <li><a title="Wechat" href="/wechat.html">
    <i class="fa fa-wechat"></i>
  </a>
  <li><a title="RSS Feed" href="/rss.xml">
    <i class="fa fa-rss-square"></i>
  </a>
  </ul>
</div>

</section>