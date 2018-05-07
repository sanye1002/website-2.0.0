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
            <div class="banner" style="background-image:url(/rysj/imgs/shangwuhezuo.png)">
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
            <li><a href='/rysj/about/job' <#if type==1>class="hover" </#if> >人才招聘</a></li>
            <li><a href="/rysj/about/cooperation" <#if type==2>class="hover" </#if>>商务合作</a></li>
        </ul>
    </div>
</section>
<!-- crumbs End -->
<!-- content start -->
<div class="neirong">
    <article class="container info sx-padding" id="demo"> <span style="font-size:20px;"><strong>&nbsp;益豪娱创 商务合作</strong></span><br />
        <br />
        <hr style="margin: 10px 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-top-style: solid; border-top-color: rgb(238, 238, 238); color: rgb(51, 51, 51); font-family: &quot;microsoft yahei&quot;, &quot;lvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px;" />
        <p>
            <span style="font-size:16px;">益豪娱创依托已构建的核心资源，已成为线下实体企业&ldquo;互联网+&rdquo;新型化的营销盟友，能够迅速整合资源，达成异业合作</span><span style="font-size: 16px;">。</span><br />
            <span style="font-size:16px;">目前可为企业提供整合营销推广、官网制作、活动策划与执行、展览展示与服务、品牌推广与代言等服务项。</span><br />
            &nbsp;</p>
        <table border="0" cellpadding="1" cellspacing="1" style="width: 300px">
            <tbody>
            <tr>
                <td>
                   <#-- <img alt="" src="picture/2-1f52216001tf.png" style="width: 300px; height: 300px;" /></td>-->
            </tr>
            </tbody>
        </table>
        <br />
        <ul class="list-unstyled" style="padding-right: 0px; padding-left: 0px; margin: 0px; list-style: none; color: rgb(186, 188, 189); line-height: 28px;">
            <li>
                <div>
                    <span style="font-size:16px;"><span style="color:#000000;">合作热线：18145032533</span></span></div>
            </li>
        </ul>
        <ul class="list-unstyled" style="padding-right: 0px; padding-left: 0px; margin: 0px; list-style: none; font-family: &quot;microsoft yahei&quot;, &quot;lvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; color: rgb(186, 188, 189); line-height: 28px;">
            <li style="color: rgb(102, 102, 102);">
                <div>
                    <span style="color:#000000;">E-mail：331139839@qq.com</span></div>
            </li>
        </ul>
        <br />

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