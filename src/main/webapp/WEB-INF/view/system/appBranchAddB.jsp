<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>欢迎登录蓉e犬后台管理系统</title>   
<!--    弹框插件-->
   <link rel="stylesheet" href="../css/sweetAlert/example.css">
   <link rel="stylesheet" href="../css/sweetAlert/sweet-alert.css">
</head>
<style>
	.selArea{
		width: 62.358974%;
		height:33px;
	}
    #reset-r{
    	margin-left:0;
    } 
    #btn-glow{
    	margin-left:500px;
    } 
    #span12{
    	margin-left:44px;
    } 
</style>
<body>
<div><%@ include file="menu.jsp"%></div>

    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>创建一个派出所网点</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                           
                            <form class="new_user_form inline-input" action="system/addBranchB" method="post" id="formSub" >                              
                                <div class="span12 field-box" id='span12'>
                                    <label>选择分局名称:</label>
                                     <select name="parentId" id="parentId" class="selArea">
                                    	<c:forEach items="${list }" var="list">
                                    	<c:if test="${list.parentId==null }">
                                       		<option value="${list.id }">${list.name}</option>
                                        </c:if>
                                     </c:forEach>
                                    </select>
                                </div>
                                <div class="span12 field-box">
                                    <label>添加派出所名称:</label>
                                    <input name='name' class="span9" type="text" id='type' required maxlength="30"/>    
                                </div>
                                <div class="span11 field-box actions">
                                    <input type="submit"  class="btn-glow primary" id="btn-glow" value="提交" style='margin-top:20px;'/>
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
    
    <script>
   /*  $(function () {
   	 $("#btn-glow").click(function(){
   	    	var name = $("input[name='name']").val();
   	    	var sel1 = $('#parentId').val();  	    	
   	    	if(name == ''){
   	    		swal("Sorry!", "请正确填写后提交！", "error");
   	    	}else{
   	    		$("#name").val(name);
   	    		$('#parentId').val(parentId)
   	    		$.post("system/addBranch",{name:name,parentId:parentId},function(data){
   	    		
   	    			if (data.status=='ok') {
   	    				swal({
   	    					title : "添加成功！",
   	    					type : "success",
   	    					confirmButtonText : "确认",
   	    					confirmButtonColor : "#07C6FC"
   	    				}, function() {
   	    					window.location.href = 'system/queryAllBranch';
   	    				});
   	    			} else {
   	    				swal("Sorry!", "出错了！", "error");
   	    			}
   	    		});
   	    	} 
   	        
   		});
   }); */
    </script>
     
    


</body>
</html>