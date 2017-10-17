<%@page import="com.xtoucher.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>Detail Admin - User list</title>
   <link href="../css/sweetAlert/sweet-alert.css" type="text/css" rel="stylesheet" />

</head>
<style>
	#btn-glow{
		margin-left:86%;
	}
	#inline-input{
		margin:30px 0 0 120px;
	}
</style>
<body>

<div><%@ include file="menu.jsp"%></div>
 

	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>新增犬种类型</h3>
                </div>
                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                            <form class="new_user_form inline-input"  method="post" id='inline-input'> 
                                <div class="span12 field-box" style='margin-left:50px;'>
                                    <label>犬 种:</label>
                                    <input class="span9" type="text" name="type" id="type" required/>
                                    <br>
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
		    	var type = $("input[name='type']").val();
		    	if(type == ''){
		    		swal("Sorry!", "请正确填写后提交！", "error");
		    	}else{
		    		$('#type').val(type)
					$.post("system/dogBreedSave",{type:type},function(data){					
								if (data.status=='ok') {
									swal({
										title : "成功！",
										type : "success",
										confirmButtonText : "确认",
										confirmButtonColor : "#07C6FC"
									}, function() {
										window.location.href = 'system/dogBreed';
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