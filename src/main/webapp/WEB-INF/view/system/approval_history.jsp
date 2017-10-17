<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<title>蓉e犬后台管理系统</title>
</head>


<body>
<div><%@ include file="menu.jsp"%></div> 
<!--    防止页面跳转标签-->
    <iframe id='iframe_display' name='iframe_display' style='display:none'></iframe>
	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>审核详情</h3>
                </div>
                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container" style='margin-top:-70px;'>
                            <div class="span12 field-box" style='margin-left:30px;'>
                                   <label>状态:</label>
                                   <span>${historyModel.status}</span>                                   
                             </div>
                             <div class="span12 field-box">
                                   <label>提交时间:</label>
                                   <span>${historyModel.createTime}</span>                                   
                             </div>
                             <div class="span12 field-box">
                                   <label>审核意见:</label>
                                   <span>${historyModel.remark}</span>                                   
                             </div>
                             <div class="span12 field-box">
                                   <label>处理时间:</label>
                                   <span>${historyModel.handleTime}</span> 
                             </div>
                             <div class="span12 field-box">
                                   <label>网点名称:</label>
                                   <span>${historyModel.branchName}</span> 
                             </div>
                             <div class="span12 field-box">
                                   <label>审核人员姓名:</label>
                                   <span>${historyModel.userName}</span>
                             </div>
                             <div class="span12 field-box">
                                   <label>审核人员账号:</label>
                                   <span>${historyModel.account}</span>
                             </div>
                             
                             <div class="span12 field-box">
                                   <label>审核人员电话:</label>
                                   <span>${historyModel.phone}</span>
                             </div>
                             
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>