<!DOCTYPE html>
<html lang="en">
<!-- header -->
<#include "../common/header.ftl">
<body>
<div class="login-container animated fadeInDown">
    <div class="loginbox bg-white" style="height: auto !important;">
        <br><br>
        <div class="loginbox-title">
            <i class="fa fa-sign-in"></i>
            <span>登录Login</span>
        </div>
        <br>
        <div class="loginbox-social">
            <div class="social-title">
                <i class="fa fa-quote-left"></i>
                <#if message != "">
                     <span>${message}</span>
                </#if>
                <#if message == "">
                     <span>请在下方键入你的登录信息</span>
                </#if>
                <i class="fa fa-quote-right"></i>
            </div>
        </div>
        <form action="/oa/login/commit" id="loginForm" method="post">
            <div class="loginbox-textbox">
                <input type="text" name="phone" id="phone" class="form-control" placeholder="手机" autocomplete="off"/>
            </div>
            <div class="loginbox-textbox">
                <input type="password" name="password" id="password" class="form-control" placeholder="密码" autocomplete="off"/>
            </div>
            <div class="loginbox-textbox">
                <label>
                    <input type="checkbox" id="code" class="colored-danger">
                    <span class="text">登录安全事项</span>
                </label>
            </div>

            <div class="loginbox-forgot">
                <a href="">
                    <span>忘记密码</span>
                    <i class="fa fa-question"></i>
                </a>
            </div>
            <div class="loginbox-submit text-right">
                <button type="submit" class="btn btn-sky">
                    <i class="fa fa-sign-in"></i>
                    <span id="submit">登录</span>
                </button>
            </div>
        </form>
        <br>
        <br>
    </div>
</div>
<#include "../common/footjs.ftl">
<script type="text/javascript">
    $(function(){
        $("#loginForm").submit(function () {
            var obj = $(this);
            var phone = obj.find("input[name='phone']").val();
            var password = obj.find("input[name='password']").val();
            var code = $("#code:checked").val();
            var type = obj.find("option:selected").val();

            if (phone==""){
                layer.msg("手机号码不能为空，请重新输入！",{
                    time:1000
                });
                return false;
            }
            if (password==""){
                layer.msg("密码不能为空，请重新输入！",{
                    time:1000
                });
                return false;
            }
            if (code==undefined){
                layer.msg("请勾选登录安全事项！",{
                    time:1000
                });
                return false;
            }else {
                return true;
            }



        })

    })

</script>

</body>

</html>