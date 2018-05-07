<!DOCTYPE html>
<html>
    <#include "../common/head.ftl">
<body>
<!-- head start -->
<#include "../common/header.ftl">

<!-- head End -->
<!-- banner start -->
<div class="text-center">
    <ul class="rslides list-unstyled">
        <#list carouselList as carousel>
         <li>
             <div class="banner" style="background-image: url('${carousel.getPathUrl()}')">
                 <div class="container"></div>
             </div>
         </li>
        </#list>


    </ul>
</div>
<!-- banner End -->

<!-- Anli start -->
<section class="case text-center sx-padding" id="demo" style="background-image: url(/rysj/images/showbg.jpg);	background-repeat: no-repeat;
	background-position: center;">
    <div class="container">
        <h2 class="f-title wow animated fadeInUp">签约艺人</h2>

        <div class="row">
            <#list anchorInfoList as anchor>
                <figure class="wow animated flipInX">
                    <a href="/rysj/anchor/detail?id=${anchor.getId()}" target="_blank">
                        <img src="${anchor.getSmallImg()}" width="360" height="256" alt="益豪娱创艺人  |  ${anchor.getNickname()}"/></a>
                    <figcaption>
                        <h3><a href="/rysj/anchor/detail?id=${anchor.getId()}"
                               target="_blank">益豪娱创艺人  |  ${anchor.getNickname()}</a></h3>
                        <p>昵称：${anchor.getNickname()} 身高：${anchor.getHeight()} cm 平台：${anchor.getPlatform()}
                            ID：${anchor.getLiveId()}...</p>
                        <p class="case-more-top"><a href="/rysj/anchor/detail?id=${anchor.getId()}"  class="btn-success case-more" target="_blank">更多
                            →</a> 关注：
                            ${anchor.getLookNumber()}
                            人
                        </p>
                    </figcaption>
                </figure>
            </#list>

        </div>
    </div>
</section><!-- Anli end -->

