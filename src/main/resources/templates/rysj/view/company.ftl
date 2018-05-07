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
            <div class="banner" style="background-image:url(/rysj/imgs/guanyuwomen.png)">
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
            <li><a href='/rysj/about/company' <#if type ==1>class='hover'</#if>>公司简介</a></li>
            <li><a href="/rysj/about/team" <#if type ==2>class='hover'</#if>>团队介绍</a></li>

        </ul>
    </div>
</section>
<!-- crumbs End -->
<!-- content start -->
<div class="neirong">
    <article class="container info sx-padding" id="demo">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2">
                    <img name="index_r2_c2" src="/rysj/imgs/index_r2_c2.png" width="1140" height="554" border="0"
                         id="index_r2_c2" alt=""/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <iframe frameborder="0" width="640" height="498"
                            src="https://v.qq.com/iframe/player.html?vid=l0338nyltsh&tiny=0&auto=0"
                            allowfullscreen></iframe>
                </td>
            </tr>
            <tr>
                <td colspan="2"><img name="index_r4_c2" src="/rysj/imgs/index_r4_c2.png" width="1140" height="236"
                                     border="0" id="index_r4_c2" alt=""/></td>
            </tr>
        <#--    <tr>
                <td colspan="2"><img name="index_r5_c2" src="/rysj/imgs/index_r5_c2.png" width="1140" height="204"
                                     border="0" id="index_r5_c2" alt=""/></td>
            </tr>
            <tr>
                <td><img name="index_r6_c2" src="/rysj/imgs/index_r6_c2.png" width="618" height="368" border="0"
                         id="index_r6_c2" alt=""/></td>
                <td valign="top">
                   &lt;#&ndash; 视频放的位置 432*360&ndash;&gt;

                </td>
            </tr>
            <tr>
                <td colspan="2"><img name="index_r7_c2" src="" width="1140" height="146"
                                     border="0" id="index_r7_c2" alt=""/></td>
            </tr>-->
            <tr>
                <td colspan="2"><img name="index_r8_c2" src="/rysj/imgs/index_r8_c2.png" width="1140" height="378"
                                     border="0" id="index_r8_c2" alt=""/></td>
            </tr>
        </table>
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
    <li><a href="#yy" class="kefu-wx" title="华星微信公众号" rel="nofollow">微信公众号<span class="kefu-weixin"><img src="/rysj/picture/kefu-weixin.jpg" width="140" height="140" alt=""/></span></a></li>
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