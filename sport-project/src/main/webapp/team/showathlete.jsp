<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>代表队系统</title>

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
                            <th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span> 项目组号</th>



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
        refresh(1,2);

        //定义一个函数，发送请求不同页码对应的数据
        function refresh(page,pageSize){
            //发送查询所有文章列表的异步请求，参数就可以传到后台
            $.post("/team/matchathlete",{
                'page' : page,
                'pageSize' : pageSize,
                  'g_id' :${sessionScope.g_id}
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

        // $('#submit').on('click', function(){
        //     //页面层
        //     layer.open({
        //         type: 1 //Page层类型
        //         ,skin: 'layui-layer-molv'
        //         ,area: ['400px', '300px']
        //         ,title: ['添加领队','font-size:18px']
        //         ,btn: ['确定', '取消']
        //         ,shadeClose: true
        //         ,shade: 0 //遮罩透明度
        //         ,maxmin: true //允许全屏最小化
        //         ,content:$("#window")
        //         ,yes:function updatateam(){
        //
        //             var forms =$('#updataleaderform').serialize();
        //             console.log(forms)
        //
        //
        //             $.post("/team/addleader",forms,function (data){
        //                 if(!data){
        //                     layer.alert(data.mess, {icon: 6});}
        //                 else{
        //                     setTimeout(function () {
        //                         //重新登录,跳转到登录页面
        //                         //setTimeout:隔多长时间执行指定代码
        //                         layer.msg(data.mess, {icon: 1,time:1000},function(){  //延时跳转并提示
        //
        //
        //                             layer.close(layer.index);  //关闭窗口
        //                             window.parent.location.href = "index.jsp";//刷新父级窗口
        //
        //
        //                         });
        //
        //                     },1000);
        //                 }
        //
        //             },'json')
        //         }
        //
        //     });
        // });






    });





</script>
</body>
</html>