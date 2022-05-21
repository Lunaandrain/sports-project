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


<form class="layui-form" id="updatarefereeform">
<div class="layui-form-item">
    <label class="layui-form-label">打分</label>
<%--    g_id:${sessionScope.match.g_id},--%>
<%--    p_id:${sessionScope.match.p_id},--%>
<%--    match_type:"${sessionScope.match.match_type}",--%>
<%--    // --字符串要打引号&ndash;%&gt;--%>
<%--    a_id:${sessionScope.a_id},--%>
<%--    t_id:${sessionScope.t_id},--%>
    <div class="layui-input-block">
        <input type="text" id="hhh"  name="username" value="" autocomplete="off" class="layui-input">
    </div>
</div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="button" onclick="score()"  class="layui-btn" lay-submit lay-filter="*">确定</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

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


