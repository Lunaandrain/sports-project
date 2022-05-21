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
<div class="layui-body">
    <!-- 内容主体区域 -->
    <div class=" col-md-10   main" id="main">
        <form action="/Article/checkAll" method="post" >

            <h1 class="page-header">领队信息管理 <span class="badge" id="count"></span></h1>

            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>
                            <input type="checkbox" class="input-control" name="checkbox" id="father" />
                        </th>
                        <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">姓名</span></th>
                        <th><span class="glyphicon glyphicon-list"></span> <span class="visible-lg">电话号码</span></th>
                        <th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span> <span class="visible-lg">身份证号</span></th>

                        <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
                    </tr>
                    </thead>
                    <tbody id="articleBody">
                    <%--                <tr>--%>
                    <%--                  <td><input type="checkbox" class="input-control" name="checkbox" value="" /></td>--%>
                    <%--                  <td class="article-title">这是测试的文章标</td>--%>
                    <%--                  <td>这个是栏目</td>--%>
                    <%--                  <td class="hidden-sm">PHP、JavaScript</td>--%>
                    <%--                  <td class="hidden-sm">0</td>--%>
                    <%--                  <td>2015-12-03</td>--%>
                    <%--                  <td>--%>
                    <%--                      <a href="update-article.html">修改</a> <a rel="6">删除</a>&nbsp;--%>
                    <%--                      <input type="radio" name="isOpen" value="0" checked/>公开 <input type="radio" name="isOpen" value="1" />私密--%>
                    <%--                  </td>--%>
                    <%--                </tr>--%>

                    </tbody>
                </table>
            </div>
            <button type="button" id="submit" class="layui-btn layui-btn-radius layui-btn-norma">添加领队</button>
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
    <form class="layui-form" id="updataleaderform"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->


    <div class="layui-form-item">
        <label class="layui-form-label"  style="width: 100px;">姓名</label>
        <div class="layui-input-block" >
            <input type="text" name="l_name" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"  style="width: 100px;"> 电话号码</label>
        <div class="layui-input-block">
            <input type="text" name="l_phone" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"  style="width: 100px;">身份证号</label>
        <div class="layui-input-block">
            <input type="text" name="l_identity" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
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
        refresh(1,3);

        //定义一个函数，发送请求不同页码对应的数据
        function refresh(page,pageSize){
            //发送查询所有文章列表的异步请求，参数就可以传到后台
            $.post("/team/showleader",{
                'page' : page,
                'pageSize' : pageSize,

            },function (data) {

                $('#articleBody').html("");
                //List<Article>
                var leaders = data.list;
                for(var i =0 ; i < leaders.length; i++){
                    var leader = leaders[i];

                    $('#articleBody').append("<tr>\n" +
                        "                <td><input type=\"checkbox\" class=\"input-control\" name=\"checkbox\" value=\"\" /></td>\n" +
                        "                <td class=\"article-title\">" + leader.l_name+ "</td>\n" +
                        "                <td>" + leader.l_phone + "</td>\n" +
                        "                <td class=\"hidden-sm\">" + leader.l_identity + "</td>\n" +


                        "                <td>\n" +
                        "   <a onclick=\"deleteById('"+leader.l_id+"')\" href='javascript:void(0)'>删除</a>&nbsp;\n" +
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

        $('#submit').on('click', function(){
            //页面层
        var index=    layer.open({
                type: 1 //Page层类型
                ,skin: 'layui-layer-molv'
                ,area: ['400px', '300px']
                ,title: ['添加领队','font-size:18px']
                ,btn: ['确定', '取消']
                ,shadeClose: true
                ,shade: 0 //遮罩透明度
                ,maxmin: true //允许全屏最小化
                ,content:$("#window")
                ,yes:function updatateam(){

                     var forms =$('#updataleaderform').serialize();
                     console.log(forms)


                    $.post("/team/addleader",forms,function (data){
                        if(!data){
                            layer.alert(data.mess, {icon: 6});}
                        else{
                            setTimeout(function () {
                                //重新登录,跳转到登录页面
                                //setTimeout:隔多长时间执行指定代码
                                layer.msg(data.mess, {icon: 1,time:1000},function(){  //延时跳转并提示


                                    layer.close(index);  //关闭窗口



                                });

                            },1000);
                        }

                    },'json')
                }

            });
        });






    });



    //异步删除领队信息
    function deleteById(l_id) {
        $.get("/team/deleteleader",{'l_id':l_id},function (data) {
            if(data.ok){
                //删除成功
                layer.alert(data.mess, {icon:6});
                //刷新页面
                refresh(1,3);
            }
        },'json');
    }


</script>
</body>
</html>