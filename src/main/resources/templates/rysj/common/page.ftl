<div class="pages">
    <a href="${url}?page=1&size=${size}">首页</a>
    <#if pageContent.getTotalPages() lte 5>
        <#list 1..pageContent.getTotalPages() as index>
            <#if currentPage == index >
           <a class=" page-active-style" href='${url}?page=${index}&size=${size}'>${index}</a>
            <#else >
        <a   href='${url}?page=${index}&size=${size}'>${index}</a>
            </#if>
        </#list>
    <#elseif currentPage lte 3>
        <#list 1..5 as index>
            <#if currentPage == index >
           <a class=" page-active-style" href='${url}?page=${index}&size=${size}'>${index}</a>
            <#else >
        <a   href='${url}?page=${index}&size=${size}'>${index}</a>
            </#if>
        </#list>
    <#elseif  currentPage gt 3 && currentPage lte pageContent.getTotalPages()-2>
        <#list currentPage-2..currentPage+2 as index>
            <#if currentPage == index >
           <a class=" page-active-style" href='${url}?page=${index}&size=${size}'>${index}</a>
            <#else >
        <a   href='${url}?page=${index}&size=${size}'>${index}</a>
            </#if>
        </#list>
    <#elseif  currentPage gt pageContent.getTotalPages()-2>
        <#list pageContent.getTotalPages()-4..pageContent.getTotalPages() as index>
            <#if currentPage == index >
            <a class=" page-active-style" href='${url}?page=${index}&size=${size}'>${index}</a>
            <#else >
            <a href='${url}?page=${index}&size=${size}'>${index}</a>
            </#if>
        </#list>
    </#if>
    <#if currentPage gte pageContent.getTotalPages()>
    <#else>
    <a href="${url}?page=${currentPage+1}&size=${size}">下一页</a>
    </#if>

    <a href="${url}?page=${pageContent.getTotalPages()}&size=${size}">尾页</a>
</div>
