<%--
  Created by IntelliJ IDEA.
  User: 卞雅薇
  Date: 2021/12/7
  Time: 3:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/statics/layui/css/layui.css">
</head>
<body>

<div class="layui-container" style="margin-top: 20px">
    <div class="layui-row">
        <form class="layui-form" id="updataadminform">
            <input type="hidden" name="id" value="${sessionScope.admin.id}">
           <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" name="username" value="${sessionScope.admin.username}" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">旧密码</label>
                <div class="layui-input-block">
                    <input type="password" name="old_password" id="oldPwd" placeholder="请输入旧密码" autocomplete="off" class="layui-input">

                    </tr>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-block">
                    <input type="password" name="new_password" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">确认密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password" placeholder="请确认密码" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" onclick="updataadmin()"  class="layui-btn" lay-submit lay-filter="*">修改</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>
</div>
<script src="/statics/layui/layui.js" type="text/javascript"></script>


        <script>
            layui.use('form', function(){
                var form = layui.form;
                var $ = layui.jquery;
              $("#oldPwd").blur(function (){

                  $.post("/admin/verifyoldpwd",{'oldpwd':$(this).val()},function (data){
                     if(!data.ok){
                         layer.msg(data.mess,{offset:'t'})
                     }


                  },'json')




              }),

                   //定义layui中的方法
                  window.updataadmin= function updataadmin(){
                    console.log("haha")
                    var forms =$('#updataadminform').serialize();
                      console.log(forms)

                    $.post("/admin/updataadmin",forms,function (data){
                      if(!data){
                          layer.alert(data.mess, {icon: 6});}
                         else{
                          setTimeout(function () {
                              //重新登录,跳转到登录页面
                              //setTimeout:隔多长时间执行指定代码
                              layer.msg('操作成功', {icon: 1,time:1000},function(){  //延时跳转并提示


                                  layer.close(layer.index);  //关闭窗口

                                  window.parent.location.href = "/admin/loginOut";; //刷新父级窗口

                              });

                          },1000);
                            }


                    },'json')
                }
            })

        </script>






















</body>
</html>
