<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>蓉e犬后台管理系统</title>   
<!--    弹框插件-->
   <link rel="stylesheet" href="../css/sweetAlert/example.css">
   <link rel="stylesheet" href="../css/sweetAlert/sweet-alert.css">
</head>
<style>
    #reset-r{
    	margin-left:0;
    } 
    #btn-glow{
    	margin-left:750px;
    }  
</style>
<body>
<div><%@ include file="menu.jsp"%></div>
	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>创建一个区域</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container" >                                               
                            <form class="new_user_form inline-input" action="system/addArea" method="post" id="formSub" target="iframe_display"> 
                            	
                                <div class="span12 field-box" style='margin-left:56px;'>
                                    <label>填写区县名称:</label>
                                    <input name='area' class="span9" type="text" maxlength="10" required="required"/>  
                                </div>
                                <div class="span11 field-box actions">
                                    <input type="submit"  class="btn-glow primary" id="btn-glow" value="提交" style='margin-top:15px;margin-left:496px;'/>
                                </div>                               
                            </form>                                                  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src='js/sweetAeler/sweet-alert.js'></script>
    <script src='js/sweetAeler/sweet-alert.min.js'></script>   
    
     
</body>
</html>