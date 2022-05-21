<%--
  Created by IntelliJ IDEA.
  User: 卞雅薇
  Date: 2021/12/13
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/statics/layui/css/layui.css">
</head>
<body>



<%--增加表单信息--%>
<div class="site-text" style="margin: 5%; display: none" id="window"  target="test123">
    <form class="layui-form" id="updatadoctorform"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->


        <div class="layui-form-item">
            <label class="layui-form-label"  style="width: 100px;">分数1</label>
            <div class="layui-input-block" >
                <input type="text" id="1" name="score1"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"  style="width: 100px;">分数2</label>
            <div class="layui-input-block" >
                <input type="text" id="2" name="score2"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"  style="width: 100px;">分数3</label>
            <div class="layui-input-block" >
                <input type="text" id="3" name="score3"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"  style="width: 100px;">分数4</label>
            <div class="layui-input-block" >
                <input type="text" id="4" name="score4"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"  style="width: 100px;">分数5</label>
            <div class="layui-input-block" >
                <input type="text" id="5" name="score5"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"  style="width: 100px;">总成绩</label>
            <div class="layui-input-block" >
                <input type="text" id="6" name="score6"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <button type="button" onclick="final()"  class="layui-btn layui-btn-radius layui-btn-normal">录入总成绩</button>
    </form>
</div>

<script src="/statics/layui/layui.js" type="text/javascript"></script>
<script>


    layui.use('form', function() {
        var form = layui.form;
        var $ = layui.jquery;
        //定义layui中的方法
        window.score = function score() {

            var input =document.getElementById("hhh");
            var degree=input.value;

            $.post("/referee/score",
                {
                    g_id:${sessionScope.match.g_id},
                    p_id:${sessionScope.match.p_id},
                    match_type:"${sessionScope.match.match_type}",
// --字符串要打引号--%>
                    a_id:${sessionScope.a_id},
                    t_id:${sessionScope.t_id},
                    degree:degree

                },
                function (data){
                    if(!data){
                        layer.alert(data.mess, {icon: 6});}
                    else{
                        setTimeout(function () {
//重新登录,跳转到登录页面
//setTimeout:隔多长时间执行指定代码
                            layer.msg(data.mess, {icon: 1,time:1000},function(){
//延时跳转并提示



                            });

                        },1000);
                    }

                },'json')
        }
    })






</script>
</body>
</html>


