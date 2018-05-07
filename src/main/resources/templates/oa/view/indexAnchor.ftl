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
                    <li class="active">首页主播设置</li>
                </ul>
            </div>
            <!-- /页面面包屑 -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        首页主播设置
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
                                首页主播设置
                                <span class="badge badge-sky badge-square">
                                     提示：首页展示最好展示6位
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
                                        主播名称
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
                                        <img src="${index.getSmallImg()}" height="40px">
                                    </td>
                                    <td>
                                        ${index.getNickname()}
                                    </td>
                                    <td>
                                        <label>
                                            <input id="${index.getId()}" class="checkbox-slider colored-blue" type="checkbox"<#if index.getShowStatus() ==1>checked</#if>>
                                            <span class="text"></span>
                                        </label>

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
    var anchor = {
        id: "",
        pathUrl: "",
        showStatus: ""
    }
    $("input[type=checkbox]").click(function () {
        //判断是否选中
        if ($(this).is(':checked')) {
            anchor.showStatus = 1
            anchor.id = $(this).attr("id")
            update()


        } else {
            anchor.id = $(this).attr("id")
            anchor.showStatus = 0
            update()
        }
    })

    function update() {
        $.post(
                "/oa/index/changeShow",
                {
                    id: anchor.id,
                    showStatus: anchor.showStatus
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



</script>
</body>
</html>