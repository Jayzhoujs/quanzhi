<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
	<title>蓉e犬后台管理系统</title>
	<link href="../css/sweetAlert/sweet-alert.css" type="text/css" rel="stylesheet" />
<style>
    .box{
        text-align: center;
        width: 50px;
        margin-left: -200px;
        height: 10px;
    }

</style>
</head>
<body>

<div><%@ include file="menu.jsp"%></div>
 <!--    防止页面跳转标签-->
    <iframe id='iframe_display' name='iframe_display' style='display:none'></iframe>
	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>修改</h3>
                </div>
                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
 							<form class="new_user_form inline-input" method="post" action="common/account_update" id="formSub" target="iframe_display">
                                <input type="hidden" name="id" value="${data.tempAccount.id}"/>
                                
                                <div class="span12 field-box">
                                    <label>帐 号:</label>
                                    <input name="account" disabled value="${data.tempAccount.account}" class="span9" type="text" maxlength='20'/>
                                </div>
                                <div class="span12 field-box">
                                    <label>密 码:</label>
                                    <input name="pwd"  class="span9" value="${data.tempAccount.pwd}" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>姓 名:</label>
                                    <input name="userName" value="${data.tempAccount.userName}" class="span9" type="text" maxlength='10'/>
                                </div>
                                <div class="span12 field-box">
                                    <label>电 话:</label>
                                    <input name="phone" value="${data.tempAccount.phone}" class="span9" type="text" maxlength='12'/>
                                </div>
                                
                                <div class="span11 field-box actions">
                                    <input type="button" id="myCommit" class="btn-glow primary" value="提交" />
                                    <span>OR</span>
                                    <input type="reset" value="放弃" class="reset" id="reset-r" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    
    $(document).ready(function() {  
    	
    	
    	
    	$("#myCommit").click(function(){
    		//做表单校验
    		
    		
    		
    		 $.ajax({
                 type: "POST",
                 dataType: "json",
                 url:"common/account_update",
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
         					location.href = "common/account_list";
         				});
         			}
                 },
                 error: function(data) {
                	 swal("Sorry!", data.info, "error");
                  }
             });

    	});   
    	
 	}); 
    
	
    </script>
    <script src='./js/sweetAeler/sweet-alert.js'></script>
	<script src='./js/sweetAeler/sweet-alert.min.js'></script> 
</body>
</html>
