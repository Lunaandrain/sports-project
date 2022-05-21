
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/statics/layui/css/layui.css">
    <link rel="stylesheet" href="/statics/bootstrap-3.3.7-dist/css/bootstrap.min.css">




    <style type="text/css">
        #particles-js {
            position: absolute;
            width: 100%;
            height: 100%;
        }
        .login-wrapper {
            position: absolute;
            margin-left: auto;
            margin-right: auto;
            left: 0;
            right: 0;
            margin-top: 30%;
            padding: 2em 2em;
            background: rgba(22, 26, 33, 0.8);
            border-radius: 6px;
        }
        .login-title {
            color: #fff;
            text-align: center;
            margin-bottom: 26px;
            font-weight: normal;
            font-size: 15px;
        }

        .close{
            background-color: white;
            border: none;
            font-size: 18px;
            margin-left: 410px;
            margin-top: -10px;
        }

        .layui-input{
            border-radius: 5px;
            width: 300px;
            height: 40px;
            font-size: 15px;
        }
        .layui-form-item{
            margin-left: -20px;
        }
        #logoid{
            margin-top: -16px;
            padding-left:150px;
            padding-bottom: 15px;
        }
        .layui-btn{
            margin-left: -50px;
            border-radius: 5px;
            width: 350px;
            height: 40px;
            font-size: 15px;
        }
        .verity{
            width: 120px;
        }
        .font-set{
            font-size: 13px;
            text-decoration: none;
            margin-left: 120px;
        }
        a:hover{
            text-decoration: underline;
        }
        svg text {
            animation: stroke 5s infinite alternate;
            letter-spacing:20px;
            font-size: 100px;
            font-family: FZShuTi;
        }
        .login-top {


            width: 1500px;
            height: 200px;
            margin: 20px auto;
            margin-left: 300px;
            overflow: hidden;
            padding-top: 10px;
            line-height: 40px;
            /*border-style:solid;*/
        }
        svg text {

            animation: stroke 5s infinite alternate;
            letter-spacing: 10px;
            font-size: 120px;
        }

        @keyframes stroke {
            0% {
                fill: rgba(72, 138, 20, 0);
                stroke: rgba(54, 95, 160, 1);
                stroke-dashoffset: 25%;
                stroke-dasharray: 0 50%;
                stroke-width: 1;
            }

            70% {
                fill: rgba(72, 138, 20, 0);
                stroke: rgba(54, 95, 160, 1);
                stroke-width: 3;
            }

            90%,
            100% {
                fill: rgba(72, 138, 204, 1);
                stroke: rgba(54, 95, 160, 0);
                stroke-dashoffset: -25%;
                stroke-dasharray: 50% 0;
                stroke-width: 0;
            }
        }
        .login {
            background-image: url("./statics/images/background.jpg");
            background-size: 100% 100%;
            margin-top:0.5rem;
            margin-left:0.5rem;
            height: 100%;
            position: fixed;
            width: 100%;
            background-repeat: no-repeat;
            margin-top:-0.1rem;
            margin-left:-0.1rem;
        }
        .container{
            background: rgba(255, 255, 255, 0.1);

            background-size: cover;
            width: 400px;
            height: 340px;
            margin: 50px auto;
            overflow: hidden;
            padding-top: 10px;
            line-height: 70px;}
        #password {
            margin-bottom: 40px;
        }
        #username{
            margin-bottom: 20px;
        }
        h3 {
            color: #0babeab8;
            font-size: 24px;
        }
        hr {
            background-color: #444;
            margin: 20px auto;
        }
        a {
            text-decoration: none;
            color: #aaa;
            font-size: 15px;
        }
        a:hover {
            color: coral;
        }
        #button{
            margin-left: 2px;
        }
        .redItem .el-form-item__label{
            color: white;
        }
    </style>
</head>
<body>

<div class="login">
    <div id="particles-js">
    </div>
    <div class="login-top">
        <svg viewBox="0 0 1500 200">
            <text x="0" y="70%"> 运动赛事管理系统 </text>
        </svg>
    </div>




    <div class="container">
        <div class="layui-row">
            <div class="layui-col-md4 ">
                <h3 style="color:cornflowerblue">裁判员登录</h3>

            </div>
            <div class="layui-col-md4  layui-col-md-offset4">
                <button type="button"  id="back"    class="layui-btn"     style="width:150px" >
                    <i class="layui-icon layui-icon-left layui-font-12" ></i> 返回选择界面
                </button>
            </div>
        </div>
        <hr>
        <form class="layui-form" action="" method="post">

            <div class="layui-form-item">
                <label class="layui-form-label" style="color:cornflowerblue;font-size: medium;margin-left: 25px">用户名</label>
                <div class="layui-input-block">
                    <input type="text" name="title" id="username"
                           style="width: 200px ;margin-left: 18px" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label" style="color:cornflowerblue;font-size: medium;margin-left: 20px">密 &nbsp;码</label>
                <div class="layui-input-inline">
                    <input  id="password"   type="password" name="password"  required  lay-verify="required"
                            placeholder="请输入密码" style="width: 200px;margin-left: 25px" autocomplete="off" class="layui-input">
                </div>

            </div>



            <div class="layui-form-item">
                <div class="layui-input-block">
                    <%----%>
                    <input type='button' class="layui-btn" id="loginBtn" value="登录" style="width: 50%; margin-left: 30px;margin-top: -50px">
                </div>
            </div>


        </form>


    </div>
