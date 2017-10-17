<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>蓉e犬后台管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!--   富文本-->
   <link rel="stylesheet" href="../css/dog_e/wangEditor.css">
   <!--    弹框-->
   <link rel="stylesheet" href="../css/sweetAlert/example.css">
   <link rel="stylesheet" href="../css/sweetAlert/sweet-alert.css">
</head>
<body>

<div><%@ include file="menu.jsp"%></div>
 

	<!-- main container -->
   <!--    防止页面跳转标签-->
    <iframe id='iframe_display' name='iframe_display' style='display:none'></iframe>
    <div class="content">
        <div class="container-fluid" style='height:710px;'>
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>统计图表</h3>
                </div>
                <div style='margin:50px 0 0 50px;'>
               <p> <a href="system/chart_account">系统账号情况</a></p>
               <p> <a href="system/chart_approval">申报相关</a></p>
               <p> <a href="system/chart_branch">各个网点处理申报情况</a></p>
               <p> <a href="system/chart_master_distribution">犬主分布情况</a></p>
                <p><a href="system/chart_dog_info">犬只数量增长情况</a></p>
                
                </div>
               
            </div>
        </div>
    </div>   
</body>
</html>