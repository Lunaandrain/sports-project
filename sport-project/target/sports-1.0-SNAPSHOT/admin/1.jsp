
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="/statics/layui/css/layui.css" media="all">
</head>

<body>

<div class="login-top">
    <svg viewBox="0 0 1500 200">
        <text x="0" y="70%"> 欢迎进入管理员页面 </text>
    </svg>
</div>
<div class="layui-carousel" id="test1"  style="margin-left: 100px">
    <div carousel-item>
        <div> <img style="object-fit: fill;"    src="./image/1.jpg"></img></div>
        <div> <img style="object-fit: fill;"    src="./image/2.jpg"></img></div>
        <div> <img style="object-fit: fill;"    src="./image/3.jpg"></img></div>
    </div>
</div>



<style>
    svg text {
        animation: stroke 5s infinite alternate;
        letter-spacing:20px;
        font-size: 100px;
        font-family: FZShuTi;
    }
    .login-top {


        width: 1500px;
        height: 200px;
        margin-top: -50px;
        margin-left: 200px;
        overflow: hidden;
        padding-top: 10px;
        line-height: 40px;
        /*border-style:solid;*/
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
</style>
<script src="/statics/layui/layui.js"></script>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'

            ,width: '1200px' //设置容器宽度
            ,height:'500px'
            ,arrow: 'always' //始终显示箭头width: 1400px;height: 650px"
            //,anim: 'updown' //切换动画方式
        });
    });
</script>
</body>
</html>