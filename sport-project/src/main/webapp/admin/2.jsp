<%--
  Created by IntelliJ IDEA.
  User: 卞雅薇
  Date: 2021/12/7
  Time: 6:11
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
        <form action="/Article/checkAll" method="post" >

            <h1 class="page-header">赛程管理 <span class="badge" id="count"></span></h1>

            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>
                            <input type="checkbox" class="input-control" name="checkbox" id="father" />
                        </th>
                        <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">项目名</span></th>
                        <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">项目组号</span></th>
                        <th><span class="glyphicon glyphicon-list"></span> <span class="visible-lg">年龄组</span></th>
                        <th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span> <span class="visible-lg">比赛类型</span></th>

                        <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
                    </tr>
                    </thead>
                    <tbody id="articleBody">



                    </tbody>
                </table>
            </div>
            <button type="button" id="submit"   class="layui-btn layui-btn-radius layui-btn-norma">添加初赛</button>
            <button type="button" id="submit1"   class="layui-btn layui-btn-radius layui-btn-norma">添加决赛</button>
            <footer class="message_footer">
                <nav>
                    <%--分页插件--%>
                    <div  style="height: 50px; position: relative;top: 30px;">
                        <div id="activityPage"></div>
                    </div>
                </nav>
            </footer>
        </form>



    </div>

</div>

<%--增加表单信息--%>
<div class="site-text" style="margin: 5%; display: none" id="window"  target="test123">
    <form class="layui-form" id="updataathleteform"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->





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



<script src="/blog/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

<script src="/statics/layui/layui.js" type="text/javascript"></script>
<%--导入分页插件--%>
<link type="text/css" href="/blog/js/bs_pagination/jquery.bs_pagination.min.css" />
<script src="/blog/js/bs_pagination/en.js"></script>
<script src="/blog/js/bs_pagination/jquery.bs_pagination.min.js"></script>

