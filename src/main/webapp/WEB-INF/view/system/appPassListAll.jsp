<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<title>欢迎登录蓉e犬后台管理系统</title>
<style>
        .field-box{
             display: flex;
             width:570px;
	         margin-left: 220px;
	         margin-top: 10px;
	         justify-content: flex-start ;
        }
        .field-box label{
        	margin-right:15px;
        }
      
 </style>
</head>
<body>

<div><%@ include file="menu.jsp"%></div>
	
    <div class="content">
       
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>已审批信息详情</h3>
                </div>

                <div class="span7 personal-info">
                	<div class="field-box">
	                	<label>姓名：</label>
	                	<label>${examineModel.realName}</label>
                	</div>
                	<div class="field-box">
	                	<label>联系电话：</label>
	                	<label>${examineModel.phoneNum}</label>
                	</div>
                	<div class="field-box">
	                	<label>创建时间：</label>
	                	<label>${examineModel.dCreateTime}</label>
                	</div>
                	<div class="field-box">
	                	<label>地址：</label>
	                	<label>${examineModel.name}</label>
                	</div>
                	<div class="field-box">
	                	<label>犬只名字：</label>
	                	<label>${examineModel.dogName}</label>
                	</div>
                	<div class="field-box">
	                	<label>犬只名字：</label>
	                	<label>${examineModel.dogName}</label>
                	</div>
                	<div class="field-box">
	                	<label>犬只种类：</label>
	                	<label>${examineModel.dogName}</label>
                	</div>
                	<div class="field-box">
	                	<label>审批状态：</label>
	                	<label>${examineModel.status==2 }</label>
                	</div>
                	<div class="field-box">
	                	<label>审批时间：</label>
	                	<label>${ahm.handleTime}</label>
                	</div>
                	<div class="field-box">
	                	<label>审批人：</label>
	                	<label>${examineModel.dogName}</label>
                	</div>
                	<div class="field-box">
	                	<label>审批备注：</label>
	                	<label>${ahm.remark}</label>
                	</div>
                </div>
        
        </div>
    </div>
 

   

    <script src='js/sweetAeler/sweet-alert.js'></script>
    <script src='js/sweetAeler/sweet-alert.min.js'></script>   
    

    

    <script type="text/javascript">
         $(function () {
    
             $('#btn-glow').on('click',function(){
                     swal("OK!", "该信息已公开!", "success")
                });
             
             $('#reset').on('click',function(){
                      swal({
                      title: "你确定要不公开?",
                      type: "warning",
                      showCancelButton: true,
                      confirmButtonColor: "#DD6B55",
                      confirmButtonText: "Yes, 放弃它!",
                      cancelButtonText: "No, 再想想!",
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