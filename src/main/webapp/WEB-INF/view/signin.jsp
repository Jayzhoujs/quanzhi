<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	 
String path = request.getContextPath();
		String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+path +"/";
	
		/* String basePath = " https://app-happyhome.eksaas.com/";  */
		/* String basePath = " https://app-happyhome-test.eksaas.com/";  */
	
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html class="login-bg">
<head>
<base href="<%=basePath%>"></base>
<c:set scope="request" var="status" value="${status }"></c:set>
<%
	String errorInfo = (String)request.getAttribute("status");         // 获取错误属性
	if(errorInfo != null) {
%>
	<script type="text/javascript" language="javascript">
		alert("<%=errorInfo%>");                                            // 弹出错误信息		                   
	</script>	
<%
	}
%>
	<title>蓉e犬系统管理后台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	
    <!-- bootstrap -->
    <link href="css/dog_e/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="css/dog_e/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/dog_e/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/dog_e/layout.css" />
    <link rel="stylesheet" type="text/css" href="css/dog_e/elements.css" />
    <link rel="stylesheet" type="text/css" href="css/dog_e/icons.css" />

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="css/dog_e/lib/font-awesome.css" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/dog_e/compiled/signin.css" type="text/css" media="screen" />

    <!-- open sans font -->
    
<!--      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>-->
   
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
 
    <div class="row-fluid login-wrapper">
        <a href="index.html">
            <img class="logo" src="./img/dogLogo_20170920152709.png" />
        </a>

        <div class="span4 box">
            <div class="content-wrap">
                <h6>欢迎登录蓉e犬后台管理系统</h6>
                <form  action="/quanzhi/login/action"  method="post" style='margin-top:-40px;'>
                <input class="span12" name="account" type="text" placeholder="账号"  style='margin-left:0;'/>
                <input class="span12" name="pwd" type="password" placeholder="密码" />
                	<!-- <a href="#" class="forgot">忘记密码?</a> -->
               <!--  <div class="remember">
                    <input id="remember-me" type="checkbox" />
                    <label for="remember-me">记住密码</label>
                </div> -->
                	<input style="width:100%;height:40px;margin:20px auto;" class="btn-glow primary login" type="submit" value="登录"/>
                </form>
            </div>
        </div>
    </div>

	<!-- scripts -->
    <script src="js/dog_e/jquery-latest.js"></script>
    <script src="js/dog_e/bootstrap.min.js"></script>
    <script src="js/dog_e/theme.js"></script>
<!-- pre load bg imgs -->
    <script type="text/javascript">
       
    </script>
</body>
</html>