<%@page import="com.xtoucher.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>蓉e犬后台管理</title>
<link href="../css/sweetAlert/sweet-alert.css" type="text/css" rel="stylesheet" />

</head>
<style>
	.inline-input{
		margin:30px 0 0 220px;
	}
	#btn-glow{
		margin-left:500px;
	}
</style>
<body>
<div><%@ include file="menu.jsp"%></div>

	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>新增犬种毛色类型</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                           
                            <form class="new_user_form inline-input"  method="post" id='inline-input' > 
                                <div class="span12 field-box" style='margin-left:-80px;'>
                                    <label>犬 颜 色:</label>
                                    <input class="span9" type="text" name="color" id="color" style='width:72.358974%;' />
                                </div>
                                <div class="span11 field-box actions">
                                    <input type="button" class="btn-glow primary" id='submitForm' value="提交" style='margin-left:70%;'/>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript"> 
    $("#submitForm").click(function(){
    	var color = $("input[name='color']").val();
    	if(color == ''){
    		swal("Sorry!", "请正确填写后提交！", "error");
    	}else{
    		$("#color").val(color);
    		$.post("system/dogColorSave",{color:color},function(data){
    		
    			if (data.status=='ok') {
    				swal({
    					title : "添加成功！",
    					type : "success",
    					confirmButtonText : "确认",
    					confirmButtonColor : "#07C6FC"
    				}, function() {
    					window.location.href = 'system/dogColour';
    				});
    			} else {
    				swal("Sorry!", "出错了！", "error");
    			}
    		});
    	}
        
	});
    </script>

<script src='./js/sweetAeler/sweet-alert.js'></script>
<script src='./js/sweetAeler/sweet-alert.min.js'></script> 
</body>
</html>