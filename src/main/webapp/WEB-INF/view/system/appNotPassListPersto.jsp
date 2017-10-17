<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>欢迎登录蓉e犬后台管理系统</title>
    
 <link rel="stylesheet" href="../css/sweetAlert/example.css">
 <link rel="stylesheet" href="../css/sweetAlert/sweet-alert.css">
 <style>
     .field-box{
         display: flex;
         width:570px;
         margin-left: 120px;
         margin-top: 10px;
         justify-content: space-around;
     }
     #btn-glow{
        margin-right:30px;
     }
     .actions{
     	display: flex;
     	justify-content:flex-end;
     	margin-top:30px;
     }
 </style>
</head>
<body>


<div><%@ include file="menu.jsp"%></div>

<div class="content">
    <div class="container-fluid">
        <div id="pad-wrapper" class="new-user">
            <div class="row-fluid header" style="margin:0 0 30px 0;">
                <h3>未审批信息详情</h3>
            </div>
            <div class="span7 personal-info">
             <c:choose>
                <c:when test="${accountModel.rank==2}">
                <form action="office/ExamineSubmit" method="post">
                    <div class="field-box">
	                	<label>姓名：</label>
	                	<label>${examineModel.realName }</label>
                	</div>
                    <div class="field-box">
                        <label>姓名:</label>
                      	<label>${examineModel.realName }</label>
                    </div>  
                    <div class="span6  actions">
                        <input type="button" class="btn-flat primary" id="btn-glow" value="审核通过 " />
                        <input type="button" class="btn-flat primary" id="reset" value="审核不通过" />
                    </div>
                </form>
              </c:when>
              <c:when test="${accountModel.rank==4}">
    
              <form action="branch/ExamineSubmit" method="post">
                    <div class="field-box">
	                	<label>姓名：</label>
	                	<label>${examineModel.realName }</label>
                	</div>
                    <div class="field-box">
                        <label>姓名:</label>
                      	<label>${examineModel.realName }</label>
                    </div>  
                    <div class="span6  actions">
                        <input type="button" class="btn-flat primary" id="btn-glow" value="审核通过 " />
                        <input type="button" class="btn-flat primary" id="reset" value="审核不通过" />
                    </div>
                </form>
              </c:when>
              <c:otherwise>
              <form action="system/ExamineSubmit" method="post">
                    <div class="field-box">
	                	<label>姓名：</label>
	                	<label>${examineModel.realName }</label>
                	</div>
                    <div class="field-box">
                        <label>姓名:</label>
                      	<label>${examineModel.realName }</label>
                    </div>  
                    <div class="span6  actions">
                        <input type="button" class="btn-flat primary" id="btn-glow" value="审核通过 " />
                        <input type="button" class="btn-flat primary" id="reset" value="审核不通过" />
                    </div>
                </form>
              </c:otherwise>
             </c:choose>
            </div>
        </div>
    </div>
</div>

<script src='js/dog_e/sweetAeler/sweet-alert.js'></script>
<script src='js/dog_e/sweetAeler/sweet-alert.min.js'></script>   


<script type="text/javascript">
     $(function () {

         $('#btn-glow').on('click',function(){
				console.log(1)

            });
         
         $('#reset').on('click',function(){
                  swal({
                  title: "你确定要不公开?",
                  type: "warning",
                  showCancelButton: true,
                  confirmButtonColor: "#DD6B55",
                  confirmButtonText: "Yes, 公开!",
                  cancelButtonText: "No, 不公开!",
                  closeOnConfirm: false
                },
                function(){
                  swal("OK!", "该信息未公开.", "success");
                });
            });
         
    });
</script>

</body>
</html>