<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link href="../css/sweetAlert/sweet-alert.css" type="text/css" rel="stylesheet" />
	<title>欢迎登录蓉e犬后台管理系统</title>
</head>
<body>
<div><%@ include file="menu.jsp"%></div>
<iframe id='iframe_display' name='iframe_display' style='display:none'></iframe>
	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid header">
                      <h3>疫苗网点查询管理</h3>
         </div>
          <div class="pull-right">
                        <a class="btn-flat success new-product" href="system/addHospital" style="margin-right:26px;">+ 增加网点</a>
          </div>
        
        <div id="pad-wrapper" class="datatables-page">

            <table cellpadding="0" cellspacing="0" border="0" class="" id="example">
                           <thead>
                                <tr role="row">
                                    <th tabindex="0" rowspan="1" colspan="1">网点名称
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">联系电话
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">区县
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">地址
                                    </th> 
                                    <th tabindex="0" rowspan="1" colspan="1">操作
                                    </th> 
                                </tr>
                            </thead>
                           <tbody>
                            <c:forEach items="${qh }" var="qh">
                       
                                <tr align="center">
                                    <td>${qh.name}</td>
                                    <td class="center">${qh.contactPhone}</td>
                                    <td>${qh.area}</td>
                                    <td>${qh.address}</td> 
                                    
                                    <td class="center"> 
                                    	<button class="btn-flat white tempDel" value="${qh.id }">删除</button> 
                                     
                                      	<a class="btn-flat gray" href="system/qeuryHospital?id=${qh.id }">修改</a>
                                    </td>   	
                                </tr>
                           
                             </c:forEach>
                            </tbody>
                        </table>
                </div>
            </div>
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
			$.post("system/deleteHospital",{id:id},function(data){
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
						window.location.href = 'system/dogHospital';
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