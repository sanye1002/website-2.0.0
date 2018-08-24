<!DOCTYPE html>
<html lang="en">
<!-- header -->
<#include "../common/header.ftl">
<style>
    .layui-upload-img{
        width: 200px;
        height: 100%;
        margin: 0 10px 10px 0;
    }
    .layui-upload-video{
        width: 200px;
        height: 100%;
        margin: 0 10px 10px 0;
    }
</style>
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
                        软件内容介绍添加
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
                    <div class="col-xs-12 col-md-6 col-lg-12">
                        <div class="widget flat radius-bordered">
                            <div class="widget-header bg-blue">
                                <span class="widget-caption">软件内容介绍添加</span>

                            </div>
                            <div class="widget-body col-lg-12">
                                <div id="registration-form">

                                    <div class="form-title">基本介绍
                                        <span class="badge badge-sky badge-square">
                                     小提示：以下下内容必须填其中一条
                                    </span>
                                    </div>
                                    <!--上标题-->
                                    <div class="form-title">上标题描述</div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>上标题</label>
                                            <span class="input-icon icon-right">
                                                    <input id="topTitle" type="text" value="" class="form-control">
                                                    <i class="fa fa-pencil-square-o"></i>
                                                </span>
                                        </div>
                                    </div>
                                    <!--视频描述-->
                                    <div class="form-title">视频描述</div>
                                    <div class="col-sm-12">

                                        <div class="layui-upload">

                                            <button type="button" class="layui-btn" id="video-select">
                                                视频选择
                                            </button>
                                            <button type="button" class="layui-btn" id="video-upload">
                                                视频上传
                                            </button>
                                            <blockquote class="layui-elem-quote layui-quote-nm"
                                                        style="margin-top: 10px;">
                                                预览：
                                                <div class="layui-upload-list" id="videoShow">
                                                        <#--<video src="" controls="controls" class="layui-upload-img"></video>-->
                                                <#--&lt;#&ndash;<video src="/read/mp4/1527582639993/1527599861315.MP4" controls="controls"></video>&ndash;&gt;-->
                                                </div>
                                            </blockquote>
                                        </div>
                                    </div>
                                    <!--图片描述-->

                                    <div class="form-title">图片描述信息(1100*)可以多图上传</div>
                                    <div class="col-sm-12">
                                        <div class="layui-upload">

                                            <button type="button" class="layui-btn" id="img-select">
                                                图片选择
                                            </button>
                                            <button type="button" class="layui-btn" id="img-upload">
                                                图片上传
                                            </button>
                                            <blockquote class="layui-elem-quote layui-quote-nm"
                                                        style="margin-top: 10px;">
                                                预览图：
                                                <div class="layui-upload-list" id="imgShow">

                                                </div>
                                            </blockquote>

                                        </div>
                                    </div>
                                    <div class="form-title">文本内容信息</div>
                                    <div class="col-sm-12">
                                        <textarea id="demo" style="display: none;"></textarea>
                                    </div>
                                    <div class="form-title">下标题描述</div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>下标题</label>
                                            <span class="input-icon icon-right">
                                                    <input id="bottomTitle" type="text" class="form-control">
                                                    <i class="fa fa-pencil-square-o"></i>
                                                </span>
                                        </div>
                                        <div style="float:right;margin-top:10px;">
                                            <button id="save" class="btn btn-success">保存</button>
                                        </div>
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
<script src="/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    var app = {
        id: "",
        topTitle: "",
        imgUrl: "",
        videoUrl: "",
        description: "",
        bottomTitle: ""
    };

    $(function () {
        var layedit;
        var index;
        // 图片上传
        layui.use('upload', function () {
            var $ = layui.jquery
                    , upload = layui.upload;

            //普通图片上传
            var uploadInst = upload.render({
                elem: '#img-select',
                url: '/upload/img/anchor',
                auto: false,
                multiple: true,
                bindAction: '#img-upload',
                before: function (obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {

                    });
                }
                , done: function (res) {
                    //上传成功
                    if (res.code == 0) {
                        var filename = "img"
                        $('#imgShow').append('<img src="'+ res.data.src +'" alt="'+ filename +'" class="layui-upload-img">')
                        return layer.msg(res.message);
                    }

                    //如果上传失败
                    if (res.code > 0) {
                        return layer.msg(res.message);
                    }


                }
                , error: function () {
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });
        });
        //视屏上传
        layui.use('upload', function () {
            var $ = layui.jquery
                    , upload = layui.upload;

            //视频上传
            var uploadInst = upload.render({
                elem: '#video-select'
                , url: 'https://news.immnc.com/oa/upload/mp4/121212'
                , auto: false
                , multiple: false
                , size: 102400
                , accept:"video"
                , acceptMime: 'video'
                , bindAction: '#video-upload'
                , before: function (obj) {
                    //预读本地文件示例，不支持ie8
                    console.log(obj)
                    obj.preview(function (index, file, result) {
                        console.log(result)
                    });
                }
                , done: function (res) {
                    //上传成功
                    if (res.code == 0) {
                        layer.msg("上传成功")
                        $('#videoShow').append('<video src="https://p0.cdrysj.com/po' + res.data.videoPath + '"  controls="controls" class="layui-upload-video">')
                        app.videoUrl = "https://p0.cdrysj.com/po" + res.data.videoPath
                        return layer.msg( res.data.message);
                    }

                    //如果上传失败
                    if (res.code > 0) {
                        return layer.msg(res.message);
                    }
                }
                , error: function () {
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });
        });
        //富文本编译器
        layui.use('layedit', function () {
            layedit = layui.layedit;
            layedit.set({
                uploadImage: {
                    url: '/upload/img/anchor' //接口url
                    , type: 'post' //默认post
                }
            });
            index = layedit.build('demo'); //建立编辑器


        });

        $("#save").click(function () {

            app.description = layedit.getContent(index);
            app.topTitile = $("#topTitle").val();
            app.bottomTitle = $("#bottomTitle").val();
           function imgUrl() {
               var imgURLS = ""
               $(".layui-upload-img").each(function (i) {
                   imgURLS =  $(this).attr("src") + "," + imgURLS
               })
               return imgURLS

           }
           app.imgUrl =  imgUrl()

            if (app.videoUrl == "" && app.topTitile == "" && app.bottomTitle == "" && app.imgUrl == ""){
                layer.msg("内容必须填写一项");
            }else {
               //ajax 异步提交
                $("#save").attr("disabled", true)
                $.post(
                        "/oa/app/save",
                        {
                            id: app.id,
                            topTitle: app.topTitile,
                            content: app.description,
                            bottomTitle: app.bottomTitle,
                            imgUrl: app.imgUrl,
                            videoUrl: app.videoUrl,

                        },
                        function (data) {
                            if (data.code==0){
                                layer.msg(data.message);
                                setTimeout(function () {
                                    location="/oa/app/list.html"
                                },1000)
                            }
                            if (data.code>0){
                                $("#save").removeAttr("disabled")
                                layer.msg(data.message);
                            }
                        }
                )
            }


        })

    })


</script>
</body>
</html>