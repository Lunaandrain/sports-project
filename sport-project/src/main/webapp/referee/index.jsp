<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>裁判员系统</title>
    <script src="/blog/js/jquery/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/blog/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/statics/layui/css/layui.css">


</head>
<body>

<div class="layui-layout layui-layout-admin">

    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">裁判员系统</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->



        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;" onclick="loginOut()" >

                    <a>
                        ${sessionScope.referee.r_name}</a>
                </a>
                <dl class="layui-nav-child">

                    <dd> <button type="button" class="layui-btn layui-btn-radius" id="modifyadmin" >个人信息</button> </dd>

                </dl>
            </li>
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <button type="button" class="layui-btn layui-btn-radius" onclick="loginOut()">退出登录</button>


            </li>

        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="./1.jsp" target="1">首页</a>

                </li>
                <li class="layui-nav-item ">
                    <a class="" href="./2.jsp" target="1">查看赛程</a>

                </li>


            </ul>
        </div>
    </div>

    <div class="layui-body" style="margin-left: 20px; margin-top: 20px">



        <div >
            <iframe  height="650px" width="1400px" src="1.jsp" frameborder="0" scrolling="no" name="1">
            </iframe>

        </div>


    </div>


        </div>













<script src="/blog/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="/statics/layui/layui.js" type="text/javascript"></script>
<script>
    //JS
    layui.use(['element', 'layer', 'util','table'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,table=layui.table
            ,$ = layui.jquery;


        //修改裁判员信息
        $("#modifyadmin").click(function (){

            layer.open({
                type:2,
                title:'裁判员信息',
                content:"/referee/modifyreferee.jsp",
                area:["500px","350px"]



            });
        });







        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }

        });



    });
    function loginOut() {
        layer.alert('确定退出系统吗？', {
            time: 0 //不自动关闭
            ,btn: ['确定', '取消']
            ,yes: function(index){
                layer.close(index);
                location.href = "/referee/loginOut";
            }
        });
    }

</script>
</body>
</html>
