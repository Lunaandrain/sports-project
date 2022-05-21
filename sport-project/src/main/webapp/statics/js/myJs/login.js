


layui.use(['form','jquery','layer'],function () {
    var form = layui.form;
    var $ = layui.jquery;
    var layer = layui.layer;

    $('#loginBtn').click(function () {

        //用户名不能为空
        if ($('#username').val().length == 0) {
            layer.msg("用户名为空，登录失败", {offset: '200px'});
            return;
        }


        //密码不能为空
        if ($('#password').val().length == 0) {
            layer.msg("密码为空，登录失败", {offset: '200px'});
            return;
        }

        $.post("/admin/login", {
                'username': $('#username').val(),
                'password': $('#password').val(),

            }, function (data) {
                if (!data.ok) {
                    $('#password').val("");
                    layer.msg(data.mess,{offset: '200px'})

                }
                else{
                    //登录校验成功，跳转到后台首页
                    location.href = "/admin/index";
                }

            },'json'
        )
    })
}

)