<script>
    //JS
    function showById(g_id,age_id){
        $.post("/match/savegidageid", {
                'g_id': g_id,
            'age_id':age_id
            }, function (data) {


            },'json'
        )

        // var g_id=$(obj).parents("tr").find("td").find(".group").text();
        layer.open({
            type:2,
            content:"./showathlete.jsp",
            area:["1100px","650px"],
            success:function (){
            }
        });
    }


    //异步删除赛事信息
    function deleteById(g_id) {
        $.get("/match/deletematch",{'g_id':g_id},function (data) {
            if(data.ok){
                //删除成功
                layer.alert(data.mess, {icon:6});
                //刷新页面
                refresh(1,3);
            }
        },'json');
    }

    layui.use(['element','form' ,'layer', 'util','table'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,table=layui.table
            ,$ = layui.jquery
            ,form=layui.form;

        //异步查询所有栏目，把返回的json串拼接到下拉框中
        $.get("/match/age",function (data) {
            //List<Category>

            for(var i = 0; i < data.length; i++){
                $('#select1').append("<option value="+data[i].age_id+">"+data[i].age_sex+"子组"+data[i].age_name+"年龄段"+"</option>");
                 // $('#age_id').attr('value',data[i].age_id)

            }
        },'json');

        //异步查询所有栏目，把返回的json串拼接到下拉框中
        $.get("/match/project",function (data) {
            //List<Category>

            for(var i = 0; i < data.length; i++){
                $('#select2').append("<option value="+data[i].p_id+">"+data[i].p_name+"</option>");
                // $('#p_id').attr('value',data[i].p_id)
            }
        },'json');


        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }

        });

        $('#submit1').on('click', function(){
            //页面层
         var index=   layer.open({
                type: 1 //Page层类型
                ,skin: 'layui-layer-molv'
                ,area: ['400px', '500px']
                ,title: ['添加决赛','font-size:18px']
                ,btn: ['确定', '取消']
                ,shadeClose: true
                ,shade: 0 //遮罩透明度
                ,maxmin: true //允许全屏最小化
                ,content:$("#window")
                ,success: function(){
                    form.render('select');

                }
                ,yes:function updatateam(){

                    var forms =$('#updataathleteform').serialize();
                    console.log(forms)


                    $.post("/match/addfinal",forms,function (data){
                        if(!data){
                            layer.alert(data.mess, {icon: 6});}
                        else{

                            setTimeout(function () {
                                //重新登录,跳转到登录页面
                                //setTimeout:隔多长时间执行指定代码
                                layer.msg(data.mess, {icon: 1,time:1000},function(){
                                    //延时跳转并提示
                                    layer.close(index);  //关闭窗口

                                });

                            },1000);
                        }

                    },'json')
                }

            });
        });
        $('#submit').on('click', function(){
            //页面层
          var index=  layer.open({
                type: 1 //Page层类型
                ,skin: 'layui-layer-molv'
                ,area: ['400px', '500px']
                ,title: ['添加初赛','font-size:18px']
                ,btn: ['确定', '取消']
                ,shadeClose: true
                ,shade: 0 //遮罩透明度
                ,maxmin: true //允许全屏最小化
                ,content:$("#window")
                ,success: function(){
                    form.render('select');

                }
                ,yes:function updatateam(){

                    var forms =$('#updataathleteform').serialize();
                    console.log(forms)


                    $.post("/match/addchusai",forms,function (data){
                        if(!data){
                            layer.alert(data.mess, {icon: 6});}
                        else{
                            setTimeout(function () {
                                //重新登录,跳转到登录页面
                                //setTimeout:隔多长时间执行指定代码
                                layer.msg(data.mess, {icon: 1,time:1000},function(){
                                    //延时跳转并提示
                                    layer.close(index);  //关闭窗口



                                });

                            },1000);
                        }

                    },'json')
                }

            });
        });


        //调用刷新方法
        refresh(1,3);

        //定义一个函数，发送请求不同页码对应的数据
        function refresh(page,pageSize){
            //发送查询所有文章列表的异步请求，参数就可以传到后台
            $.post("/match/list",{
                'page' : page,
                'pageSize' : pageSize,


            },function (data) {

                $('#articleBody').html("");
                //List<Article>
                var matchs = data.list;
                for(var i =0 ; i < matchs.length; i++){
                    var match = matchs[i];

                    $('#articleBody').append("<tr>\n" +
                        "                <td><input type=\"checkbox\" class=\"input-control\" name=\"checkbox\" value=\"\" /></td>\n" +
                        "                <td class=\"article-title\">" + match.p_name+ "</td>\n" +
                        "                <td class=\"group\">" + match.g_id+ "</td>\n" +
                        "                <td>" + match.age_name + "</td>\n" +

                        "                <td class=\"hidden-sm\">" + match.match_type + "</td>\n" +


                        "                <td>\n" +
                        "   <a class=\"aaa\"   onclick=\"deleteById('"+match.g_id+"')\" href='javascript:void(0)'>删除比赛</a>&nbsp;\n" +
                        "   <a class=\"aaa\"   onclick=\"showById('"+match.g_id+"','"+match.age_id+"')\" href='javascript:void(0)'>查看本项目运动员</a>&nbsp;\n" +
                        "                </td>\n" +
                        "              </tr>");
                }
                $("#activityPage").bs_pagination({
                    currentPage: data.pageNum, // 页码
                    rowsPerPage: data.pageSize, // 每页显示的记录条数
                    maxRowsPerPage: 20, // 每页最多显示的记录条数
                    totalPages: data.pages, // 总页数
                    totalRows:data.total, // 总记录条数
                    visiblePageLinks: 3, // 显示几个卡片
                    showGoToPage: true,
                    showRowsPerPage: true,
                    showRowsInfo: true,
                    showRowsDefaultInfo: true,
                    //回调函数，用户每次点击分页插件进行翻页的时候就会触发该函数
                    onChangePage : function(event, obj){
                        //currentPage:当前页码 rowsPerPage:每页记录数
                        refresh(obj.currentPage,obj.rowsPerPage);
                    }
                });
            },'json');
        }


    });




</script>








</body>






</html>
