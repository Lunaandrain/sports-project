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






<script src="/blog/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

<script src="/statics/layui/layui.js" type="text/javascript"></script>
<%--导入分页插件--%>
<link type="text/css" href="/blog/js/bs_pagination/jquery.bs_pagination.min.css" />
<script src="/blog/js/bs_pagination/en.js"></script>
<script src="/blog/js/bs_pagination/jquery.bs_pagination.min.js"></script>
<script>
    //JS
    layui.use(['element','form' ,'layer', 'util','table'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,table=layui.table
            ,$ = layui.jquery
            ,form=layui.form;


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
            $.post("/referee/showmatch",{
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
                        "   <a class=\"aaa\"   onclick=\"showById('"+match.g_id+"','"+match.p_id+"','"+match.match_type+"')\" href='javascript:void(0)'>查看运动员信息</a>&nbsp;\n" +
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


    //异步删除运动员信息
    function showById(g_id,p_id,match_type) {



        $.post("/referee/savematch", {
                'p_id':p_id,
                'match_type':match_type,
                'g_id': g_id
            }, function (data) {


            },'json'
        )

        // var g_id=$(obj).parents("tr").find("td").find(".group").text();
        layer.open({
            type:2,

            content:"./showathlete.jsp",
            area:["1000px","600px"],
            success:function (){


            }

        });
    }



</script>
</body>
</html>