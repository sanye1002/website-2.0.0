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
                    <li class="active">轮播图片设置</li>
                </ul>
            </div>
            <!-- /页面面包屑 -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        轮播图片设置
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
                                轮播图片
                                <span class="badge badge-sky badge-square">
                                     提示：首页展示最多6张
                                </span>
                            </div>
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>
                                        id
                                    </th>
                                    <th>
                                        图片
                                    </th>
                                    <th>
                                        结果路径
                                    </th>
                                    <th>
                                        首页展示
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list pageContent.getContent() as index>
                                <tr>
                                    <td>
                                        ${index.getId()}
                                    </td>
                                    <td>
                                        <img src="${index.getPathUrl()}" height="40px">
                                    </td>
                                    <td>
                                        ${index.getPathUrl()}
                                    </td>
                                    <td>
                                        <label>
                                            <input id="${index.getId()}" class="checkbox-slider colored-blue"
                                                   type="checkbox"
                                                   <#if index.getShowStatus() ==1>checked</#if>>
                                            <span class="text"></span>
                                        </label>

                                    </td>
                                </tr>
                                </#list>

                                </tbody>
                            </table>
                        <#include "../common/page.ftl">
                        </div>
                        <div class="well with-header with-footer">
                            <div class="header bordered-sky">
                                轮播图片添加
                                <span class="badge badge-sky badge-square">
                                     提示：图片大小1920px*650px
                                </span>
                            </div>
                            <div class="layui-upload">
                                <button type="button" class="layui-btn layui-btn-normal" id="upload">
                                    上传封面
                                </button>
                                <div class="layui-upload-list">
                                    <img class="layui-upload-img" id="demo1">
                                    <p id="demoText"></p>
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
    var carousel = {
        id: "",
        pathUrl: "",
        showStatus: ""
    }
    $("input[type=checkbox]").click(function () {
        //判断是否选中
        if ($(this).is(':checked')) {
            carousel.showStatus = 1
            carousel.id = $(this).attr("id")
            update()


        } else {
            carousel.id = $(this).attr("id")
            carousel.showStatus = 0
            update()
        }
    })
    function update() {
        $.post(
                "/oa/carousel/save",
                {
                    id: carousel.id,
                    showStatus: carousel.showStatus
                },
                function (data) {
                    if (data.code == 0) {
                        layer.msg(data.message);
                    } else {
                        layer.msg(data.message);
                    }

                }
        )
    }
    $(function () {

        layui.use('upload', function () {
            var $ = layui.jquery
                    , upload = layui.upload;

            //普通图片上传
            var uploadInst = upload.render({
                elem: '#upload',
                url: '/upload/img/carousel',
                before: function (obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {
                        $('#demo1').attr('src', result); //图片链接（base64）
                    });
                }
                , done: function (res) {
                    //上传成功
                    if (res.code == 0) {
                        carousel.pathUrl = res.data.src;
                        save()
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

        function save() {
            $.post(
                    "/oa/carousel/save",
                    {
                        pathUrl: carousel.pathUrl,
                        showStatus: 0
                    },
                    function (data) {
                        if (data.code == 0) {
                            layer.msg(data.message);
                            setTimeout(function () {
                                location = "/oa/carousel/list"
                            }, 2000)
                        } else {
                            layer.msg(data.message);
                        }

                    }
            )
        }


    })


</script>
</body>
</html>