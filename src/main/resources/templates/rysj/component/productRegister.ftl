<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>申请</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
</head>
<body>

<div style="width: 600px;height: 400px;padding: 10px">
    <form class="layui-form" action="" lay-filter="example">
        <div class="layui-form-item">
            <label class="layui-form-label">您的贵姓：</label>
            <div class="layui-input-block">
                <input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="您的贵姓"
                       class="layui-input">
                <input type="radio" name="sex" title="先生" checked="" value="1">
                <input type="radio" name="sex" title="女士" value="0" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">您的手机号码：</label>
            <div class="layui-input-block">
                <input type="text" name="phone" lay-verify="phone" placeholder="您的手机号码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">

        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">你的需求</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea" name="description"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            </div>
        </div>
    </form>
</div>
</body>
<!--Basic Scripts-->
<script src="/assets/js/jquery-2.0.3.min.js"></script>
<!--此处补充js文件-->
<script src="/layer/layer.js"></script>
<script src="/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: [/[\S]+/,'必填项']
            , phone: [/^1\d{10}$/, '正确的手机号码']
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });


        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.closeAll()
            layer.msg('请稍等...', {
                icon: 16
                , shade: 0.01
            });
            $.post(
                    "/rysj/product/save",
                    data.field,
                    function (data) {
                        if (data.code==0){
                            layer.msg(data.message);
                        }
                        if (data.code>0){
                            layer.msg(data.message);
                        }
                    }
            )
            return false;
        });

        //表单初始赋值



    });
</script>
</html>