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
    #reset-r{
    	margin-left:0;
    } 
    #btn-glow{
    	margin-left:750px;
    }  
</style>
<body>
<div><%@ include file="menu.jsp"%></div>

    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>创建一个街道</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                       
                            <form class="new_user_form inline-input" action="system/addArea" method="post" id="formSub" >  
                                <div class="span12 field-box" style='margin-left:30px;'>
                                    <label>选择区域名称:</label>
                                    <select name="parentId" style='width: 62.358974%;'>
                                    	<c:forEach items="${list }" var="list">
                                    		<c:if test="${list.parentId==null }">
                                    		<option value="${list.id }">${list.area }</option>
                                    		</c:if>
                                    	</c:forEach>
                                    </select> 
                                </div>
                                <div class="span12 field-box">
                                    <label>填写街道名称:</label>
                                    <input name='area' class="span9" type="text" id='area' maxlength="20" required="required"/>  
                                </div>
                                <div class="span11 field-box actions">
                                    <input type="submit"  class="btn-glow primary" id="btn-glow" value="提交" style='margin-left: 540px;margin-top:15px;'/>
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
       /*   $(function () {
        	 $("#btn-glow").click(function(){
 		    	var area = $("input[name='area']").val();
 		    	if(area == ''){
 		    		swal("Sorry!", "请正确填写后提交！", "error");
 		    	}else{
 		    		$('#area').val(area)
 					$.post("system/addArea",{area:area},function(data){	
 						debugger
 								if (data.status=='ok') {
 									swal({
 										title : "成功！",
 										type : "success",
 										confirmButtonText : "确认",
 										confirmButtonColor : "#07C6FC"
 									}, function() {
 										window.location.href = ' system/queryArea';
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