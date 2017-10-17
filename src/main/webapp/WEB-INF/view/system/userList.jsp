<%@page import="com.xtoucher.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	/* String basePath = " https://app-happyhome.eksaas.com/";  */
	/* String basePath = " https://app-happyhome-test.eksaas.com/";  */
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>"></base>
	<title>Detail Admin - User list</title>
 
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="./css/dog_e/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="./css/dog_e/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="./css/dog_e/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- libraries -->
    <link href="./css/dog_e/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <link href="./css/dog_e/lib/font-awesome.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="./css/dog_e/layout.css" />
    <link rel="stylesheet" type="text/css" href="./css/dog_e/elements.css" />
    <link rel="stylesheet" type="text/css" href="./css/dog_e/icons.css" />

    <!-- this page specific styles -->
    <link rel="stylesheet" href="./css/dog_e/compiled/index.css" type="text/css" media="screen" />    

   
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>

    <!-- navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-inner">
            <a class="brand" href="login/home"><img src="./img/logo.png" /></a>           
        </div>
    </div>
	<div id="sidebar-nav">

		<ul id="dashboard-menu">
			<c:if test="${accountModel.rank==1 }">
				<li>
               		<a class="dropdown-toggle">
                    	<i class="icon-home"></i>
                   			 <span>审批管理</span>
                    	<i class="icon-chevron-down"></i>
                	</a>
                	<ul class="submenu">
                    	<li><a href="system/branchAndUnApporval">未审批</a></li>
                   	 	<li><a href="system/statusA">已审批</a></li>
                   	 	<li><a href="system/statusA?i=notPass">未通过记录</a></li>
                    	<li><a href="system/all">全部审核历史</a></li>
                	</ul>
           		 </li>

            
            <li>
                <a class="dropdown-toggle" >
                    <i class="icon-calendar-empty"></i>
                    <span>犬只管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="system/dogBreed">犬种类</a></li>
                    <li><a href="system/dogColour">犬毛色</a></li>
                    <li><a href="system/allDogForbidden">禁养犬种</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-group"></i>
                    <span>组织架构</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="system/branchSelect">用户列表</a></li>
                    <li><a href="system/addUserJsp">新用户</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-picture"></i>
                    <span>广告</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="system/allAd">查看已发布</a></li>
                    <li><a href="system/saveAd">新增广告</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-th-large"></i>
                    <span>资讯</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="system/newsAll">查看已发布</a></li>
                    <li><a href="system/SaveNews">新增资讯</a></li>
                </ul>
            </li>
            <li>
                <a href="tables.html">
                    <i class="icon-signal"></i>
                    <span>统计</span>
                </a>
            </li>
			</c:if>
			<c:if test="${accountModel.rank==2 }">
				<li>
               		<a class="dropdown-toggle" href="index.html">
                    	<i class="icon-home"></i>
                   			 <span>审批管理</span>
                    	<i class="icon-chevron-down"></i>
                	</a>
                	<ul class="submenu">
                    	<li><a href="office/statusA?i=UnApproved">未审批</a></li>
                   	 	<li><a href="office/statusA">已审批</a></li>
                   	 	<li><a href="office/statusA?i=notPass">未通过记录</a></li>
                    	<li><a href="office/all">全部审核历史</a></li>
                	</ul>
           		 </li>
				<li>
					<a class="dropdown-toggle" href="#"> 
						<i class="icon-group"></i> 
						<span>组织架构</span> 
						<i class="icon-chevron-down"></i>
					</a>
					<ul class="submenu">
						<li><a href="office/branchSelect">用户列表</a></li>
						<li><a href="office/addUserJsp">新用户</a></li>
					</ul>
				</li>

			</c:if>
			<c:if test="${accountModel.rank==4 }">
				<li>
               		<a class="dropdown-toggle" href="index.html">
                    	<i class="icon-home"></i>
                   			 <span>审批管理</span>
                    	<i class="icon-chevron-down"></i>
                	</a>
                	<ul class="submenu">
                    	<li><a href="branch/statusA?i=UnApproved">未审批</a></li>
                   	 	<li><a href="branch/statusA">已审批</a></li>
                   	 	<li><a href="branch/statusA?i=notPass">未通过记录</a></li>
                    	<li><a href="branch/all">全部审核历史</a></li>
                	</ul>
           		 </li>
				<li>
					<a class="dropdown-toggle" href="#"> 
						<i class="icon-group"></i> 
						<span>组织架构</span> 
						<i class="icon-chevron-down"></i>
					</a>
					<ul class="submenu">
						<li><a href="branch/branchSelect">用户列表</a></li>
						<li><a href="branch/addUserJsp">新用户</a></li>
					</ul>
				</li>

			</c:if>
			<li>
                <a href="login/Current">
                	<i class="icon-user"></i> 
                    <span>我的信息</span>
                </a>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">
                	<i class="icon-signin"></i> 
                    <span>退出</span> 
                </a>
            </li>
		</ul>
	</div>
	<!-- end sidebar -->


	<!-- main container -->
    <div class="content">
        
        <div class="container-fluid">
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid header">
                    <h3>用户列表展示</h3>
                    <div class="span10 pull-right">
                    <br>
                                <c:forEach items="${listBranch }" var="br">
                      			<form action="system/branchSelect" method="post" style="margin:0px;display:inline;">
                         			<input type="hidden" value="${br.id }" name="id"/>
                                  	<input type="submit" class="btn-glow primary" value="${br.name }" /> 
                                 </form>
                                </c:forEach>
                                
                                <br>
                                <select class='area'>
                                	<option >请选择派出所</option>
                                  	<c:forEach items="${listBranchA }" var="all">
                            			
                                   			 <option value="${all.id }">${all.name }</option>                     
			                            
            		                </c:forEach>	
                                </select>
                               	
                        <a href="new-user.html" class="btn-flat success pull-right">
                            <span>&#43;</span>
                            		增加
                        </a>
                    </div>
                </div>

                <!-- Users table -->
                <div class="row-fluid table">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="span4 sortable">
                                   	警员编号	
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span> 姓名
                                </th>
                                <th class="span2 sortable">电话
                                    <span class="line"></span>
                                </th>
                                <th class="span3 sortable align-right">
                                    <span class="line"></span>所属
                                </th>
                                <th class="span3 sortable align-right">
                                    <span class="line"></span>帐号状态
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                       <c:forEach items="${listAccount }" var="la">
                        <tr class="first">
                            <td>
                                <img src="./img/contact-img.png" class="img-circle avatar hidden-phone" />
                                <a href="user-profile.html" class="name">${la.account }</a>
                               
                            </td>
                            <td>
                                ${la.userName }
                            </td>
                            <td>
                                ${la.phone }
                            </td>
                            <td class="align-right">
                            <c:forEach items="${all }" var="all">
                            <c:if test="${all.id==la.branchId }">
                                ${all.name }
                            </c:if>
                            </c:forEach>
                            </td>
                            <td class="align-right">
                            <c:if test="${la.isAvailable==0}">
                               可用
                            </c:if>
                            <c:if test="${la.isAvailable==1}">
                               禁用
                            </c:if>
                            </td>
                            <td>
                                <ul class='edit'>
                                    <li>修改</li>
                                    <li>删除</li>
                                </ul>
                            </td>
                        </tr>
                        </c:forEach>
                        <!-- row -->
                        
                       
                        
                        </tbody>
                    </table>
                </div>
                <div class="pagination pull-right">
                    <ul>
                        <li><a href="#">&#8249;</a></li>
                        <li><a class="active" href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&#8250;</a></li>
                    </ul>
                </div>
                <!-- end users table -->
            </div>
        </div>
    </div>
    <!-- end main container -->


	<!-- scripts -->
    <script src="./js/dog_e/jquery-latest.js"></script>
    <script src="./js/dog_e/bootstrap.min.js"></script>
    <script src="./js/dog_e/theme.js"></script>

</body>
</html>