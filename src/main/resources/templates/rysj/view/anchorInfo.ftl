<!DOCTYPE html>
<html>
<#include "../common/head.ftl">
<body>
<!-- head start -->
<#include "../common/header.ftl">


<!-- head End -->
<!-- ym-banner start -->
<section class="ny-banner text-center" style="background-image:url(/rysj/imgs/banner_1.png)">
    <div class="container text-left">
        <h2 class="text-left">益豪娱创艺人</h2>
        <p class="weizhi">当前位置：<a href='/'>主页</a> > <a href='/rysj/anchor/list'>签约艺人</a> > </p>
    </div>
</section>
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
    <article class="container info sx-padding clearfix" id="demo">
        <main class="main pull-left">
            <h2 class="biaoti wow animated fadeInUp">益豪娱创艺人|${anchorInfo.getNickname()}</h2>
            <p class="shuoming wow animated fadeInUp">人气：<span id="show_i_hits">${anchorInfo.getLookNumber()}</span></p>
            <div class="wow animated fadeInUp">
                ${anchorInfo.getContent()}

            </div>
            <p class="text-right wow animated fadeInUp animated" style="visibility: visible;">编辑：荣耀玉手</p>
            <div class="content_page"></div>


        </main>
        <aside class="aside pull-left">
            <h4 class="ny-h4 wow animated fadeInUp">相关内容
                <small></small>
            </h4>
            <ul class="list-unstyled clearfix wow animated fadeInUp">
                <#list anchorInfoList as anchor>
                     <li><a href="/rysj/anchor/detail?id=${anchor.getId()}" target="_blank">益豪娱创艺人|${anchor.getNickname()}</a>
                         <small class="pull-right">02-06</small>
                     </li>
                </#list>

            </ul>


            <h4 class="ny-h4 wow animated fadeInUp">联系我们
                <small></small>
            </h4>
            <ul class="list-unstyled clearfix wow animated fadeInUp">
                <li class="red">全国服务热线：</li>
                <li class="red">24小时服务手机：</li>
                <li class="red">在线咨询：
                    <small class="xx-qq"><a href="http://wpa.qq.com/msgrd?v=3&uin=331139839&site=qq&menu=yes""" target="_blank">qq咨询</a>
                    </small>
                </li>
            </ul>
        </aside>
    </article>
</div>
<!-- content End -->
<!-- footer start -->
<!-- footer start -->

<#include "../common/footer.ftl">
<!-- footer end -->
<!-- kehu start -->
<div class="kefu">
  <ul class="list-unstyled">
    <#--<li><a href="/contact" title="更多联系方式" target="_blank" class="kefu-lx">在线客服</a></li>
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