<!DOCTYPE html>
<html>
<#include "../common/head2SEO.ftl">
<body>
<!-- head start -->
<#include "../common/header.ftl">

<!-- head End -->
<!-- ym-banner start -->
<!-- banner start -->
<div class="text-center">
    <ul class="rslides list-unstyled">
        <li>
            <div class="banner" style="background-image:url(/rysj/imgs/teamshow.png)">
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
            <li><a href='/rysj/product/info?type=app' <#if type == "app">class='hover'</#if>>软件开发</a></li>
            <li><a href="/rysj/product/info?type=video" <#if type =="video">class='hover'</#if>>影视制作</a></li>

        </ul>
    </div>
</section>
<div class="neirong">
    <article class="container info sx-padding" id="demo">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <#list list as item>
               <#list item.getImgUrl() as img>
                    <tr>
                        <td colspan="2">
                            <img name="index_r2_c2" src="${img!}" width="1140" height="554" border="0"
                                 id="index_r2_c2" alt=""/>
                        </td>
                    </tr>
               </#list>
                <tr>
                    <td colspan="2" align="center">
                        <iframe frameborder="0" width="640" height="498"
                                src="${item.getVideoUrl()!}"
                                allowfullscreen></iframe>
                    </td>
                </tr>

                <div>
                    ${item.content!}
                </div>
            </#list>

        </table>

        <div class="content_page"></div>
    </article>
</div>

<#include "../common/footer.ftl">
<!-- footer end -->
<!-- kehu start -->
<div class="kefu">
  <ul class="list-unstyled">
    <li><a title="更多联系方式" onclick="action()"  class="kefu-lx">快速留言</a></li>
    <#--<li><a href="#yy" class="kefu-yy" title="快速给我们留言" rel="nofollow">快速留言</a></li>-->
    <#--<li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1007363025&site=qq&menu=yes" class="kefu-zx">在线咨询</a></li>-->
    <#--<li><a href="#yy" class="kefu-wx" title="华星微信公众号" rel="nofollow">微信公众号<span class="kefu-weixin"><img src="/rysj/picture/kefu-weixin.jpg" width="140" height="140" alt=""/></span></a></li>-->
    <li><a href="#top"  class="kefu-top" title="回网页顶部" rel="nofollow">返回顶部</a></li>
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
<script type="text/javascript" src="/rysj/js/layer/layer.js"></script>
<!-- layjs -->
<script>
   function action() {

       layer.open({
           type: 2,
           shade: false,
           area: ['60%','80%'],
           maxmin: true,
           content: '/rysj/product/register',
           zIndex: 99999999999, //重点1
           success: function(layero){
               layer.setTop(layero); //重点2
           }
       })
   }

</script>
</body>
</html>