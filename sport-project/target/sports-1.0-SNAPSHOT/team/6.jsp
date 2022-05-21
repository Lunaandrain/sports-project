<%--
  Created by IntelliJ IDEA.
  User: 卞雅薇
  Date: 2021/12/12
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script src="/blog/js/jquery/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/blog/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/statics/layui/css/layui.css">
</head>
<body>
<div class="layui-body">
    <!-- 内容主体区域 -->
    <div class=" col-md-10   main" id="main">
        <h1 class="page-header">决赛成绩排名<span class="badge" ></span></h1>
        <button type="button" id="submit1"   class="layui-btn layui-btn-radius layui-btn-norma">查看</button>
        <hr>
        <h1 class="page-header">个人成绩<span class="badge" ></span></h1>
        <button type="button" id="submit2"   class="layui-btn layui-btn-radius layui-btn-norma">查看</button>
        <hr>
        <h1 class="page-header">团体成绩<span class="badge" ></span></h1>
        <button type="button" id="submit3"   class="layui-btn layui-btn-radius layui-btn-norma">查看</button>

    </div>
</div>



<div class="site-text" style="margin: 5%; display: none" id="teamgrade"  >
    <form class="layui-form" id="teamgradeform"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->

        <div class="layui-form-item">
            <label class="layui-form-label">年龄组</label>
            <div class="layui-input-block">
                <select name="age_id" id="select4" lay-verify="required">


                </select>
            </div>
        </div>

        <%--        /确认p_id和age_id--%>
        <%--        <input type="hidden" name="p_id" id="p_id">--%>
        <%--        <input type="hidden" name="age_id" id="age_id">--%>


    </form>
</div>
    <%--增加表单信息--%>
    <div class="site-text" style="margin: 5%; display: none" id="athgrade"  >
        <form class="layui-form" id="athgradeform"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->

            <div class="layui-form-item">
                <label class="layui-form-label">年龄组</label>
                <div class="layui-input-block">
                    <select name="age_id" id="select3" lay-verify="required">


                    </select>
                </div>
            </div>

            <%--        /确认p_id和age_id--%>
            <%--        <input type="hidden" name="p_id" id="p_id">--%>
            <%--        <input type="hidden" name="age_id" id="age_id">--%>


        </form>
    </div>
        <%--增加表单信息--%>
        <div class="site-text" style="margin: 5%; display: none" id="final"  >
            <form class="layui-form" id="finalform"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->

                <div class="layui-form-item">
                    <label class="layui-form-label">年龄组</label>
                    <div class="layui-input-block">
                        <select name="age_id" id="select1" lay-verify="required">


                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">比赛项目名</label>
                    <div class="layui-input-block">
                        <select name="p_id" id="select2" lay-verify="required">
                        </select>
                    </div>
                </div>
                <%--        /确认p_id和age_id--%>
                <%--        <input type="hidden" name="p_id" id="p_id">--%>
                <%--        <input type="hidden" name="age_id" id="age_id">--%>


            </form>
        </div>


    <div class="site-text" style="margin: 5%; display: none" id="final1"  >

        <h1 class="page-header">决赛成绩<span class="badge" ></span></h1>
        <hr>

        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr>

                    <th><span class="glyphicon glyphicon-file"></span> 姓名</th>
                    <th><span class="glyphicon glyphicon-list"></span> 项目名称</th>
                    <th><span class="glyphicon glyphicon-list"></span> 年龄组</th>
                    <th><span class="glyphicon glyphicon-list"></span> 决赛成绩</th>
                </tr>
                </thead>
                <tbody id="articleBody">

                </tbody>
            </table>

    </div>
    </div>
        <div class="site-text" style="margin: 5%; display: none" id="athgrade1"  >

            <h1 class="page-header">个人总成绩<span class="badge" ></span></h1>
            <hr>

            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>

                        <th><span class="glyphicon glyphicon-file"></span> 姓名</th>
                        <th><span class="glyphicon glyphicon-list"></span> 个人总得分</th>

                    </tr>
                    </thead>
                    <tbody id="articleBody1">

                    </tbody>
                </table>

            </div>
        </div>
