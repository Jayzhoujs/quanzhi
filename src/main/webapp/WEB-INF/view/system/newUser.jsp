<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<title>蓉e犬后台管理系统</title>
<link rel="stylesheet" href="../css/sweetAlert/example.css">
<link rel="stylesheet" href="../css/sweetAlert/sweet-alert.css">

</head>
<style>
	.selArea{
		width:62.358974%;
	}
	.selArea label{
		margin-right:45px;
	}

</style>
<body>
<div><%@ include file="menu.jsp"%></div> 
<!--    防止页面跳转标签-->
    <iframe id='iframe_display' name='iframe_display' style='display:none'></iframe>
	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>创建一个新用户</h3>
                </div>
                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container" style='margin-top:-70px;'>
                            <form class="new_user_form inline-input" action="system/addPoliceUser" method="post" id="formSub" target="iframe_display">
                                <div class="span12 field-box" style='margin-left:30px;'>
                                    <label>网 点:</label>
                                   <select name="branchId" id="sel1" class="selArea">
                                   		<option value="">请选择</option>
                                   	<c:forEach items="${list}" var="list">
                                       <option value="${list.id }">${list.name }</option>
                                     </c:forEach>
                                     <c:forEach items="${pl}" var="pl">
                                       <option value="${pl.id }">${pl.name }</option>
                                     </c:forEach>
                                   </select>
                                </div>
                                <div class="span12 field-box">
                                    <label>角 色:</label>
                                    <select name="rank" id="sel2" class="selArea">
                                       <option value="1">市局</option>
                                       <option value="2">分局</option>
                                       <option value="3">分局民警</option>
                                       <option value="4">派出所</option>
                                       <option value="5">派出所民警</option>  
                                   </select>
                                </div>
                                <div class="span12 field-box">
                                    <label>帐 号:</label>
                                    <input name="account" class="span9" id='test' type="text" maxlength='20' required  />
                                </div>
                                <div class="span12 field-box">
                                    <label>密 码:</label>
                                    <input name="pwd" class="span9" type="password"  required  />
                                </div>
                                <div class="span12 field-box">
                                    <label>姓 名:</label>
                                    <input name="userName" class="span9" type="text" maxlength='10' required  />
                                </div>
                                <div class="span12 field-box">
                                    <label>电 话:</label>
                                    <input name="phone" class="span9" type="text" maxlength='11' required  />
                                </div>
                                
                               
                                 <div class="span12 field-box">
                                    <label>帐号状态:</label>
                                    <select name="isAvailable" id="sel3" class="selArea" style='margin-left:-21px;'>
                                       <option value="0">可用</option>
                                       <option value="1">禁用</option>
                                   </select>
                                </div>
                                <div class="span11 field-box actions" style='margin-top:20px;'>
                                    <input type="submit"  class="btn-glow primary" id="btn-glow" value="提交" style='margin-left:300px;s'/>
                                    <input type="button" value="取消" class="btn-glow" id="reset-r" style='margin-left:0;'/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


	<script src='js/sweetAeler/sweet-alert.js'></script>
	<script src='js/sweetAeler/sweet-alert.min.js'></script>



	<script type="text/javascript">
        $(function () {
                      //放弃提交
                        $('.reset').on('click',function(){
                            swal({
                                  title: "你确定要放弃?",
                                  type: "warning",
                                  showCancelButton: true,
                                  confirmButtonColor: "#DD6B55",
                                  confirmButtonText: "Yes, 放弃!",
                                  cancelButtonText: "No, 再想想!",
                                  closeOnConfirm: false
                                },
                                 function(){
                                  swal("OK!", "该信息已经不存在.", "success");
                                });
                            })
                });
    </script>

</body>
</html>