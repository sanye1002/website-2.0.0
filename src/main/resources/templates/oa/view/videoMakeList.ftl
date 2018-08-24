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
                    <li class="active">产品中心</li>
                </ul>
            </div>
            <!-- /页面面包屑 -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        影视制作查看
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
                                影视制作
                                <span class="badge badge-sky badge-square">
                                     提示：点击编辑可查看编辑但是会丢失图片和视频
                                </span>
                            </div>
                            <div style="float:right;margin-right:2px;margin-bottom: 5px">
                                    <a href="/oa/videoMake/index" class="btn btn-success">新增内容</a>
                            </div>
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>
                                       上标题
                                    </th>
                                    <th>
                                        图片
                                    </th>
                                    <th>
                                        视频
                                    </th>
                                    <th>
                                       内容
                                    </th>

                                    <th>
                                        下标题
                                    </th>

                                    <th>
                                        发布时间
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
                                        ${app.getTopTitle()!}
                                    </td>
                                    <td>
                                        <a class="btn btn-info btn-xs" onclick="showImgs('${app.getId()!}')"><i class="fa fa-pencil"></i>
                                            图片</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-info btn-xs" onclick="showVideo('${app.getVideoUrl()!}')"><i class="fa fa-picture-o"></i>
                                            视频</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-info btn-xs" onclick="showContent(${app.getId()!})"><i class="fa fa-picture-o"></i>
                                            内容</a>
                                    </td>
                                    <td>
                                        ${app.bottomTitle!}
                                    </td>
                                    <td>
                                        ${app.getCrateTime()!}
                                    </td>

                                    <td>
                                        <#--<a class="btn btn-success"-->
                                           <#--href="/oa/app/index?id=${app.getId()}">更新图片视频<i class="fa fa-check right"></i></a>-->
                                        <a class="btn btn-danger delete"
                                           onclick="deleteApp(${app.getId()!})"><i
                                                class="fa fa-times"></i>删除</a>
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
                        "/oa/videoMake/delete",
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
                "/oa/videoMake/description",
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
        $.getJSON('/oa/videoMake/img?id='+id, function(json){
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