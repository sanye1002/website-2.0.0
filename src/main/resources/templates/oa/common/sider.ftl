<div class="page-sidebar" id="sidebar">
    <!-- Page Sidebar Header-->
    <div class="sidebar-header-wrapper">
        <input type="text" class="searchinput"/>
        <i class="searchicon fa fa-search"></i>
        <div class="searchhelper">Search </div>
    </div>
    <ul class="nav sidebar-menu">
        <!--Dashboard-->
        <li class="active">
            <a href="index.html">
                <i class="menu-icon glyphicon glyphicon-home"></i>
                <span class="menu-text"> 控制台 </span>
            </a>
        </li>

        <!--UI Elements-->
        <li <#if pageId==5|| pageId==6>class="open" </#if>>
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-desktop"></i>
                <span class="menu-text">首页设置</span>
                <i class="menu-expand"></i>
            </a>
            <ul class="submenu">
                <li <#if pageId==6>class="active" </#if>>
                    <a href="/oa/index/anchor">
                        <span class="menu-text">首页主播</span>
                    </a>
                </li>
                <li <#if pageId==5>class="active" </#if>>
                    <a href="/oa/carousel/list" class="menu-dropdown">
                        <span class="menu-text">轮播图</span>
                    </a>
                </li>
            </ul>
        </li>
        <!--Tables-->
        <li <#if pageId==1|| pageId==2>class="open" </#if>>
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-table"></i>
                <span class="menu-text"> 艺人管理 </span>

                <i class="menu-expand"></i>
            </a>

            <ul class="submenu">
                <li <#if pageId==1>class="active" </#if>>
                    <a href="/oa/anchor/list">
                        <span class="menu-text">查询艺人</span>
                    </a>
                </li>
                <li <#if pageId==2>class="active" </#if>>
                    <a href="/oa/anchor/index">
                        <span class="menu-text">添加艺人</span>
                    </a>
                </li>
            </ul>
        </li>
        <!--Forms-->
        <li <#if pageId==3|| pageId==4>class="open" </#if>>
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-pencil-square-o"></i>
                <span class="menu-text"> 文章管理 </span>

                <i class="menu-expand"></i>
            </a>

            <ul class="submenu">
                <li <#if pageId==4>class="active" </#if>>
                    <a href="/oa/article/list">
                        <span class="menu-text">查询文章</span>
                    </a>
                </li>

                <li <#if pageId==3>class="active" </#if>>
                    <a href="/oa/article/index">
                        <span class="menu-text">发布文章</span>
                    </a>
                </li>

            </ul>
        </li>
        <!--Charts-->
       <#-- <li>
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-bar-chart-o"></i>
                <span class="menu-text"> 背景图设置 </span>

                <i class="menu-expand"></i>
            </a>

            <ul class="submenu">
                <li>
                    <a href="">
                        <span class="menu-text">底部背景图片</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <span class="menu-text">关于我们背景</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <span class="menu-text">关于团队背景</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <span class="menu-text">签约艺人背景</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <span class="menu-text">案例展示背景</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <span class="menu-text">艺人招募背景</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <span class="menu-text">业界动态背景</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <span class="menu-text">人才招聘背景</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <span class="menu-text">商务合作背景</span>
                    </a>
                </li>

            </ul>
        </li>-->

        <!--Mail-->
        <li  <#if pageId==9|| pageId==10>class="open" </#if>>
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-envelope-o"></i>
                <span class="menu-text"> 人才招募 </span>

                <i class="menu-expand"></i>
            </a>

            <ul class="submenu">
                <li <#if pageId==9>class="active" </#if>>
                    <a href="/oa/job/list">
                        <span class="menu-text">职位查看</span>
                    </a>
                </li>

                <li <#if pageId==10>class="active" </#if>>
                    <a href="/oa/job/index">
                        <span class="menu-text">职位添加</span>
                    </a>
                </li>
            </ul>
        </li>

        <!--Pages-->
        <li <#if pageId==7>class="open" </#if>>
            <a href="#" class="menu-dropdown">
                <i class="menu-icon glyphicon glyphicon-paperclip"></i>
                <span class="menu-text"> 关于我们 </span>

                <i class="menu-expand"></i>
            </a>
            <ul class="submenu">
                <li <#if pageId==7>class="active" </#if>>
                    <a href="/oa/team/list">
                        <span class="menu-text">团队管理</span>
                    </a>
                </li>

            </ul>
        </li>
        <!--More Pages-->
       <#-- <li>
            <a href="#" class="menu-dropdown">
                <i class="menu-icon glyphicon glyphicon-link"></i>

                <span class="menu-text">
                                用户管理
                            </span>

                <i class="menu-expand"></i>
            </a>

            <ul class="submenu">
                <li>
                    <a href="error-404.html">
                        <span class="menu-text">Error 404</span>
                    </a>
                </li>
            </ul>
        </li>-->
        <!--Right to Left-->
        <li <#if pageId==8>class="open" </#if>>
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-align-right"></i>
                <span class="menu-text">主播申请</span>

                <i class="menu-expand"></i>
            </a>
            <ul class="submenu">
                <li <#if pageId==8>class="active" </#if>>
                    <a href="/oa/register/list">
                        <span class="menu-text">申请列表</span>
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</div>