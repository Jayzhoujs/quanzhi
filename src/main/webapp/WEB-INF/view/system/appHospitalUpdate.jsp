<%@page import="com.xtoucher.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>蓉e犬后台管理</title>
	<link href="../css/sweetAlert/sweet-alert.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/sweetAlert/example.css">
</head>
<style>
	.area{
		width:62.358974%;
	}
</style>
<body>
<div><%@ include file="menu.jsp"%></div>

	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>修改网点信息</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                            <form class="new_user_form inline-input" action="system/updateHospital" method="post"  id="formSub"> 
                            	<div></div>
                                <div class="span12 field-box">
                                    <label>区县选择:</label>
                                    <select name="area" class='area'>
                                    <c:forEach items="${area }" var="ar">
                                    	<option value="${ar.area }">${ar.area }</option>
                                    </c:forEach>
                                    </select>		
                                </div>
                                <div class="span12 field-box">
                                    <label>详细街道:</label>
                                    <input class="span9" type="text" name="address" value="${hm.address }" required/>		
                                </div>
                                <div class="span12 field-box">
                                    <label>网点名称:</label>
                                    <input class="span9" type="text" name="name" value="${hm.name }" maxlength="100" required />		
                                </div>
                                <div class="span12 field-box">
                                    <label>联系方式:</label>
                                    <input class="span9" type="text" name="contactPhone" value="${hm.contactPhone }" maxlength="12" required/>		
                                </div>
                                
                                <div class="span11 field-box actions">
                                	<input type="hidden" value="${hm.id }" name="id">
                                    <input type="button" class="btn-glow primary" id='myCommit' value="提交" style='margin-left:46%;'/>
                                </div>
                              
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
<script src='./js/sweetAeler/sweet-alert.js'></script>
<script src='./js/sweetAeler/sweet-alert.min.js'></script> 
  
    <script type="text/javascript">
    
/*     $(document).ready(function() {  
    	
    	$("#myCommit").click(function(){
    		//做表单校验
    		 $.ajax({
                 type: "POST",
                 dataType: "json",
                 url:"system/updateHospital",
                 data: $('#formSub').serialize(),
                 success: function (data) {
                	 if(data.status=='error'){
         				swal("Sorry!", data.info, "error");
         			}
         			else{
         				swal({  
         					title: "成功！",
         					type: "success",
         					confirmButtonText: "确认", 
         					confirmButtonColor: "#07C6FC" 
         				}, function() { 
         					location.href = "system/dogHospital";
         				});
         			}
                 },
                 error: function(data) {
                	 swal("Sorry!", data.info, "error");
                  }
             });

    	});   
    	
 	});  */
    </script>


</body>
</html>