</div>

<script src="/blog/js/jquery/jquery-2.1.1.min.js"></script>



<script type="text/javascript" src="/statics/layui/layui.js"></script>

<script src="/statics/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/statics/js/particles.js"></script>






</body>

<script>



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

                $.post("/referee/login", {
                        'username': $('#username').val(),
                        'password': $('#password').val(),

                    }, function (data) {
                        if (!data.ok) {
                            $('#password').val("");
                            layer.msg(data.mess,{offset: '200px'})

                        }
                        else{
                            //登录校验成功，跳转到后台首页
                            location.href = "/referee/index";
                        }

                    },'json'
                )
            })

        $('#back').click(function () {
            location.href="choose.jsp"
        })



        }

    )





    particlesJS("particles-js", {
        "particles": {
            "number": {
                "value": 90,
                "density": {
                    "enable": true,
                    "value_area": 800
                }
            },
            "color": {
                "value": "#ffffff"
            },
            "shape": {
                "type": "triangle",
                "stroke": {
                    "width": 0,
                    "color": "#000000"
                },
                "polygon": {
                    "nb_sides": 5
                },
            },
            "opacity": {
                "value": 0.5,
                "random": false,
                "anim": {
                    "enable": false,
                    "speed": 1,
                    "opacity_min": 0.1,
                    "sync": false
                }
            },
            "size": {
                "value": 3,
                "random": true,
                "anim": {
                    "enable": false,
                    "speed": 50,
                    "size_min": 0.1,
                    "sync": false
                }
            },
            "line_linked": {
                "enable": true,
                "distance": 150,
                "color": "#ffffff",
                "opacity": 0.6,
                "width": 1
            },
            "move": {
                "enable": true,
                "speed": 6,
                "direction": "none",
                "random": false,
                "straight": false,
                "out_mode": "out",
                "bounce": false,
                "attract": {
                    "enable": false,
                    "rotateX": 600,
                    "rotateY": 1200
                }
            }
        },
        "interactivity": {
            "detect_on": "canvas",
            "events": {
                "onhover": {
                    "enable": true,
                    "mode": "grab"
                },
                "onclick": {
                    "enable": true,
                    "mode": "push"
                },
                "resize": true
            },
            "modes": {
                "grab": {
                    "distance": 120,
                    "line_linked": {
                        "opacity": 1
                    }
                },
                "bubble": {
                    "distance": 500,
                    "size": 50,
                    "duration": 2,
                    "opacity": 8,
                    "speed": 3
                },
                "repulse": {
                    "distance": 200,
                    "duration": 0.6
                },
                "push": {
                    "particles_nb": 6
                },
                "remove": {
                    "particles_nb": 2
                }
            }
        },
        "retina_detect": true
    });
    // layui.use(['form', 'layedit', 'laydate'], function(){
    //     var form = layui.form
    //         ,layer = layui.layer
    //         ,layedit = layui.layedit
    //         ,laydate = layui.laydate;

    //日期
    /* laydate.render({
       elem: '#date'
     });
     laydate.render({
       elem: '#date1'
     });

     //创建一个编辑器
     var editIndex = layedit.build('LAY_demo_editor');

     //自定义验证规则
     form.verify({
       title: function(value){
         if(value.length < 5){
           return '标题至少得5个字符啊';
         }
       }
       ,pass: [
         /^[\S]{6,12}$/
         ,'密码必须6到12位，且不能出现空格'
       ]
       ,content: function(value){
         layedit.sync(editIndex);
       }
     });

     //监听指定开关
     form.on('switch(switchTest)', function(data){
       layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
         offset: '6px'
       });
       layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
     });*/

    //监听提交
    // form.on('submit(demo1)', function(data){
    //     layer.alert(JSON.stringify(data.field), {
    //         title: '最终的提交信息'
    //     })
    //     return false;
    // });

    //表单初始赋值
    /* form.val('example', {
       "username": "贤心" // "name": "value"
       ,"password": "123456"
       ,"interest": 1
       ,"like[write]": true //复选框选中状态
       ,"close": true //开关状态
       ,"sex": "女"
       ,"desc": "我爱 layui"
     })*/


    // });
</script>

</html>

