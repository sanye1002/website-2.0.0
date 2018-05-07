<div class="pages">
    <a href="${url}?page=1&size=${size}&type=${type}">首页</a>
    <#list 1..pageContent.getTotalPages() as index>
        <#if currentPage == index >
            <a class="hover" href='${url}?page=${index}&size=${size}&type=${type}'>${index}</a>
        <#else >
        <a href='${url}?page=${index}&size=${size}&type=${type}'>${index}</a>
       </#if>
    </#list>
    <#if currentPage gte pageContent.getTotalPages()>
    <#else>
    <a href="${url}?page=${currentPage+1}&size=${size}&type=${type}">下一页</a>
    </#if>

    <a href="${url}?page=${pageContent.getTotalPages()}&size=${size}&type=${type}">尾页</a>
</div>