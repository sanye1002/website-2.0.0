<footer style="background-image: url(/rysj/imgs/footer_log.jpg);" class="pingpu-bg" id="yy">
    <div id="demo" class="footer container sx-padding">
        <div class="clearfix wow animated fadeIn">
            <section>
                <h3>益豪娱创文化传媒</h3>

                <img src="/rysj/imgs/erweima.png">

            </section>
            <section class="bianju">
                <h3>关于我们</h3>
                <address>
                    <ul class="list-unstyled">
                        <li>公司地址：四川省成都市高新区天合凯旋广场3栋31楼4号</li>
                        <li>服务电话：18145032533</li>
                        <li>E-mail：331139839@qq.com</li>
                    </ul>
                </address>
                <h4>快捷入口</h4>
                <p><a href="/rysj/about/company" target="_blank">关于我们</a> /
                    <a href="/rysj/anchor/list" target="_blank">签约艺人</a> /
                    <a href="/rysj/article/list?type=3" target="_blank">业务展示</a> /
                    <a href="/rysj/recruit/anchor" target="_blank">艺人招募</a>
                </p>
                <p class="zhixun"><a href="http://wpa.qq.com/msgrd?v=3&uin=331139839&site=qq&menu=yes" class="qq"
                                     target="_blank">在线QQ咨询</a></p>
            </section>
            <section>
                <h3>填写主播申请表</h3>
                <div>
                    <input type="hidden" name="action" value="post"/>
                    <input type="hidden" name="diyid" value="1"/>
                    <input type="hidden" name="do" value="2"/>
                    <ul class="list-unstyled">
                        <li>
                            <input name="xm" type="text" id="xm" value="" placeholder="您的尊称 Name" maxlength="10"
                                   onFocus="if (value =='您的尊称 Name'){value =''}"
                                   onBlur="if (value ==''){value='您的尊称 Name'}">
                        </li>
                        <li>
                            <input name="dh" type="text" id="dh" value="" placeholder="您的电话 Phone" maxlength="11"
                                   onFocus="if (value =='您的电话 Phone'){value =''}"
                                   onBlur="if (value ==''){value='您的电话 Phone'}">
                        </li>
                        <li>
                            <textarea name="nr" cols="" id="nr" value="" placeholder="在这里输入您的个人简介及才艺 Content"
                                      maxlength="200" onFocus="if (value =='您的个人简介，才艺等。 Content'){value =''}"
                                      onBlur="if (value ==''){value='您的个人简介，才艺等。 Content'}">您的个人简介，才艺等。 Content</textarea>
                        </li>
                        <input type="hidden" name="" value="xm,text;dh,text;nr,multitext"/>
                        <input type="hidden" name="" value="af9692c6aaa5752e3fce5a141f10a7c8"/>
                        <li>
                            <input name="button" onclick="CheckForm()" type="button" id="button" value="立即提交 Submit →">
                        </li>
                    </ul>
                </div>
                <script language="javascript" type="text/javascript">
                    function CheckForm() {
                        var name = $("#xm").val()
                        var phone = $("#dh").val()
                        var remark = $("#nr").val()
                        $.post(
                                "/register/anchor",
                                {
                                    name:name,
                                    phone:phone,
                                    remark:remark
                                },
                                function (res) {
                                   alert(res.message)
                                }
                        )
                    }
                </script>
            </section>
        <#--   <section>
               <h3>内容搜索 Search</h3>
               <form name="formsearch" action="/plus/search.php">
                   <ul class="list-unstyled">
                       <li><input name="q" type="text" class="key" value="输入关键词 Keyword" placeholder="输入关键词 Keyword"
                                  onFocus="if (value =='输入关键词 Keyword'){value =''}"
                                  onBlur="if (value ==''){value='输入关键词 Keyword'}"/><input type="submit"
                                                                                          class="s-button" value="搜索"/>
                       </li>
                   </ul>
               </form>
               <form method="post" target="_blank" action="http://list.qq.com/cgi-bin/qf_compose_send">
                   <ul class="list-unstyled">
                       <li class="mail-tx">输入邮箱定期接收我们的最新信息</li>
                       <li><input type="hidden" value="qf_booked_feedback" name="t"/>
                           <input type="hidden" value="79d7181ac4d8b0144664925406fa6b1ebc29568929546ae8" name="id"/>
                           <input type="text" class="mail" name="to" id="to" value="Email Address"
                                  placeholder="Email Address" onFocus="if (value =='Email Address'){value =''}"
                                  onBlur="if (value ==''){value='Email Address'}"/><input type="submit"
                                                                                          class="m-button" value="提交">
                       </li>
                   </ul>
               </form>
           </section>-->
        </div>
        <div class="yq-link">
            <hr/>

        </div>
    </div>
    <div class="foot">
        <div class="container clearfix">
            <p class="copy pull-left">COPYRIGHT © 2014-2017 成都荣耀世纪文化传媒有限公司 蜀ICP备17008769号-1</p>
            <p class="renzheng pull-right text-right"><img src="/rysj/picture/2014090504144234.png" width="32"
                                                           height="32"
                                                           alt="工商合法注册企业" title="工商合法注册企业"/> <img
                    src="/rysj/picture/2014090504203747.png" width="32" height="32" alt="安全网站" title="安全网站"/> <img
                    src="/rysj/picture/2014090504244226.png" width="32" height="32" alt="网上报警" title="网上报警"/></p>
        </div>
    </div>
</footer>