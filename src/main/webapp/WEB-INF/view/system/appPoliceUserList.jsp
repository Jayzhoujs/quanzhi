<%@page import="com.xtoucher.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
	<title>蓉e犬后台管理系统</title>  
<body>
<div><%@ include file="menu.jsp"%></div>
	
    <div class="content">   
    	<div class="container-fluid">
            <div id="pad-wrapper" class="users-list">
    			<div class="row-fluid header" style="margin:0 0 30px 0;">
                	<h3>用户列表展示</h3>
          </div>  
            <div id="pad-wrapper" class="datatables-page">
			 <table cellpadding="0" cellspacing="0" border="0" class="" id="example" style="width: 100%;margin-left:-10px;">

				<thead>
					<tr role="row">
						<th tabindex="0" rowspan="1" colspan="1">账号</th>
						<th tabindex="0" rowspan="1" colspan="1">姓名</th>
						<th tabindex="0" rowspan="1" colspan="1">电话</th>
						<th tabindex="0" rowspan="1" colspan="1">单位</th>
						<th tabindex="0" rowspan="1" colspan="1">状态</th>
						<th tabindex="0" rowspan="1" colspan="1">操作</th>
					</tr>
				</thead>
				<tbody style="text-align: center; width: 30px;">
					<c:choose>
						<c:when test="${accountModel.rank==2}">
							<c:forEach items="${listAccount }" var="list">
								<tr>
									<td><a href="office/updatePolice?id=${list.id}">${list.account }</a></td>
									<td>${list.userName }</td>
									<td class="center">${list.phone}</td>
									<c:if test="${list.branchId==null }">
										<td>市局</td>
									</c:if>
									<c:forEach items="${listBranch }" var="lb">
										<c:if test="${list.branchId==lb.id }">
											<td>${lb.name}</td>
										</c:if>
									</c:forEach>
									<c:if test="${list.isAvailable==0 }">
										<td class="center">可用</td>
									</c:if>
									<c:if test="${list.isAvailable==1 }">
										<td class="center">禁用</td>
									</c:if>
									<c:if test="${list.isAvailable==0 }">
										<td class="center"><a class="btn-flat white"
											href="office/Disable?id=${list.id }">禁用</a></td>
									</c:if>
									<c:if test="${list.isAvailable==1 }">
										<td class="center"><a class="btn-flat gray"
											href="office/Allow?id=${list.id }">打开</a></td>
									</c:if>

								</tr>
							</c:forEach>
						</c:when>
						<c:when test="${accountModel.rank==4}">
							<c:forEach items="${listAccount }" var="list">
								<tr>
									<td><a href="branch/updatePolice?id=${list.id}">${list.account }</a></td>
									<td>${list.userName }</td>
									<td class="center">${list.phone}</td>
									<c:if test="${list.branchId==null }">
										<td>市局</td>
									</c:if>
									<c:forEach items="${listBranch }" var="lb">
										<c:if test="${list.branchId==lb.id }">
											<td>${lb.name}</td>
										</c:if>
									</c:forEach>
									<c:if test="${list.isAvailable==0 }">
										<td class="center">可用</td>
									</c:if>
									<c:if test="${list.isAvailable==1 }">
										<td class="center">禁用</td>
									</c:if>
									<c:if test="${list.isAvailable==0 }">
										<td class="center"><a class="btn-flat white"
											href="branch/Disable?id=${list.id }">禁用</a></td>
									</c:if>
									<c:if test="${list.isAvailable==1 }">
										<td class="center"><a class="btn-flat gray"
											href="branch/Allow?id=${list.id }">打开</a></td>
									</c:if>

								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach items="${listAccount }" var="list">
								<tr>
									<td><a href="system/updatePolice?id=${list.id}">${list.account }</a></td>
									<td>${list.userName }</td>
									<td class="center">${list.phone}</td>
									<c:if test="${list.branchId==null }">
										<td>市局</td>
									</c:if>
									<c:forEach items="${listBranch }" var="lb">
										<c:if test="${list.branchId==lb.id }">
											<td>${lb.name}</td>
										</c:if>
									</c:forEach>
									<c:if test="${list.isAvailable==0 }">
										<td class="center">可用</td>
									</c:if>
									<c:if test="${list.isAvailable==1 }">
										<td class="center">禁用</td>
									</c:if>
									<c:if test="${list.isAvailable==0 }">
										<td class="center"><a class="btn-flat white"
											href="system/Disable?id=${list.id }">禁用</a></td>
									</c:if>
									<c:if test="${list.isAvailable==1 }">
										<td class="center"><a class="btn-flat gray"
											href="system/Allow?id=${list.id }">打开</a></td>
									</c:if>

								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>
