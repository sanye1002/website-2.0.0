<!DOCTYPE html>
<html>
<#include "../common/head.ftl">
<body>
<!-- head start -->
<#include "../common/header.ftl">


<!-- head End -->
<!-- ym-banner start -->
<!-- banner start -->
<div class="text-center">
    <ul class="rslides list-unstyled">
        <li>
            <div class="banner" style="background-image:url(/rysj/imgs/zhaomuyiren.png)">
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
        <ul class="list-unstyled">

        </ul>
    </div>
</section>
<!-- crumbs End -->
<!-- content start -->
<div class="neirong">
    <article class="container info sx-padding" id="demo">
        <div class="listphoto">
            &nbsp;<img src="/rysj/imgs/zhaomu1.png"/></div>
        <div class="listphoto">
            <img height="821" src="/rysj/imgs/zp_r3_c2.png" width="1100"/></div>
        <div class="listphoto">
            <img height="1010" src="/rysj/imgs/zp_r4_c2.jpg" width="1100"/></div>

        <div class="content_page"></div>
    </article>
</div>
<!-- content End -->
<!-- footer start -->
<!-- footer start -->

<#include "../common/footer.ftl">
<!-- footer end -->
<!-- kehu start -->
<!--<div class="kefu">
  <ul class="list-unstyled">
    <li><a href="/contact" title="更多联系方式" target="_blank" class="kefu-lx">在线客服</a></li>
    <li><a href="#yy" class="kefu-yy" title="快速给我们留言" rel="nofollow">快速留言</a></li>
    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1007363025&site=qq&menu=yes" class="kefu-zx">在线咨询</a></li>
    <li><a href="#yy" class="kefu-wx" title="华星微信公众号" rel="nofollow">微信公众号<span class="kefu-weixin"><img src="picture/kefu-weixin.jpg" width="140" height="140" alt=""/></span></a></li>
    <li><a href="#top" class="kefu-top" title="回网页顶部" rel="nofollow">返回顶部</a></li>
  </ul>
</div>-->
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