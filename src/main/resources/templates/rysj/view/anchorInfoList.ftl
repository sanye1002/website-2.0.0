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
            <div class="banner" style="background-image:url(/rysj/imgs/yirenzhanshi.png)">
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
    <section class="case sx-padding" id="demo">
        <div class="container">
            <div class="row">
                <#list pageContent.getContent() as anchor>
                    <figure class="wow animated flipInX"><a href="/rysj/anchor/detail?id= ${anchor.getId()}" target="_blank"><img
                            src="${anchor.getSmallImg()}" width="360" height="256" alt="荣耀世纪主播|${anchor.getNickname()}"/></a>
                        <figcaption>
                            <h3><a href="/rysj/anchor/detail?id=${anchor.getId()}" target="_blank">荣耀世纪主播|${anchor.getNickname()}</a></h3>
                            <p>昵称：${anchor.getNickname()} 身高：${anchor.getHeight()} cm 平台：${anchor.getPlatform()} ID：${anchor.getLiveId()}...</p>
                            <p class="case-more-top"><a href="/rysj/anchor/detail?id=${anchor.getId()}" class="btn-success case-more" target="_blank">更多 →</a> 关注：
                                ${anchor.getLookNumber()}
                                人
                            </p>
                        </figcaption>
                    </figure>
                </#list>


            </div>
            <#include "../common/page.ftl">
        </div>
    </section>
</div>
<!-- content End -->
<!-- footer start -->
<!-- footer start -->

<#include "../common/footer.ftl">
<!-- footer end -->
<!-- kehu start -->
<div class="kefu">
  <ul class="list-unstyled">
   <#-- <li><a href="/contact" title="更多联系方式" target="_blank" class="kefu-lx">在线客服</a></li>
    <li><a href="#yy" class="kefu-yy" title="快速给我们留言" rel="nofollow">快速留言</a></li>
    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1007363025&site=qq&menu=yes" class="kefu-zx">在线咨询</a></li>
    <li><a href="#yy" class="kefu-wx" title="华星微信公众号" rel="nofollow">微信公众号<span class="kefu-weixin"><img src="picture/kefu-weixin.jpg" width="140" height="140" alt=""/></span></a></li>-->
    <li><a href="#top" class="kefu-top" title="回网页顶部" rel="nofollow">返回顶部</a></li>
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