<!DOCTYPE html>
<html lang="en">
<!-- header -->
<#include "../common/header.ftl">
<body>
<!-- 导航 -->

<#include "../common/nav.ftl">

<!-- 主体内容 -->
<div class="main-container container-fluid">
    <!-- 页面内容 -->
    <div class="page-container">
        <!-- 侧边栏导航 -->
       <#include "../common/sider.ftl">
        <!-- /侧边栏导航 -->
        <!-- Page Content -->
        <div class="page-content">
            <!-- 页面面包屑 -->
            <div class="page-breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="#">主页</a>
                    </li>
                    <li class="active">产品申请列表</li>
                </ul>
            </div>
            <!-- /页面面包屑 -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        产品申请列表
                    </h1>
                </div>
                <!--Header Buttons-->
                <div class="header-buttons">
                    <a class="sidebar-toggler" href="#">
                        <i class="fa fa-arrows-h"></i>
                    </a>
                    <a class="refresh" id="refresh-toggler" href="">
                        <i class="glyphicon glyphicon-refresh"></i>
                    </a>
                    <a class="fullscreen" id="fullscreen-toggler" href="#">
                        <i class="glyphicon glyphicon-fullscreen"></i>
                    </a>
                </div>
                <!--Header Buttons End-->
            </div>
            <!-- /Page Header -->
            <!-- Page Body -->
            <div class="page-body">
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="well with-header with-footer">
                            <div class="header bordered-sky">
                                列表

                            </div>

                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>
                                        申请人
                                    </th>
                                    <th>
                                        性别
                                    </th>
                                    <th>
                                        手机号
                                    </th>
                                    <th>
                                        详细描述
                                    </th>

                                    <th>
                                        申请时间
                                    </th>

                                    <th>
                                        操作
                                    </th>

                                </tr>
                                </thead>

                                <tbody>
                                <#list pageContent.getContent() as app >
                                <tr id="${app.getId()}">
                                    <td>
                                        ${app.getUsername()!}
                                    </td>
                                    <td>
                                        ${app.getSex()!}
                                    </td>
                                    <td>
                                        ${app.getPhone()!}
                                    </td>
                                    <td>
                                        ${app.getDescription()!}
                                    </td>
                                    <td>
                                        ${app.getCrateTime()!}
                                    </td>
                                    <td>
                                       请联系
                                    </td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                            <#include "../common/page.ftl">
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Body -->
        </div>
    </div>

</div>

<#include "../common/footjs.ftl">
<script>
    function deleteApp(id) {
            layer.confirm('此操作为不可逆操作，客官已确认？', {
                btn: ['确认', '取消'] //按钮
            }, function () {
                layer.closeAll();
                layer.msg('请稍等...', {
                    icon: 16
                    , shade: 0.01
                });
                //执行POST请求
                $.post(
                        "/oa/app/delete",
                        {id: id},
                        function (res) {
                            if (res.code==0){
                                layer.msg(res.message)
                                $("#"+id).remove()
                            }

                        }
                )

            });


    }
    function showContent(id) {
        //页面层
        $.post(
                "/oa/app/description",
                {
                    id: id
                },
                function (data) {
                    if (data.code == 0) {
                        if (data.data.appOpen.content != null) {
                            layer.open({
                                type: 1,
                                skin: 'layui-layer-lan', //加上边框
                                area: ['1280px', '768px'], //宽高
                                content: data.data.appOpen.content
                            });
                        }else {
                            layer.msg("没有内容。。。");
                        }

                    }
                    if (data.code > 0) {
                        layer.msg(data.message);
                    }
                }
        )
    }

    //相册层
    function showImgs(id) {
        console.log(id)
        $.getJSON('/oa/app/img?id='+id, function(json){
            layer.photos({
                photos: json
                ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
            });
        });
    }

    function showVideo(videoUrl) {
        layer.open({
            type: 2,
            title: false,
            area: ['630px', '360px'],
            shade: 0.8,
            closeBtn: 0,
            shadeClose: true,
            content: videoUrl
        });
    }


</script>
</body>
</html>