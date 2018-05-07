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
                    <li class="active">工作添加</li>
                </ul>
            </div>
            <!-- /页面面包屑 -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        工作添加
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
                        <div class="widget flat radius-bordered">
                            <div class="widget-header bg-blue">
                                <span class="widget-caption">工作发布</span>
                            </div>
                            <div class="widget-body col-lg-12">
                                <div class="form-title">基本内容</div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>标题</label>
                                        <span class="input-icon icon-right">
                                                    <input id="article_title" type="text" class="form-control">
                                                    <i class="fa fa-user"></i>
                                            </span>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <textarea id="demo" style="display: none;"></textarea>
                                    <div style="float:right;margin-top:10px;">
                                        <button id="save" class="btn btn-success">保存</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Body -->
        </div>
    </div>

</div>

<#include "../common/footjs.ftl">
<script type="text/javascript">
    var job = {
        title: "",
        showStatus: 0,
        content: ""
    }
    var index;
    var layedit;
    $(function () {
        layui.use('layedit', function () {
            layedit = layui.layedit;
            layedit.set({
                uploadImage: {
                    url: '/upload/img/job' //接口url
                    , type: 'post' //默认post
                }
            });
            index = layedit.build('demo'); //建立编辑器
        });
        $("#save").click(function () {
            job.content = layedit.getContent(index)
            job.title = $("#article_title").val();
            if (job.title == "") {
                layer.msg("请文章标题为填写...")
            } else {
                if (job.content == "") {
                    layer.msg("请编写文章内容...")
                } else {
                    //保存
                    $("#save").attr("disabled", true)
                    $.post(
                            "/oa/job/save",
                            {
                                showStatus: job.showStatus,
                                title: job.title,
                                content: job.content
                            },
                            function (data) {

                                if (data.code == 0) {
                                    layer.msg(data.message);
                                    setTimeout(function () {
                                        location = "/oa/job/index"
                                    }, 2000)
                                }
                                if (data.code > 0) {
                                    $("#save").removeAttr("disabled")
                                    layer.msg(data.message);
                                }
                            }
                    )
                }
            }
        })
    })

</script>
</body>
</html>