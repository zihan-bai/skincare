<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<script src="layui/layui.js"></script>


<%--登录对话框--%>
<script type="text/html" id="login-dialog">
    <form class="layui-form" action="" lay-filter="login-form">
        <div class="layui-form-item">
            <label class="layui-form-label">Username</label>
            <div class="layui-input-block">
                <input type="text" name="uname" required lay-verify="required" placeholder="please enter username"
                       class="layui-input">

            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Password</label>
            <div class="layui-input-block">
                <input type="password" name="password" required lay-verify="required" placeholder="please enter password"
                       class="layui-input">

            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="login-but"><i class="layui-icon">&#xe613;</i>Login</button>
            </div>
        </div>
    </form>
</script>
<script type="text/javascript">
    layui.use(['layer','form','jquery'],function () {
        const layer = layui.layer;
        const $ = layui.$;
        const form = layui.form;
        layer.open({
            type: 1,
            closeBtn :0,
            title: '登录',
            area:['350px'],
            content: $("#login-dialog").html()
        })

        
        
         // return "0"; //认证成功
		//return "4"; // 4: 用户名错误

		//return "1"; // 1: 密码错误

		//return "2"; // 2: 账号被锁住

		//return "3"; // 3: 认证失败
	
        //添加数据
        form.on('submit(login-but)', function (data) {

            $.post('userController/login', data.field, function (flag) {
                if (flag=='4') {
                    layer.msg('你输入的用户名有误');
                } else  if(flag=='1'){
                    layer.msg('你输入的密码有误');
                }else  if(flag=='2'){
                    layer.msg('你输入的账号多次输入错误,账号被锁住');
                }else  if(flag=='3'){
                    layer.msg('认证失败');
                }else if (flag=='0'){//认证成功
                    window.location.href="index.jsp";
                }
            })
            return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
        })


    })
</script>
</body>
</html>
