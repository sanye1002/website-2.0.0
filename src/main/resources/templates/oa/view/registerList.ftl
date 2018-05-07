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
                    <li class="active">艺人申请</li>
                </ul>
            </div>
            <!-- /页面面包屑 -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        艺人申请
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
                    <div class="col-md-12 col-xs-12">
                        <div class="well with-header with-footer">
                            <div class="header bordered-sky">
                                艺人列表
                                <span class="badge badge-sky badge-square">

                                </span>
                            </div>

                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>
                                        艺人姓名
                                    </th>
                                    <th>
                                        艺人电话
                                    </th>
                                    <th>
                                        艺人备注
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
                                <#list pageContent.getContent() as register >
                                <tr id="#{register.getId()}">
                                    <td>
                                        ${register.getName()}
                                    </td>
                                    <td>
                                        ${register.getPhone()}
                                    </td>

                                    <td>
                                        ${register.getRemark()}
                                    </td>
                                    <td>
                                        ${register.getCreateTime()}
                                    </td>
                                    <td>
                                        <a class="btn btn-danger delete"
                                           onclick="deleteArticle(${register.getId()})"><i
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
    function deleteArticle(id) {
        $.post(
                "/oa/register/delete",
                {id: id},
                function (res) {
                    if (res.code == 0) {
                        alert(res.message)
                        $("#" + id).remove()
                    }
                    if (res.code == 100) {
                        alert(res.message)
                    }

                }
        )
    }
</script>
</body>
</html>