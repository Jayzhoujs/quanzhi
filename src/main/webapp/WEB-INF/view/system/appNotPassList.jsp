<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<title>蓉e犬后台管理系统</title>
 </head>
<body>

    <div><%@ include file="menu.jsp"%></div>
  
	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid header">
                    <h3>未审批</h3>
                    <br>
                    <h6>点击姓名查看详情</h6>
         		</div>
        <div id="pad-wrapper" class="datatables-page">

            <table cellpadding="0" cellspacing="0" border="0px" class="" id="example">
                            <thead>
                                <tr role="row">
                                    <th tabindex="0" rowspan="1" colspan="1">姓名
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">联系电话
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">创建时间
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">地址
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">犬只名字
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">犬只种类
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                            <c:when test="${accountModel.rank==2}">
                            	<c:forEach items="${exb}" var="exb">
                            		
                                	 <tr align="center">                        	
                                    	<td><a href="office/aExaminePass?id=${exb.id}">${exb.realName}</a></td>
                                    	<td class="center">${exb.phoneNum}</td>
                                    	<td>${exb.dCreateTime}</td>
                                    	<td>${exb.area}-${exb.street}-${exb.address}</td>
                                    	<td class="">${exb.dogName}</td>
                                    	<td class="center">${exb.varieties}</td>
                               		 </tr> 
                            		
                             	</c:forEach>  	
                            </c:when>
                            <c:when test="${accountModel.rank==4 }">
                            	<c:forEach items="${exb}" var="exb">
                            		
                                	 <tr align="center">                        	
                                    	<td><a href="branch/aExaminePass?id=${exb.id}">${exb.realName}</a></td>
                                    	<td class="center">${exb.phoneNum}</td>
                                    	<td>${exb.dCreateTime}</td>
                                    	<td>${exb.area}-${exb.street}-${exb.address}</td>
                                    	<td class="">${exb.dogName}</td>
                                    	<td class="center">${exb.varieties}</td>
                               		 </tr> 
                            	
                             	</c:forEach>  	
                             </c:when>
                             <c:otherwise>
                            	<c:forEach items="${exb}" var="exb">
                                	<tr align="center">
                                    	<td><a href="system/aExaminePass?id=${exb.id }">${exb.realName}</a></td>
                                    	<td class="center">${exb.phoneNum}</td>
                                    	<td>${exb.dCreateTime}</td>
                                    	<td>${exb.area}-${exb.street}-${exb.address}</td>
                                    	<td class="">${exb.dogName}</td>
                                    	<td class="center">${exb.varieties}</td>
                                	</tr> 
                             	</c:forEach>
                          	</c:otherwise>
                             </c:choose>
                           	</tbody>
                        </table>
                </div>
            </div>
  </div>    

   


</body>
</html>