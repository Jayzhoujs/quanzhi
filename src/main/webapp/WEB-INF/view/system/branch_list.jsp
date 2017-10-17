<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                      <h3>网点查询管理</h3>
         </div>
          <div class="pull-right">
                        <a class="btn-flat success new-product" href="system/Branch?id=add1" style="margin-right:26px;">+ 增加分局</a>
                        <a class="btn-flat success new-product" href="system/Branch?id=add2" style="margin-right:26px;">+ 增加派出所</a>
          </div>
        
        <div id="pad-wrapper" class="datatables-page">

            <table cellpadding="0" cellspacing="0" border="0" class="" id="example">
                           <thead>
                                <tr role="row">
                                    <th tabindex="0" rowspan="1" colspan="1">单位名称
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">所属分局
                                    </th> 
                                    <th tabindex="0" rowspan="1" colspan="1">操作
                                    </th> 
                                </tr>
                            </thead>
                           <tbody >
                            <c:forEach items="${list }" var="list">
                                <tr align="center">
                                    <td>${list.name}</td>
                                    
                                    <td class="center">${list.parentId}</td>
                                    
                                    <td class="center"> 
                                  <!--     	<a class="btn-flat white" href="system/deleteHospital?id=${qh.id }">删除</a>
                                    -->
                                      	<a class="btn-flat gray" href="system/upBranch?id=${list.id }?A=one">修改</a>
                                    </td>   	
                                </tr>
                             </c:forEach>
                             <c:forEach items="${pl }" var="pl">
                                <tr align="center">
                                    <td>${pl.name}</td>
                                    <c:forEach items="${list }" var="list">
                                    <c:if test="${pl.parentId==list.id  }">
                                    <td class="center">${list.name}</td>
                                    </c:if>
                                    </c:forEach>
                                    <td class="center"> 
                                     <!--  	<a class="btn-flat white" href="system/deleteHospital?id=${qh.id }">删除</a>
                                      --> 	<a class="btn-flat gray" href="system/upBranch?id=${pl.id }">修改</a>
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
        $(function(){
            $('.a').on('click',function(event){
                event.preventDefault();
            });             
        })
    
    </script>


</body>
</html>
