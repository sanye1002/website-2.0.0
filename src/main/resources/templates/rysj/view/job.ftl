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
            <div class="banner" style="background-image:url(/rysj/imgs/rencaizhaoping.png)">
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
    <article class="container info sx-padding" id="demo">
        <h2 class="wow animated fadeInUp animated"
            style="font-family: 'microsoft yahei', 'lvetica Neue', Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.5; color: rgb(51, 51, 51); -webkit-animation: fadeInUp 1s both; visibility: visible;">
            人才招募</h2>
        <#list jobInfoList as job>
            <hr/>
             <div>
                 <span style="font-size:16px;"><strong>【${job.getTitle()}】</strong></span><br/>
                 &nbsp;
             </div>
            ${job.getContent()}
        </#list>

        <p style="font-size: 14px; font-family: simsun; margin: 0px; padding: 0px; font-stretch: normal; line-height: 25px; color: rgb(51, 51, 51);">
            &nbsp;</p>
        <p style="font-size: 14px; font-family: simsun; margin: 0px; padding: 0px; font-stretch: normal; line-height: 25px; color: rgb(51, 51, 51);">
            &nbsp;</p>
        <p style="font-size: 14px; font-family: simsun; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; padding: 0px; font-stretch: normal; line-height: 25px; color: rgb(51, 51, 51);">
            <strong>HR：赵</strong></p>

        <p style="font-size: 14px; font-family: simsun; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; padding: 0px; font-stretch: normal; line-height: 25px; color: rgb(51, 51, 51);">
            <strong>Tel</strong>
            <strong>：
                <span style="font-size:14px;">
                    <span style="color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif;">181-4503-2533</span>
                </span>
            </strong>
        </p>
        <p style="font-size: 14px; font-family: simsun; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; padding: 0px; font-stretch: normal; line-height: 25px; color: rgb(51, 51, 51);">
            <strong>QQ邮箱：331139839@qq.com</strong></p>
        <p style="font-size: 14px; font-family: simsun; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; padding: 0px; font-stretch: normal; line-height: 25px; color: rgb(51, 51, 51);">
            &nbsp;</p>
        <p style="font-size: 14px; font-family: simsun; margin: 0px; padding: 0px; font-stretch: normal; line-height: 25px; color: rgb(51, 51, 51);">
            <br/>
        <#--<strong><a href="#">您也可以点此登录智联招聘投递相关简历&nbsp;</a></strong></p>-->

        <div class="content_page"></div>
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