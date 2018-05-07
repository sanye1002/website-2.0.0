<!DOCTYPE html>
<html>
<#include "../common/head.ftl">
<body>
<!-- head start -->
<#include "../common/header.ftl">
<!--背景案例 -->
<div class="text-center">
    <ul class="rslides list-unstyled">
        <li>
            <div class="banner" style="background-image:url(/rysj/imgs/hangyezixun.png)">
                <div class="container"></div>
            </div>
        </li>
    </ul>
</div>
<!-- banner End -->
<!-- ym-banner End -->
<!-- crumbs start -->
<section class="crumbs text-right">
    <div class="container">
        <ul class="list-unstyled" id="nav">
            <li><a href='/rysj/article/list?type=3' <#if type==3>class="hover" </#if>>益豪娱创</a></li>
            <li><a href='/rysj/article/list?type=0' <#if type==0>class="hover" </#if>>公司动态</a></li>
            <li><a href='/rysj/article/list?type=1'<#if type==1>class="hover" </#if>>主播资讯</a></li>
            <li><a href='/rysj/article/list?type=2'<#if type==2>class="hover" </#if>>业界资讯</a></li>
        </ul>
    </div>
</section>
<!-- crumbs End -->
<!-- content start -->
<div class="neirong sx-padding container" id="demo">
    <#list pageContent.getContent() as article>
        <article class="ny-news clearfix wow animated fadeInUp">
            <figure class="pull-left y-m50"><a href="/rysj/article/detail?id=${article.getId()}" target="_blank"><img
                    src="${article.getSmallImg()}" width="360px" height="196px" alt="${article.getArticleTitle()}"/></a></figure>
            <h1 class="nr-h20"><a href="/rysj/article/detail?id=${article.getId()}"
                                  target="_blank">${article.getArticleTitle()}</a></h1>
            <p class="shuoming x-m30">${article.getInfo()}...</p>
            <p><a href="/rysj/article/detail?id=${article.getId()}" class="btn-success" target="_blank">更多 →</a>

                <#if article.getType() == 0>
                     <small class="mulu"><a href='/rysj/article/list?type=0'>公司动态</a></small>
                <#elseif article.getType() ==1>
                    <small class="mulu"><a href='/rysj/article/list?type=1'>主播资讯</a></small>
                <#elseif article.getType() ==2>
                     <small class="mulu"><a href='/rysj/article/list?type=2'>业界资讯</a></small>
                <#elseif article.getType() ==3>
                    <small class="mulu"><a href='/rysj/article/list?type=3'>益豪娱创</a></small>
                </#if>
                <small class="guanzhu">
                    ${article.getLookNumber()}
                </small>
                <small class="time">${article.getCreateTime()}</small>

            </p>
        </article>
    </#list>
    <#include "../common/pageForType.ftl">
</div>
<!-- content End -->
<!-- footer start -->
<!-- footer start -->

<#include "../common/footer.ftl">
<!-- footer end -->
<!-- kehu start -->
<div class="kefu">
  <ul class="list-unstyled">
      <!--<li><a href="/contact" title="更多联系方式" target="_blank" class="kefu-lx">在线客服</a></li>
      <li><a href="#yy" class="kefu-yy" title="快速给我们留言" rel="nofollow">快速留言</a></li>
      <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1007363025&site=qq&menu=yes" class="kefu-zx">在线咨询</a></li>
      <li><a href="#yy" class="kefu-wx" title="华星微信公众号" rel="nofollow">微信公众号<span class="kefu-weixin"><img src="picture/kefu-weixin.jpg" width="140" height="140" alt=""/></span></a></li>
      --><li><a href="#top" class="kefu-top" title="回网页顶部" rel="nofollow">返回顶部</a></li>
  </ul>
</div>
<!-- jQuery start -->
<script src="/rysj/js/jquery.min.js"></script>
<script src="/rysj/js/wow.min.js"></script>
<script>
    wow = new WOW(
            {
                animateClass: 'animated',
                offset: 100
            });
    wow.init();
    document.getElementById('moar').onclick = function () {
        var section = document.createElement('section');
        section.className = 'section--purple wow fadeInDown';
        this.parentNode.insertBefore(section, this);
    };
</script>

<!-- header up start -->
<script src="/rysj/js/headroom.min.js"></script>
<script src="/rysj/js/jquery.headroom.js"></script>
<script>$("#header").headroom();</script>
<!-- banner start -->
<script type="text/javascript" src="/rysj/js/jiaodiantu.js"></script>
<script type="text/javascript" src="/rysj/js/nav.hover.js"></script>


</body>
</html>