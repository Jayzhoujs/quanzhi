<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
	<title>欢迎登录蓉e犬后台管理系统</title>
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
 
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>新增</h3>
                </div>
                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
 							<form class="new_user_form inline-input" method="post" action="common/account_add" id="formSub" >
                               
                                <div class="span12 field-box" style='margin-left:31px;'>
                                    <label>角 色:</label>
                                    <c:choose>
                                    	<c:when test="${data.accountModel.rank==1}">
                                    		<select name="rank" id ="rank" style='width: 62.358974%;'>
                               					<option value="1">市局管理员</option>
                                   				<option value="2">分局领导</option>
                                   				<option value="3">分局民警</option>
                                   				<option value="4">派出所领导</option>
                                   				<option value="5">派出所民警</option>
                                   				<option value="6">公共查询账号</option>
                                    		</select>
                                    	</c:when>
                                    	<c:when test="${data.accountModel.rank==2}">
                                    		<select name="rank" style='width: 62.358974%;'>
                                        		<option value="3">分局民警</option>
                                    		</select>
                                    	</c:when>
                                    	<c:when test="${data.accountModel.rank==4}">
                                    		<select name="rank" style='width: 62.358974%;'>
                                        		<option value="5">派出所民警</option>
                                    		</select>
                                    	</c:when>
                                    </c:choose>
                                </div>
                                <div class="span12 field-box" id="tempWD">
                                    <label>网 点:</label>
                                    <select name="branchId" id="tempBranch" style='width: 62.358974%;'>
                                   		<c:forEach items="${data.branchList}" var="branchModel">
                                       		<option value="${branchModel.id}">${branchModel.name}</option>
                                     	</c:forEach>
                                     </select>
                                </div>
                                <div class="span12 field-box">
                                    <label>帐 号:</label>
                                    <input name="account" value="" class="span9" type="text" maxlength='20' required/>
                                </div>
                                <div class="span12 field-box">
                                    <label>密 码:</label>
                                    <input name="pwd"  class="span9" value="" type="text" required/>
                                </div>
                                <div class="span12 field-box">
                                    <label>姓 名:</label>
                                    <input name="userName" value="" class="span9" type="text" maxlength='10' required/>
                                </div>
                                <div class="span12 field-box">
                                    <label>电 话:</label>
                                    <input name="phone" value="电话格式为：028-66666666" class="span9" type="text"  pattern="^[0-9]{3}-[0-9]{8}$" required />
                                </div>
                                
                                <div class="span11 field-box actions">
                                    <input type="button" id="myCommit" class="btn-glow primary" value="提交" style='margin-left:750px;'/>                                  
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
                 url:"common/account_add",
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
  //根据角色选择网点
	$("#rank").change(function(){
		var rank = $("#rank").val();
		if(rank=='6'){
			//网点要隐藏，且置空
			$("#tempWD").hide();
			$("#tempBranch").val("");
		}
		else{
			$("#tempWD").show();
			$.post("common/getBranchList",{rank:rank},function(data){
					var list = data.list;
					var html="";
					if(list.length==0){
						html+='没有相关网点';
					}
					else{
						for (var i = 0; i < list.length; i++) {
							html+='<option value="'+list[i].id+'">'+list[i].name+'</option>';
						}
					$("#tempBranch").html(html); 
					}
				});
			}
		
	});
    
	
    </script>
    <script src='./js/sweetAeler/sweet-alert.js'></script>
	<script src='./js/sweetAeler/sweet-alert.min.js'></script> 
</body>
</html>