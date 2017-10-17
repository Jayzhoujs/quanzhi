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
                    <h3>申报详情</h3>
                </div>
                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar" style='margin-top:88px;'>
                        <div class="container" style='margin-top:-70px;'>
                            <div class="span12 field-box " style='margin-left:30px;margin-top:0px;'>
                                   <label>姓名:</label>
                                   <span>${approModel.realName}</span>
                             </div>
                             <div class="span12 field-box " style='margin-top:0px;'>
                                   <label>电话:</label>
                                   <span>${approModel.phoneNum}</span>
                             </div>
                             <div class="span12 field-box " style='margin-top:0px;'>
                                   <label>区域:</label>
                                   <span>${approModel.area}</span>
                             </div>
                             <div class="span12 field-box" style='margin-top:0px;'>
                                   <label>街道:</label>
                                   <span>${approModel.street}</span>
                             </div>
                             <div class="span12 field-box" style='margin-top:0px;'>
                                   <label>地址:</label>
                                   <span>${approModel.address}</span>
                             </div>
                             <div class="span12 field-box" style='margin-top:0px;'>
                                   <label>犬只名字:</label>
                                   <span>${approModel.dogName}</span>
                             </div>
                             <div class="span12 field-box" style='margin-top:0px;'>
                                   <label>品种:</label>
                                   <span>${approModel.varieties}</span>
                             </div>
                             
                             <div class="span12 field-box" style='margin-top:0px;'>
                                   <label>颜色:</label>
                                   <span>${approModel.color}</span>
                             </div>
                             <div class="span12 field-box" style='margin-top:0px;'>
                                   <label>犬只性别:</label>
                                   <c:choose>
                                   	<c:when test="${approModel.dogGender==0}">
                                   		<span>公</span>
                                   	</c:when>
                                   	<c:when test="${approModel.dogGender==1}">
                                   		<span>母</span>
                                   	</c:when>
                                   </c:choose>
                             </div>
                             <div class="span12 field-box" style='margin-top:0px;'>
                                   <label>申报状态:</label>
                                   <c:choose>
                                   	<c:when test="${approModel.status==0}">
                                   		<span>待审核</span>
                                   	</c:when>
                                   	<c:when test="${approModel.status==1}">
                                   		<span>已通过</span>
                                   	</c:when>
                                   	<c:when test="${approModel.status==2}">
                                   		<span>未通过</span>
                                   	</c:when>
                                   </c:choose>
                             </div>
                             <div class="span12 field-box" style='margin-top:0px;'>
                                   <label>犬只生日:</label>
                                   <span>${approModel.dogBirth}</span>
                             </div>
                             <div class="span12 field-box" style='margin-top:0px;'>
                                   <label>免疫证编号:</label>
                                   <span>${approModel.immuneNum}</span>
                             </div>
                             <div class="span12 field-box" style='margin-top:0px;'>
                                   <label>是否禁养犬:</label>
                                    <c:choose>
                                   	<c:when test="${approModel.isForbidden==0}">
                                   		<span>否</span>
                                   	</c:when>
                                   	<c:when test="${approModel.isForbidden==1}">
                                   		<span>是</span>
                                   	</c:when>
                                   </c:choose>
                             </div>
                             <div class="span12 field-box" style='margin-top:0px;'>
                                   <label>是否绝育:</label>
                                    <c:choose>
                                   	<c:when test="${approModel.isSterilized==0}">
                                   		<span>否<span>
                                   	</c:when>
                                   	<c:when test="${approModel.isSterilized==1}">
                                   		<span>是</span>
                                   	</c:when>
                                   </c:choose>
                             </div>
                             <div class="span12 field-box" style='margin-top:0px;'>
                                   <label>犬只照片:</label>
                                   <img alt="犬只照片" src="${approModel.imgUrl}" style='width:120px;height:120px;'>
                             </div>
                             
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>