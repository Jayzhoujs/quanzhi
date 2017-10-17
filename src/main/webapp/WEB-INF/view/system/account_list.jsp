<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>蓉e犬后台管理</title>
	<link href="../css/sweetAlert/sweet-alert.css" type="text/css" rel="stylesheet" />
	
</head>
<body>

<div><%@ include file="menu.jsp"%></div>

	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper">
            
                <!-- orders table -->
                <div class="table-wrapper orders-table section">
                    <div class="row-fluid head">
                        <div class="span12">
                            <h3 style='margin-left:-180px;font-size:24.5px;color: #29323d;'>账号列表</h3>
                        </div>
                    </div>
                     <div id="pad-wrapper" class="datatables-page">
                      <table cellpadding="0" cellspacing="0" border="0" class="" id="example">
                        <thead>
                                <tr role="row">
                                    <th tabindex="0" rowspan="1" colspan="1">账号
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">姓名
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">角色
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">联系电话
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">单位
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">状态
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">创建时间
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">操作
                                    </th>
                                </tr>
                            </thead>
              
                            <tbody style="text-align: center; width: 50px;" >
                            <c:forEach items="${list}" var="accountModel">
                            	<tr>
                                    <td><a href="common/account_update_index?id=${accountModel.id}">${accountModel.account}</a></td>
                                    <td> ${accountModel.userName}</td>
                                    <c:choose>
                                    	<c:when test="${accountModel.rank=='1'}">
                                    		<td>市局管理员</td>
                                    	</c:when>
                                    	<c:when test="${accountModel.rank=='2'}">
                                    		<td>分局领导</td>
                                    	</c:when>
                                    	<c:when test="${accountModel.rank=='3'}">
                                    		<td>分局民警</td>
                                    	</c:when>
                                    	<c:when test="${accountModel.rank=='4'}">
                                    		<td>派出所领导</td>
                                    	</c:when>
                                    	<c:when test="${accountModel.rank=='5'}">
                                    		<td>派出所民警</td>
                                    	</c:when>
                                    	<c:when test="${accountModel.rank=='6'}">
                                    		<td>公共查询账号</td>
                                    	</c:when>
                                    </c:choose>
                                    <td> ${accountModel.phone}</td>
                                    <td> ${accountModel.branch}</td>
                                    <c:choose>
                                    	<c:when test="${accountModel.isAvailable=='1'}">
                                    		<td>正常</td>
                                    	</c:when>
                                    	<c:when test="${accountModel.isAvailable=='0'}">
                                    		<td>被禁用</td>
                                    	</c:when>
                                    </c:choose>
                                    <td> ${accountModel.createTime}</td>
                                   	<c:choose>
                                    	<c:when test="${accountModel.isAvailable=='1'}">
                                    		<td class="center">
                                    			<button class="btn-flat white jinyong" value="${accountModel.id}">禁用</button>
                                    		</td>
                                    	</c:when>
                                    	<c:when test="${accountModel.isAvailable=='0'}">
                                    		<td class="center">
                                    			<button class="btn-flat gray qiyong" value="${accountModel.id}">启用</button>
											</td>
                                    	</c:when>
                                  	 </c:choose>
                                </tr>
                            </c:forEach>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
  	//启用账号
	$(".qiyong").click(function(){
		var id = this.value;
		swal({
			title: "您确定本次操作?", 
			text: "本次操作启用该账号", 
			type: "warning",
			showCancelButton: true,
			closeOnConfirm: false,
			cancelButtonText:"取消",
			confirmButtonText: "确定",
			confirmButtonColor: "#ec6c62"
			}, function() {
				$.post("common/account_status_change",{id:id,status:1},function(data){
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
				});
			}
		);
	});
  	
	//禁用账号
	$(".jinyong").click(function(){
		var id = this.value;
		swal({
			title: "您确定本次操作?", 
			text: "本次操作禁用该账号", 
			type: "warning",
			showCancelButton: true,
			closeOnConfirm: false,
			cancelButtonText:"取消",
			confirmButtonText: "确定",
			confirmButtonColor: "#ec6c62"
			}, function() {
				$.post("common/account_status_change",{id:id,status:0},function(data){
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
				});
			}
		);
	});
    </script>
    <script src='./js/sweetAeler/sweet-alert.js'></script>
	<script src='./js/sweetAeler/sweet-alert.min.js'></script> 
</body>
</html>