<div class="site-text" style="margin: 5%; display: none" id="teamgrade1"  >

    <h1 class="page-header">团体总成绩<span class="badge" ></span></h1>
    <hr>

    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead>
            <tr>

                <th><span class="glyphicon glyphicon-file"></span> 团体序号</th>
                <th><span class="glyphicon glyphicon-list"></span> 团体总得分</th>

            </tr>
            </thead>
            <tbody id="articleBody2">

            </tbody>
        </table>

    </div>
</div>

<script src="/blog/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

<script src="/statics/layui/layui.js" type="text/javascript"></script>
<%--导入分页插件--%>
<link type="text/css" href="/blog/js/bs_pagination/jquery.bs_pagination.min.css" />
<script src="/blog/js/bs_pagination/en.js"></script>
<script src="/blog/js/bs_pagination/jquery.bs_pagination.min.js"></script>
<script>
layui.use(['element','form' ,'layer', 'util','table'], function() {
    var element = layui.element
        , layer = layui.layer
        , util = layui.util
        , table = layui.table
        , $ = layui.jquery
        , form = layui.form;




    //头部事件
    util.event('lay-header-event', {
        //左侧菜单事件
        menuLeft: function(othis){
            layer.msg('展开左侧菜单的操作', {icon: 0});
        }

    });



    //异步查询所有栏目，把返回的json串拼接到下拉框中
    $.get("/match/age",function (data) {
        //List<Category>

        for(var i = 0; i < data.length; i++){
            $('#select1').append("<option value="+data[i].age_id+">"+data[i].age_sex+"子组"+data[i].age_name+"年龄段"+"</option>");
            $('#select3').append("<option value="+data[i].age_id+">"+data[i].age_sex+"子组"+data[i].age_name+"年龄段"+"</option>");
            $('#select4').append("<option value="+data[i].age_id+">"+data[i].age_sex+"子组"+data[i].age_name+"年龄段"+"</option>");

        }
    },'json');

    //异步查询所有栏目，把返回的json串拼接到下拉框中
    $.get("/match/project",function (data) {
        //List<Category>

        for(var i = 0; i < data.length; i++){
            $('#select2').append("<option value="+data[i].p_id+">"+data[i].p_name+"</option>");

        }
    },'json');

    $('#submit1').on('click', function(){
        //页面层

       var index= layer.open({
            type: 1 //Page层类型
            ,skin: 'layui-layer-molv'
            ,area: ['400px', '500px']
            ,title: ['添加决赛','font-size:18px']
            ,btn: ['确定', '取消']
            ,shadeClose: true
            ,shade: 0 //遮罩透明度
            ,maxmin: true //允许全屏最小化
            ,content:$("#final")
            ,success: function(){
                form.render('select');


            }
            ,yes:function updatateam(){

                var forms =$('#finalform').serialize();



                $.post("/team/rankfinal",forms,function (data){
                    if(!data){
                        layer.alert(data.mess, {icon: 6});}
                    else{

                        //页面层
                        layer.close(index);
                        layer.open({
                            type: 1 //Page层类型
                            ,skin: 'layui-layer-molv'
                            ,area: ['1000px', '600px']

                            ,btn: ['确定', '取消']
                            ,shadeClose: true
                            ,shade: 0 //遮罩透明度
                            ,maxmin: true //允许全屏最小化
                            ,content:$("#final1")
                            ,success: function(){
                                form.render('select');

                                //发送查询所有文章列表的异步请求，参数就可以传到后台
                                $.post("/team/rankfinal",

                                   forms

                                ,function (data) {

                                    $('#articleBody').html("");
                                    //List<Article>
                                    var finalscores = data;
                                    for(var i =0 ; i < finalscores.length; i++){
                                        var finalscore = finalscores[i];
                                        console.log(finalscore)
                                        $('#articleBody').append("<tr>\n" +
                                            " <td class=\"article-title\">" + finalscore.a_id+ "</td>\n" +
                                            "                <td class=\"article-title\">" + finalscore.p_id+ "</td>\n" +
                                            "                <td class=\"article-title\">" + finalscore.age_id+ "</td>\n" +
                                            "                <td class=\"article-title\">" + finalscore.finaldegree+ "</td>\n" +
                                            "              </tr>");
                                    }

                                },'json');



                            }


                        });




                    }

                },'json')
            }

        });
    });

    $('#submit2').on('click', function(){
        //页面层

        var index= layer.open({
            type: 1 //Page层类型
            ,skin: 'layui-layer-molv'
            ,area: ['400px', '500px']

            ,btn: ['确定', '取消']
            ,shadeClose: true
            ,shade: 0 //遮罩透明度
            ,maxmin: true //允许全屏最小化
            ,content:$("#athgrade")
            ,success: function(){
                form.render('select');


            }
            ,yes:function updatateam(){

                var forms =$('#athgradeform').serialize();



                $.post("/team/athgrade",forms,function (data){
                    if(!data){
                        layer.alert(data.mess, {icon: 6});}
                    else{

                        //页面层
                        layer.close(index);
                        layer.open({
                            type: 1 //Page层类型
                            ,skin: 'layui-layer-molv'
                            ,area: ['1000px', '600px']

                            ,btn: ['确定', '取消']
                            ,shadeClose: true
                            ,shade: 0 //遮罩透明度
                            ,maxmin: true //允许全屏最小化
                            ,content:$("#athgrade1")
                            ,success: function(){
                                form.render('select');

                                //发送查询所有文章列表的异步请求，参数就可以传到后台
                                $.post("/team/athgrade",

                                    forms

                                    ,function (data) {

                                        $('#articleBody1').html("");
                                        //List<Article>
                                        var athletes = data;
                                        for(var i =0 ; i < athletes.length; i++){
                                            var athlete = athletes[i];
                                            console.log(athlete)
                                            $('#articleBody1').append("<tr>\n" +
                                                " <td class=\"article-title\">" + athlete.a_name+ "</td>\n" +
                                                "                <td class=\"article-title\">" + athlete.allDegree+ "</td>\n" +

                                                "              </tr>");
                                        }

                                    },'json');



                            }


                        });




                    }

                },'json')
            }

        });
    });

    $('#submit3').on('click', function(){
        //页面层

        var index= layer.open({
            type: 1 //Page层类型
            ,skin: 'layui-layer-molv'
            ,area: ['400px', '500px']

            ,btn: ['确定', '取消']
            ,shadeClose: true
            ,shade: 0 //遮罩透明度
            ,maxmin: true //允许全屏最小化
            ,content:$("#teamgrade")
            ,success: function(){
                form.render('select');


            }
            ,yes:function updatateam(){

                var forms =$('#teamgradeform').serialize();



                $.post("/team/teamgrade",forms,function (data){
                    if(!data){
                        layer.alert(data.mess, {icon: 6});}
                    else{

                        //页面层
                        layer.close(index);
                        layer.open({
                            type: 1 //Page层类型
                            ,skin: 'layui-layer-molv'
                            ,area: ['1000px', '600px']

                            ,btn: ['确定', '取消']
                            ,shadeClose: true
                            ,shade: 0 //遮罩透明度
                            ,maxmin: true //允许全屏最小化
                            ,content:$("#teamgrade1")
                            ,success: function(){
                                form.render('select');

                                //发送查询所有文章列表的异步请求，参数就可以传到后台
                                $.post("/team/teamgrade",

                                    forms

                                    ,function (data) {

                                        $('#articleBody2').html("");
                                        //List<Article>
                                        var teams = data;
                                        for(var i =0 ; i < teams.length; i++){
                                            var team = teams[i];
                                            console.log(team)
                                            $('#articleBody2').append("<tr>\n" +
                                                " <td class=\"article-title\">" + team.t_id+ "</td>\n" +
                                                "                <td class=\"article-title\">" + team.teamdegree+ "</td>\n" +

                                                "              </tr>");
                                        }

                                    },'json');



                            }


                        });




                    }

                },'json')
            }

        });
    });
    //
    // var forms =$('#updatateamform').serialize();
    //
    // //发送查询所有文章列表的异步请求，参数就可以传到后台
    // $.post("/team/athgrade",
    //
    //    forms
    //
    // ,function (data) {
    //
    //     $('#articleBody').html("");
    //     //List<Article>
    //     var finalscores = data;
    //     for(var i =0 ; i < finalscores.length; i++){
    //         var finalscore = finalscores[i];
    //         console.log(finalscore)
    //         $('#articleBody').append("<tr>\n" +
    //             " <td class=\"article-title\">" + finalscore.a_id+ "</td>\n" +
    //             "                <td class=\"article-title\">" + finalscore.p_id+ "</td>\n" +
    //
    //             "              </tr>");
    //     }
    //
    // },'json');







})
</script>
</body>
</html>
