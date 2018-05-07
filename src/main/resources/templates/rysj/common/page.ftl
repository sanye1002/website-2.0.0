<div class="pages">
    <a href="${url}?page=1&size=${size}">首页</a>
    <#list 1..pageContent.getTotalPages() as index>

        <#if currentPage == index >
           <a class="hover" href='${url}?page=${index}&size=${size}'>${index}</a>
        <#else >
        <a href='${url}?page=${index}&size=${size}'>${index}</a>
        </#if>
    </#list>
    <#if currentPage gte pageContent.getTotalPages()>
    <#else>
    <a href="${url}?page=${currentPage+1}&size=${size}">下一页</a>
    </#if>

    <a href="${url}?page=${pageContent.getTotalPages()}&size=${size}">尾页</a>
</div>