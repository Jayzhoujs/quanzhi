<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>蓉e犬后台管理</title>
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
                            <h3 style='margin-left:-180px;font-size:24.5px;color: #29323d;'>所有广告信息展示</h3>
                        </div>
                    </div>
                     <div id="pad-wrapper" class="datatables-page">
                      <table cellpadding="0" cellspacing="0" border="0" class="" id="example">
                        <thead>
                                <tr role="row">
                                    <th tabindex="0" rowspan="1" colspan="1">标题
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">详情
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">创建时间
                                    </th>
                                    <th tabindex="0" rowspan="1" colspan="1">操作
                                    </th>
                                </tr>
                            </thead>
              
                            <tbody style="text-align: center; width: 50px;" >
                            <c:forEach items="${listAd}" var="ad">
                            	<tr>
                                    <td> ${ad.title}</td>
                                    <td><a href="${ad.url}" target="_blank">详情</a></td>
                                    <td> ${ad.createTime}</td>
                                    <td>
                                       <a class="btn-flat white" href="system/deleteAd?id=${ad.id }">
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
    </div>
</body>
</html>