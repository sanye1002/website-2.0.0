<!DOCTYPE html>
<html>
<#include "../common/head2SEO.ftl">
<body>
<!-- head start -->
<#include "../common/header.ftl">


<!-- head End -->
<!-- ym-banner start -->
<section class="ny-banner text-center" style="background-image:url(/rysj/imgs/banner_1.png)">
    <div class="container text-left">
        <h2 class="text-left">行业资讯</h2>
        <p class="weizhi">当前位置：<a href='/'>主页</a> >
             <#if type == 0>
                     <a href='/rysj/article/list?type=0'>公司动态</a>
             <#elseif type ==1>
                    <a href='/rysj/article/list?type=1'>主播资讯</a>
             <#elseif type ==2>
                     <a href='/rysj/article/list?type=2'>业界资讯</a>
             <#elseif type ==3>
                    <a href='/rysj/article/list?type=3'>益豪娱创</a>
             </#if>
        </p>
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
            <h2 class="biaoti wow animated fadeInUp">${articleInfo.getArticleTitle()}</h2>
            <p class="shuoming wow animated fadeInUp">日期：${articleInfo.getCreateTime()} / 人气：<span id="show_i_hits">${articleInfo.getLookNumber()}</span></p>
            <div class="wow animated fadeInUp">
                ${articleInfo.getContent()}
            </div>
            <p class="text-right wow animated fadeInUp animated" style="visibility: visible;">来源：未知 编辑：荣耀玉手</p>

        </main>
        <aside class="aside pull-left">
            <h4 class="ny-h4 wow animated fadeInUp">相关内容
                <small></small>
            </h4>
            <ul class="list-unstyled clearfix wow animated fadeInUp">
               <#list articleList as article >
                   <li>
                       <a class="list-TuiJian-a" href="/rysj/article/detail?id=${article.getId()}" target="_blank">${article.getArticleTitle()}…</a>
                       <small class="pull-right">${article.getCreateTime()}</small>
                   </li>
               </#list>


            </ul>


            <h4 class="ny-h4 wow animated fadeInUp">联系我们
                <small>Contact US</small>
            </h4>
            <ul class="list-unstyled clearfix wow animated fadeInUp">
                <li class="red">全国服务热线：</li>
                <li class="red">24小时服务手机：18145032533</li>
                <li class="red">在线咨询：
                    <small class="xx-qq"><a href="http://wpa.qq.com/msgrd?V=3&uin=331139839&Site=QQ&Menu=yes" target="_blank">qq咨询</a>
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

<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>
</body>
</html>