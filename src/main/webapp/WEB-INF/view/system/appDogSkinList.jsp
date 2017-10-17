<%@page import="com.xtoucher.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<link href="../css/sweetAlert/sweet-alert.css" type="text/css" rel="stylesheet" />
	<title>欢迎登录蓉e犬后台管理系统</title>
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
 <iframe id='iframe_display' name='iframe_display' style='display:none'></iframe>
	<!-- main container -->
    <div class="content">
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid header">
                    <h3>犬只毛色</h3>
                </div>
                    <div class="pull-right">
                    
                        <a class="btn-flat success new-product" href="system/SaveColorJsp">+ 增加犬种毛色</a>
                    </div>
            </div>  
            <div id="pad-wrapper" class="datatables-page">
            	
            	<table cellpadding="0" cellspacing="0" border="0" class="" id="example" style="width: 100%;margin-left:-10px;">
                            <thead>
                                <tr role="row">
                                    <th tabindex="0" rowspan="1" colspan="1">颜色
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">操作
                                    </th>
                                </tr>
                            </thead>
                           
 							
                            <tbody style="text-align: center; width: 50px; ">
                            <c:forEach items="${list }" var="list">
                                <tr>
                                    <td>${list.color }            
                                    <td>
                                    <button class="btn-flat white tempDel" value="${list.id }">删除</button> 
                                   
                                    </td>
                                </tr>
                            </c:forEach>  
                            </tbody> 
                            
                        </table>
         
                </div>
        </div>

<script>
$(".tempDel").click(function(){
	var id = this.value;
	swal({
		title: "您确定本次操作?", 
		text: "本次删除操作", 
		type: "warning",
		showCancelButton: true,
		closeOnConfirm: false,
		cancelButtonText:"取消",
		confirmButtonText: "确定",
		confirmButtonColor: "#ec6c62"
		}, function() {
			$.post("system/dogColorDelete",{id:id},function(data){
				if(data.status=='error'){
					swal("Sorry!", data.info, "error");
				}
				else{
					swal({  
						title: "删除成功！",
						type: "success",
						confirmButtonText: "确认", 
						confirmButtonColor: "#07C6FC" 
					}, function() { 
						window.location.href = 'system/dogColour';
					});
				}
			});
		}
	);
});

</script>
    <script src='./js/sweetAeler/sweet-alert.js'></script>
	<script src='./js/sweetAeler/sweet-alert.min.js'></script> 
</body>
</html>