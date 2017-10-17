<%@page import="com.xtoucher.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>欢迎登录蓉e犬后台管理系统</title>
</head>
<body>
	<div><%@ include file="menu.jsp"%></div>
	<div class="content">
		<div class="container-fluid">
			<div id="pad-wrapper" class="users-list">
				<div class="row-fluid header">
					<h3>已发布资讯</h3>
				</div>

				<div id="pad-wrapper" class="datatables-page">

					<table cellpadding="0" cellspacing="0" border="0" class=""
						id="example">
						<thead>
							<tr role="row">
								<th tabindex="0" rowspan="1" colspan="1">标题</th>
								<th tabindex="0" rowspan="1" colspan="1">摘要</th>
								<th tabindex="0" rowspan="1" colspan="1">创建时间</th>
								<th tabindex="0" rowspan="1" colspan="1">类型</th>
								<th tabindex="0" rowspan="1" colspan="1">操作</th>
							</tr>
						</thead>
						<tbody align="center">
							<c:forEach items="${listNews }" var="ln">
								<tr>
									<td><a href="system/newsSelect?id=${ln.id }">${ln.title }</a></td>
									<td>${ln.abstracts }</td>
									<td>${ln.createTime }</td>
									<c:if test="${ln.type==0 }">
										<td>内链接</td>
									</c:if>
									<c:if test="${ln.type==1 }">
										<td>外链接</td>
									</c:if>
									<td class="center">
										<a class="btn-flat white" href="system/deleteNews?id=${ln.id }">
											删除
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>