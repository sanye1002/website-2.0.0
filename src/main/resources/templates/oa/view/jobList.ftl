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
                    <li class="active">工作列表</li>
                </ul>
            </div>
            <!-- /页面面包屑 -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        工作列表
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
                                工作设置
                                <span class="badge badge-sky badge-square">
                                     提示：工作不用时可以不显示,不删除方便下次展示
                                </span>
                            </div>
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>
                                        id
                                    </th>
                                    <th>
                                        标题
                                    </th>
                                    <th>
                                        内容
                                    </th>
                                    <th colspan="2">
                                        首页展示/删除
                                    </th>

                                </tr>
                                </thead>
                                <tbody>
                                <#list pageContent.getContent() as index>
                                <tr id="tr${index.getId()}">
                                    <td>
                                        ${index.getId()}
                                    </td>
                                    <td>
                                        ${index.getTitle()}
                                    </td>
                                    <td>
                                        不展示
                                    </td>
                                    <td>
                                        <label>
                                            <input id="${index.getId()}" class="checkbox-slider colored-blue" <#if index.getShowStatus() == 1>checked</#if> type="checkbox" >
                                            <span class="text"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <a class="btn btn-danger delete"
                                           onclick="deleteJob(${index.getId()})"><i
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
<script type="text/javascript">
    var job = {
        id: "",
        showStatus: ""
    }
    $("input[type=checkbox]").click(function () {
        //判断是否选中
        if ($(this).is(':checked')) {
            job.showStatus = 1
            job.id = $(this).attr("id")
            update()


        } else {
            job.id = $(this).attr("id")
            job.showStatus = 0
            update()
        }
    })

    function update() {
        $.post(
                "/oa/job/save",
                {
                    id: job.id,
                    showStatus: job.showStatus
                },
                function (data) {
                    if (data.code == 0) {
                        alert(data.message);
                    } else {
                        alert(data.message);
                    }

                }
        )
    }
    function deleteJob(id) {
        $.post(
                "/oa/job/delete",
                {id: id},
                function (res) {
                    if (res.code==0){

                        alert(res.message)
                        $("#tr"+id).remove()
                    }

                }
        )
    }

</script>
</body>
</html>