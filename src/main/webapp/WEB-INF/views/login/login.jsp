<%--
  Created by IntelliJ IDEA.
  User: zwz
  Date: 2020/2/10 0010
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

//    request.getSchema()可以返回当前页面使用的协议:  http
//    request.getServerName()可以返回当前页面所在的服务器的名字:  localhost
//    request.getServerPort()可以返回当前页面所在的服务器使用的端口: 8080;
//    request.getContextPath()可以返回当前页面所在的应用的名字.如 http://localhost:8080/zwz/hello.jsp返回 /zwz

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;

    //    获取现在的系统时间
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String nowDate = sdf.format(date);

//    ---------------------------------------------------------------------------------------------------------
//    完成时间 2020.2.9 郑为中
//    所有注释统一在代码的上方
//    ---------------------------------------------------------------------------------------------------------

%>

<%--

            登入界面  打开项目的最开始的页面

--%>

<html>
    <head>
        <%--    如果网页里出现了中文,没有这一句,将会导致中文乱码--%>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <%--    网页标题--%>
        <title>周总结云盘登入</title>

        <%--    导入外部CSS样式、JS文件--%>
        <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=basePath%>/static/css/layui.css"/>
        <link rel="stylesheet" href="<%=basePath%>/static/css/login.css"/>
        <script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>


        <%--    内部CSS样式--%>
        <style type="text/css">
            /*头部div*/
            .header{
                background-image: url("<%=basePath%>/static/img/login_back.jpeg");
            }
        </style>

    </head>

    <body>

        <%-- header为页面上面部分,用于显示背景图片美化 --- 开始--%>
        <div class="header"></div>
        <%-- header --- 结尾--%>


        <%--container部分 用于显示登入注册表单 占整个界面的大多数--%>
        <div class="container">

            <div id="content">

                <%--下方主界面标题--%>
                <h2 class="text-nowrap" style="color: #F8F8F8;text-align:center;padding-top:10%;font-family: Menlo">ACM&nbsp;周总结云管理系统 V1.1</h2><br><br>

                <%--该div存放两个登入、注册按钮--%>
                <div style="text-align: center;">

                    <%-- 登入按钮 点击后注册表单隐藏--%>
                    <label style="font-size:20px;color:white;padding-right:8%;">
                        <a href="#" id="login" style="text-decoration: none;border-bottom:2px solid #009688;color:#009688">登录</a>
                    </label>

                    <%--  注册按钮 点击后登入表单隐藏--%>
                    <label style="font-size:20px;color:white;padding-left:8%;">
                        <a href="#" id="register" style="text-decoration:none;">注册</a>
                    </label>
                </div>
                <hr style="color: #484848;text-align:center;"/>

                 <%-- 登入的表单 开始--%>
                <form action="<%=basePath%>/users/login.do" id="loginform" method="post" class="layui-form" style="text-align: center;margin-right:12%;margin-top:10%;">

                    <%-- 0 数据库的账号id属性 无需输入--%>
                    <input name="a_id" hidden="hidden" value="${a_id}"/>

                    <div>
                        <%--  1 用户名 输入框--%>
                        <div class="layui-form-item layui-inline">
                            <label class="layui-form-label" >
                                <span class="fa fa-user fa-fw"></span>
                            </label>
                            <div class="layui-input-inline">
                                <input type="text" name="a_name" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;" placeholder="Username"/>
                            </div>
                        </div>
                        <br/>

                        <%--  2 密码 输入框--%>
                        <div class="layui-form-item layui-inline">
                            <label class="layui-form-label" >
                                <span class="fa fa-lock fa-fw"></span>
                            </label>
                            <div class="layui-input-inline">
                                <input type="password" name="a_password" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;" placeholder="Password"/>
                            </div>
                        </div>
                        <br/>
                        <br/>

                        <%--  3 登入 按钮--%>
                        <div style="text-align:center;color: #009688;background-color: #01AAED;width:48%;margin-left:138px;">
                            <input type="submit" class="layui-btn layui-btn-lg" style="background: none;" value="Sing in"/>
                        </div>

                    </div>

                </form>
                <%--  登入的表单 结尾--%>


                <%-- 注册的表单 开始--%>
                <form action="<%=basePath%>/users/register.do" id="registerform" method="post" class="layui-form" hidden="hidden" style="text-align: center;margin-right:12%;margin-top:10%;">

                    <div>

                        <%-- 1 用户名--%>
                        <div class="layui-form-item layui-inline">
                            <label class="layui-form-label" style="font-size:16px;">
                                <span class="fa fa-user fa-fw"></span>
                            </label>
                            <div class="layui-input-inline">
                                <input type="text" name="a_name" id="a_name" onblur="return checkName();" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;" placeholder="Username"/>
                            </div>
                            <%--  info用于显示 用户名是否被注册 的信息--%>
                            <span id="info"></span>
                        </div>
                        <br/>


                       <%-- 2 密码--%>
                        <div class="layui-form-item layui-inline">
                            <label class="layui-form-label" style="font-size:16px;">
                                <span class="fa fa-lock fa-fw"></span>
                            </label>
                            <div class="layui-input-inline">
                                <input type="password" name="a_password" id="a_password" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;" placeholder="Password"/>
                            </div>
                        </div>
                        <br/>


                        <%-- 3 验证码--%>
                        <div class="layui-form-item layui-inline" style="margin-left: 15%;">
                            <label class="layui-form-label">
                                <span class="fa fa-envelope fa-fw"></span>
                            </label>
                            <div class="layui-input-inline" style="width: 32%;">
                                <input type="text" id="check" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;"/>
                            </div>
                            <div class="layui-input-inline">
                                <input id="code" onclick="createCode()" type="button" style="background:none;border: none;margin-left:198px;margin-top:-14%;"/>
                            </div>
                        </div>
                        <br/>
                        <br/>


                        <%-- 4 提交按钮--%>
                        <div style="text-align:center;color: #009688;background-color: #01AAED;width:48%;margin-left:34%;">
                            <input type="button" class="layui-btn layui-btn-lg" style="background: none;" value="Sing up" onclick="validate()"/>
                        </div>

                    </div>

                </form>
               <%-- 注册的表单 结尾--%>

           </div>
        </div>




    </body>

    <script type="text/javascript">


        // 当点击注册按钮的时候 登入按钮高亮 登入表单隐藏 注册表单显示
        $("#register").click(function(){
            $("#login").css({'border':'none','color':'#393D49'});
            $(this).css({'border-bottom':'2px solid #009688','color':'#009688'});
            $("#loginform").hide();
            $("#registerform").show();
        });


        // 当点击登入按钮的时候 注册按钮高亮 注册表单隐藏 登入表单显示
        $("#login").click(function(){
            $("#register").css({'border':'none','color':'#393D49'});
            $(this).css({'border-bottom':'2px solid #009688','color':'#009688'});
            $("#registerform").hide();
            $("#loginform").show();
        });


        // 该方法用于注册时,检测输入的名字是否已经被注册
        // 可以注册返回ture
        // 已存在无法注册返回false
        function checkName(){
            var a_name = $("#a_name").val(); //先获取 输入的用户名
            if(a_name != ''){
                $.ajax({
                    url: '<%=basePath%>/users/findByName.do',
                    type: 'post',
                    dataType: 'json',
                    contentType: 'application/json;charset=utf-8',
                    data: JSON.stringify({"a_name": a_name}),
                    success: function(data){
                        if(data == null){
                            $("#info").text("可以注册").css({'color':'green','font-size':'1px'});
                            return true;
                        }
                        if(data != null){
                            $("#info").text("该用户名已注册").css({'color':'red','font-size':'1px'});
                            return false;
                        }
                    },
                    error: function(){
                        alert("错误");
                        return false;
                    }
                });
            }else{
                $("#info").text("");
            }
        }


        <%--createCode() 方法用于处理四位验证码的生成、验证--%>
        //设置一个全局的变量code，便于保存验证码
        var code = '';
        function createCode(){
            //首先默认code为空字符串
            code = '';

            //设置验证码长度，这里看需求，我这里设置了4位
            var codeLength = 4;

            //获取 注册表单中 验证码对象
            var codeV = document.getElementById('code');

            //设置随机字符范围
            var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 'S','T','U','V','W','X','Y','Z');

            //生成N位随机验证码
            for(var i = 0; i < codeLength; i++){
                //设置随机数范围,这设置为0 ~ 36
                var index = Math.floor(Math.random()*36);
                //字符串拼接 将每次随机的字符 进行拼接
                code += random[index];
            }
            //将拼接好的字符串赋值给表单
            codeV.value = code;
        }


        //validate() 方法用于判断用户输入的验证码是否正确
        // 输入正确 返回 true
        // 输入错误 返回 false
        function validate(){
            var oValue = document.getElementById('check').value.toUpperCase();

            //如果验证码为空
            if(oValue == 0){
                layer.open({
                    title: '警告信息',
                    content: '请输入验证码'
                });
            }else if(oValue != code){
                //如果验证码不正确
                $("#check").val("");
                layer.open({
                    title: '警告信息',
                    content: '您输入的验证码不正确，请重新输入'
                });
                createCode();
            }else if(checkName()){
                //如果输入用户名不符合
                layer.open({
                    title: '警告信息',
                    content: '您输入的用户名有误，请重新输入'
                });
            }else{
                //没问题就提交注册信息
                $("#registerform").submit();
            }
        }

        //用于页面加载的时候,生成一个初始验证码
        window.onload = function (){
            createCode();
        }

    </script>

</html>
