<%@page import="com.xtoucher.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"></base>
	<title>蓉e犬后台管理系统</title>
    
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
	<link href="./css/dog_e/lib/jquery.dataTables.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="./css/dog_e/compiled/datatables.css" type="text/css" media="screen" />
     
   
   
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>

    <!-- navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-inner">
            <a class="brand" href="login/home"><img src="./img/dogLogo_20170920152709.png" /> 蓉 E 犬 后 台 管 理 系 统 </a>           
        </div>
    </div>
    <!-- sidebar -->
	<div id="sidebar-nav">

		<ul id="dashboard-menu">
			<c:if test="${accountModel.rank==1 }">
			
				<li>
               		<a href="common/approval_list">
	                    <i class="icon-signal"></i>
	                    <span>审核管理</span>
               		 </a>
                	<!-- <ul class="submenu">
                    	<li><a href="system/branchAndUnApporval">未审批</a></li>
                   	 	<li><a href="system/statusA">已审批</a></li>
                   	 	<li><a href="system/statusA?i=notPass">未通过记录</a></li>
                    	<li><a href="system/all">全部审核历史</a></li>
                	</ul> -->
           		</li>   
           		 
            <li>
                 <a class="dropdown-toggle" href="#">
                    <i class="icon-th-large"></i>
                    <span>基础数据</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="system/dogBreed">犬种类</a></li>
                    <li><a href="system/dogColour">犬毛色</a></li>
                    <li><a href="system/allDogForbidden">禁养犬种</a></li>
                    <li><a href="system/dogHospital">疫苗网点</a></li>
                    <li><a href="system/queryAllBranch">网点管理</a></li>
                    <li><a href="system/queryArea">街道管理</a></li>
                    <li><a href="system/getRegulation">管理条例</a></li>
                    <li><a href="system/getProcess">办理流程</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-group"></i>
                    <span>组织架构</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="common/account_list">用户列表</a></li>
                    <li><a href="common/account_add_index">新用户</a></li>
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
                <a href="system/chart_index">
                    <i class="icon-signal"></i>
                    <span>统计</span>
                </a>
            </li>
			</c:if>
			<c:if test="${accountModel.rank==2 }">
				<li class="active">
		             <a href="common/approval_list">
		                  <i class="icon-signal"></i>
		                  <span>审核管理</span>
		             </a> 
            	</li>  
				<li>
	                <a class="dropdown-toggle" href="#">
	                    <i class="icon-group"></i>
	                    <span>组织架构</span>
	                    <i class="icon-chevron-down"></i>
	                </a>
	                <ul class="submenu">
							<li><a href="common/account_list">用户列表</a></li>
                    <li><a href="common/account_add_index">新用户</a></li>
					</ul>
            	</li>
			</c:if>
			<c:if test="${accountModel.rank==4 }">
				<li>
               		<a href="common/approval_list">
	                    <i class="icon-signal"></i>
	                    <span>审核管理</span>
               		 </a>
           		</li>
				<li>
					<a class="dropdown-toggle" href="#"> 
						<i class="icon-group"></i> 
						<span>组织架构</span> 
						<i class="icon-chevron-down"></i>
					</a>
					<ul class="submenu">
						<li><a href="common/account_list">用户列表</a></li>
                    <li><a href="common/account_add_index">新用户</a></li>
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
                <a  href="login/quit">
                	<i class="icon-signin"></i> 
                    <span>退出</span> 
                </a>
               
            </li>
		</ul>
	</div>
	<!-- end sidebar -->
	<!-- scripts -->
	<script src='./js/dog_e/jquery-latest.js'></script>
	<script src='./js/dog_e/bootstrap.min.js'></script>
	<script src='./js/dog_e/jquery-ui-1.10.2.custom.min.js'></script>

	<!-- flot charts -->
	<script src='./js/dog_e/jquery.flot.js'></script>
	<script src='./js/dog_e/jquery.flot.stack.js'></script>
	<script src='./js/dog_e/jquery.flot.resize.js'></script>
	<script src='./js/dog_e/theme.js'></script>
	
	<script src='./js/dog_e/jquery.knob.js'></script>   
    <script src="./js/dog_e/jquery.dataTables.js"></script>
   
   <script src='./js/dog_e/jquery.validate.min.js'></script>

    <script>
        $(function(){
            $(document).ready(function() {
                $('#example').dataTable({
                    "sPaginationType": "full_numbers"
                });
           });
        })
    
    </script>

</body>
</html>