<!-- fuwu start -->
<section style="background-image: url(/rysj/images/2014092200018883.jpg);" class="fuwu-bg pingpu-bg" id="demo">
    <div class="fuwu container text-center sx-padding">
        <h2 class="f-title wow animated fadeInUp">业务范围
            <small>围绕网红艺人，以视频直播为形式开展多种类型业务模块！</small>
        </h2>
        <div class="row">
            <figure class="wow animated zoomIn">
                <a href="javascript:" class="pic1"></a>
                <figcaption><a href="javascript:">艺人经纪</a></figcaption>
                <p>公司挖掘、培养网红艺人，围绕网红艺人进行直播合作、网络电商、演艺演出、广告代言、电视电影（网大网剧）拍摄等相关艺人经纪业务。</p>
            </figure>

            <figure class="bianju wow animated zoomIn">
                <a href="javascript:" class="pic2" target="_blank"></a>
                <figcaption><a href="javascript:">直播业务</a></figcaption>
                <p>通过视频直播为形式与各地多家直播平台合作，娱乐在线直播、游戏在线直播、网络综艺直播等直播合作，以及体育、财经、美食、旅游等垂直类直播内容输出。</p>
            </figure>

            <figure class="wow animated zoomIn">
                <a href="javascript:" class="pic3" target="_blank"></a>
                <figcaption><a href="javascript:"><a href="#">电竞业务</a></a></figcaption>
                <p>根据网红自身条件，精准对接媒体、电商、直播等平台资源。利用话题制造，事件营销，提升网红的关注度，认真分析粉丝能力，实现高效转化！</p>
            </figure>
        </div>

        <div class="row">
            <figure class="wow animated zoomIn">
                <a href="javascript:" class="pic4"></a>
                <figcaption><a href="javascript:">内容编辑</a></figcaption>
                <p>通过视频直播为形式与各地多家直播平台合作，娱乐在线直播、游戏在线直播、网络综艺直播等直播合作，以及体育、财经、美食、旅游等垂直类直播内容输出。</p>
            </figure>

            <figure class="bianju wow animated zoomIn">
                <a href="javascript:" class="pic5" target="_blank"></a>
                <figcaption><a href="javascript:">广告推广</a></figcaption>
                <p>每天大量的流量的曝光率，网红资源整合新媒体传媒，CPS,CPA多种形式的广告推广合作模式，精准的投放通道，让您的推广具有穿透力。</p>
            </figure>

            <figure class="wow animated zoomIn">
                <a href="javascript:" class="pic6" target="_blank"></a>
                <figcaption><a href="javascript:">整合营销</a></figcaption>
                <p>致力于互联网内容营销，为客户提供优质的互联网资源(新媒体资源、网红资源）、优秀的线上媒体资源，为客户提供精准、更有效的线上品牌营销服务。</p>
            </figure>
        </div>

    </div>
    </div>
</section><!-- fuwu end -->
<!-- News start -->
<div class="news" id="demo">
    <div class="container sx-padding clearfix">
        <section class="wow animated fadeInUp">
            <h2>公司动态
                <small></small>
            </h2>
            <ul class="list-unstyled clearfix">
               <#list page0 as info>
                   <li><a href="/rysj/article/detail?id=${info.getId()}" title="${info.getArticleTitle()}"
                          target="_blank"
                          Style="Color:rgb(255;font-weight:bold;">${info.getArticleTitle()}</a>
                       <small class="pull-right">${info.getCreateTime()}</small>
                   </li>
               </#list>

            </ul>
            <p><a href="/rysj/article/list" class="btn-success news-more" target="_blank">更多 ...</a></p>
        </section>


        <section class=" bianju wow animated fadeInUp">
            <h2>艺人热讯
                <small></small>
            </h2>
            <ul class="list-unstyled clearfix">

               <#list page1 as info>
                   <li><a href="/rysj/article/detail?id=${info.getId()}" title="${info.getArticleTitle()}"
                          target="_blank"
                          Style="Color:rgb(255;font-weight:bold;">${info.getArticleTitle()}</a>
                       <small class="pull-right">${info.getCreateTime()}</small>
                   </li>
               </#list>

            </ul>
            <p><a href="/rysj/article/list?type=1" class="btn-success news-more" target="_blank">更多 ...</a></p>
        </section>
        <section class="wow animated fadeInUp">
            <h2>业绩动态
                <small></small>
            </h2>
            <ul class="list-unstyled clearfix">
               <#list page2 as info>
                   <li><a href="/rysj/article/detail?id=${info.getId()}" title="${info.getArticleTitle()}"
                          target="_blank"
                          Style="Color:rgb(255;font-weight:bold;">${info.getArticleTitle()}</a>
                       <small class="pull-right">${info.getCreateTime()}</small>
                   </li>
               </#list>

            </ul>
            <p><a href="/rysj/article/list?type=2" class="btn-success news-more" target="_blank">更多 ...</a></p>
        </section>

    </div>
</div>
<!-- News end -->
<!-- about US start -->
<div style="background-image: url(/rysj/images/2014092201586924.jpg);" class="pingpu-bg">
    <article id="demo" class="about container text-center sx-padding">
        <h2 class="f-title wow animated fadeInUp">关于我们
            <small>职业的艺人经纪服务公司</small>
        </h2>
        <div class="about-lianjie text-center"><img src="/rysj/imgs/about_1.png"></div>
        <div class="about-us wow animated fadeInUp">
            <p>成都益豪娱创文化传媒公司注册于2018年1月30，公司总部座落在中国成都市高新区凯旋广场3栋31楼。<br>
                益豪娱创传媒是集网络直播，唱片制作，影视制作，艺人经纪，舞台剧演出以及网络音乐新媒体平台建设于一身的产业经营一体化企业。 <br>
                “文化与市场接轨，艺术与商业共存，传统与现代兼容，高雅与通俗并举”益豪娱创传媒以此经营理念与指导思想为发展目标。 <br>
                益豪娱创传媒由经验较丰富又充满朝气的管理团队带领，公司自成立至今一直追求精益求精。 <br>
                实力运作综艺活动，企业品牌推广，大型赛事承办，娱乐新人选拔、培养、包装、推广网络艺人、商演代理等经纪服务。<br>
                <a href="/rysj/about/company" target="_blank">更多 ...</a></p>


        </div>
    </article>
</div><!-- About US end -->
<!-- kehu start -->
<section style="background-image: url(/rysj/images/2014092201299540.png);" class="kehu sx-padding text-center pingpu-bg"
         id="demo">
    <div class="container">
        <h2 class="f-title wow animated fadeInUp">合作伙伴
            <small>益豪娱创，冲向天际</small>
        </h2>
        <div class="row">
            <figure class="wow animated flipInX"><img src="/rysj/picture/logo_momo.jpg" width="188" height="100"
                                                      alt="陌陌直播"/>
                <figcaption>陌陌直播</figcaption>
            </figure>
            <figure class="wow animated flipInX"><img src="/rysj/picture/logo_douyin.jpg" width="188" height="100"
                                                      alt="抖音小视频"/>
                <figcaption>抖音小视频</figcaption>
            </figure>
            <figure class="wow animated flipInX"><img src="/rysj/imgs/LOGO_007QIXIU.jpg" width="188" height="100"
                                                      alt="奇秀"/>
                <figcaption>抖音小视频</figcaption>
            </figure>
            <figure class="wow animated flipInX"><img src="/rysj/picture/logo_001_1douyu.jpg" width="188" height="100"
                                                      alt="斗鱼直播"/>
                <figcaption>斗鱼直播</figcaption>
            </figure>
            <figure class="wow animated flipInX"><img src="/rysj/picture/logo_001panda.jpg" width="188" height="100"
                                                      alt="熊猫直播"/>
                <figcaption>熊猫直播</figcaption>
            </figure>
            <figure class="wow animated flipInX"><img src="/rysj/picture/logo_huajiao.jpg" width="188" height="100"
                                                      alt="花椒直播"/>
                <figcaption>花椒直播</figcaption>
            </figure>

            <figure class="wow animated flipInX"><img src="/rysj/picture/logo_kk.png" width="188" height="100"
                                                      alt="kk直播"/>
                <figcaption>火山直播</figcaption>
            </figure>

            <figure class="wow animated flipInX"><img src="/rysj/picture/logo_now.jpg" width="188" height="100"
                                                      alt="NOW"/>
                <figcaption>NOW</figcaption>
            </figure>

            <figure class="wow animated flipInX"><img src="/rysj/picture/logo_meipai.jpg" width="188" height="100"
                                                      alt="美拍"/>
                <figcaption>美拍</figcaption>
            </figure>
            <figure class="wow animated flipInX"><img src="/rysj/picture/logo_yy.jpg" width="188" height="100"
                                                      alt="YY直播"/>
                <figcaption>YY直播</figcaption>
            </figure>

            <figure class="wow animated flipInX"><img src="/rysj/picture/logo_qe.jpg" width="188" height="100"
                                                      alt="企鹅电竞"/>
                <figcaption>企鹅电竞</figcaption>
            </figure>

            <figure class="wow animated flipInX"><img src="/rysj/picture/logo_chixugengxin.jpg" width="188" height="100"
                                                      alt="持续更新中"/>
                <figcaption></figcaption>
            </figure>
        </div>
        <!--<p class="s-m40 wow animated fadeInUp"><a href="#" class="btn-success about-more" target="_blank">MORE INFO →</a></p>-->
    </div>
</section><!-- kehu end -->

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
        
        
        
        