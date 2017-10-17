<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="../css/sweetAlert/sweet-alert.css" type="text/css" rel="stylesheet" />
<html>
<head>
<title>蓉e犬后台管理系统</title>
</head>
<body>
	<div><%@ include file="menu.jsp"%></div>
	 <iframe id='iframe_display' name='iframe_display' style='display:none'></iframe>
	<div class="content">
		<div class="container-fluid">
			<div id="pad-wrapper" class="users-list">
				<div class="row-fluid header">
					<h3>街道查询管理</h3>
				</div>
				<div class="pull-right">
					<a class="btn-flat success new-product" href="system/saveArea" style="margin-right: 26px;">+增加区域</a> 
					<a class="btn-flat success new-product" href="system/saveArea?id=add" style="margin-right: 26px;">+增加街道</a>
				</div>

				<div id="pad-wrapper" class="datatables-page">

					<table cellpadding="0" cellspacing="0" border="0" class="" id="example">
						<thead>
							<tr role="row">
								<th tabindex="0" rowspan="1" colspan="1">街道区域名称</th>
								<th tabindex="0" rowspan="1" colspan="1">所属区县</th>
								<th tabindex="0" rowspan="1" colspan="1">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="area">
								<c:if test="${area.parentId==null }">
									<tr align="center">
										<td>${area.area }</td>
										<td class="center">${area.parentId }</td>
										<td class="center">
										<!--  <button class="btn-flat white tempDel" value="${area.id }">删除</button>
										-->	<a class="btn-flat gray" href="system/upArea?id=${area.id }">修改</a>
										</td>
									</tr>
								</c:if>
								<c:if test="${area.parentId!=null }">
									<tr align="center">
										<td>${area.area }</td>
										<c:forEach items="${list}" var="areaB">
										<c:if test="${area.parentId==areaB.id}">
										<td class="center">${areaB.area}</td>
										</c:if>
										</c:forEach>
										<td class="center">
										<!--  <button class="btn-flat white tempDel" value="${area.id }">删除</button>
										--> 	<a class="btn-flat gray" href="system/upArea?id=${area.id }&A=up">修改</a>
										</td>
									</tr>
								</c:if>
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
			$.post("system/deleteArea",{id:id},function(data){
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
						window.location.href = 'system/queryArea';
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