<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<%--增加运动员信息--%>






<!-- 内容主体区域 -->
<div style="margin:20px">
    <form action="" method="post" >

        <h1 class="page-header">查看运动员信息<span class="badge" id="count"></span></h1>

        <hr>
        <div class="table-responsive">

            <table class="table table-striped table-hover">
                <thead>
                <tr>

                    <th>
                        <input type="checkbox" class="input-control" name="checkbox" id="father" />
                    </th>
                    <th><span class="glyphicon glyphicon-file"></span> 姓名</th>
                    <th><span class="glyphicon glyphicon-list"></span> 性别</th>
                    <th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span>项目组号</th>

                    <th><span class="glyphicon glyphicon-pencil"></span> 操作</th>

                </tr>
                </thead>
                <tbody id="articleBody">


                </tbody>
            </table>
        </div>

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





<script src="/blog/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

<script src="/statics/layui/layui.js" type="text/javascript"></script>
<%--导入分页插件--%>
<link type="text/css" href="/blog/js/bs_pagination/jquery.bs_pagination.min.css" />
<script src="/blog/js/bs_pagination/en.js"></script>
<script src="/blog/js/bs_pagination/jquery.bs_pagination.min.js"></script>
<script>



var A_id
var T_id
var Age_id

    //JS
    layui.use(['element','form' ,'layer', 'util','table'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,table=layui.table
            ,$ = layui.jquery
            ,form=layui.form;





        window.showscore = function showscore(a_id,t_id,age_id) {
            A_id=a_id
            T_id=t_id
            Age_id=age_id
            $.post("/referee/saveath", {
                    'a_id':a_id,
                    't_id':t_id,
                'age_id':age_id,
                }, function (data) {


                },'json'
            )

            $.post("/referee/showscore",{
                    'a_id':a_id,
                    'g_id':${sessionScope.match.g_id},

                },function (data) {

                    //List<Article>
                    var scores = data;
                    scoreall=data;
                    console.log(scoreall)
                    $("#1").val(scores[0].degree)
                    $("#2").val(scores[1].degree)
                    $("#3").val(scores[2].degree)
                    $("#4").val(scores[3].degree)
                    $("#5").val(scores[4].degree)


                },'json'
            )

            var index =  layer.open({
                type: 1 //Page层类型
                ,skin: 'layui-layer-molv'
                ,area: ['400px', '530px']
                ,title: ['查看分数','font-size:18px']
                ,btn: ['确定']
                ,shadeClose: true
                ,shade: 0 //遮罩透明度
                ,maxmin: true //允许全屏最小化
                ,content:$("#window"),
                yes:function (){
                    $("#1").val("")
                    $("#2").val('')
                    $("#3").val('')
                    $("#4").val('')
                    $("#5").val('')
                    layer.close(index);

                }

            });





        }

        window.final = function final() {
            var num1=  $("#1").val()
            var num2=  $("#2").val()
            var num3=  $("#3").val()
            var num4=  $("#4").val()
            var num5=  $("#5").val()
            var num=(parseInt(num1)+parseInt(num2)+parseInt(num3)+parseInt(num4)+parseInt(num5))/5
            console.log(num)
            console.log(${sessionScope.age_id})
            $.post("/referee/gradecheck",{
                    'a_id':A_id,
                    'g_id':${sessionScope.match.g_id},
                    'age_id':Age_id,
                    'finaldegree':num,
                    't_id':T_id,
                    'match_type':"${sessionScope.match.match_type}",
                    'p_id':${sessionScope.match.p_id}

                },function (data) {

                    layer.alert(data.mess+" 总成绩为"+num.toString())
                    $("#6").val(num)

                },'json'
            )

        }


        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }

        });


        //调用刷新方法
        refresh(1,3);

        //定义一个函数，发送请求不同页码对应的数据
        function refresh(page,pageSize){
            //发送查询所有文章列表的异步请求，参数就可以传到后台
            $.post("/referee/matchathlete2",{
                'page' : page,
                'pageSize' : pageSize,
                'g_id' :${sessionScope.match.g_id},
            },function (data) {
                $('#articleBody').html("");
                //List<Article>
                var athletes = data.list;
                for(var i =0 ; i < athletes.length; i++){
                    var athlete = athletes[i];

                    $('#articleBody').append("<tr>\n" +
                        "                <td><input type=\"checkbox\" class=\"input-control\" name=\"checkbox\" value=\"\" /></td>\n" +
                        "                <td class=\"article-title\">" + athlete.a_name+ "</td>\n" +
                        "                <td class=\"article-title\">" + athlete.age_sex+ "</td>\n" +
                        "                <td>" + athlete.g_id+ "</td>\n" +
                        "                <td>\n" +
                        "   <a class=\"aaa\"  onclick=\"dafen('"+athlete.a_id+"','"+athlete.t_id+"','"+athlete.age_id+"')\"  href='javascript:void(0)'>打分</a>&nbsp;\n" +
                        "   <a class=\"\"  onclick=\"showscore('"+athlete.a_id+"','"+athlete.t_id+"','"+athlete.age_id+"')\"  href='javascript:void(0)'>查看得分</a>&nbsp;\n" +
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








    function dafen(a_id,t_id,age_id) {

        $.post("/referee/saveath", {
                'a_id':a_id,
                't_id':t_id,
                'age_id':age_id,
            }, function (data) {


            },'json'
        )

        layer.open({
            type:2,

            content:"./dafen.jsp",
            area:["400px","150px"],
            success:function (){

            }

        });
    }


</script>
</body>
</html>