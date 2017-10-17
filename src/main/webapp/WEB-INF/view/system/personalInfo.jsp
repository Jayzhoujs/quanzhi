<%@page import="com.xtoucher.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
	<title>蓉e犬后台管理</title>
	<link rel="stylesheet" type="text/css" href="../css/dog_e/common.css" />
</head>
<style>
	.field-box{
		display:flex;
		margin-top:10px;
	}
</style>
<body>  
  <div><%@ include file="menu.jsp"%></div>
  <div class="content">   
        <div class="container-fluid" style='margin-top:100px;'>
                <!-- edit form column -->
                <div class="span7 personal-info">
                    <div class="alert alert-info">
                        <i class="icon-lightbulb"></i>
                       		您好！	
                          <strong>查看我的信息，并且请做对应修改</strong>，修改成功请重新登录 
                    </div>
                    <h5 class="personal-title">个人信息展示</h5>

                    <form action="login/updateCurrent" method="post">
                        <div class="field-box">
                            <label>帐  号:</label>
                           	<input type="hidden" value="${aM.id}" name="id">
                            <input class="span5 inline-input" type="text" value="${aM.account}" name="account" required="required"/>
                        </div>
                        <div class="field-box">
                            <label>姓  名:</label>
                            <input class="span5 inline-input" type="text"value="${aM.userName}" name="userName" maxlength="6" required="required"/>
                        </div>
                        <div class="field-box">
                            <label>电  话:</label>
                            <input class="span5 inline-input" type="text" value="${aM.phone}" name="phone" maxlength="12" required="required"/>
                        </div>
                        <div class="field-box">
                            <label>单  位:</label>
                            <c:if test="${aM.branchId==null}">
                           		<h5>成都市公安局</h5>
                            <input class="span5 inline-input" type="hidden" value="${aM.branchId}" name="branchId"/>
                        	</c:if>
                            <c:if test="${aM.branchId==bm.id}">
                           		<h5>${bm.name}</h5>
                            <input class="span5 inline-input" type="hidden" value="${aM.branchId}" name="branchId"/>
                        	</c:if>                       		
                        </div>
                        <div class="span6 field-box actions">
                        	<input type="button" class="btn-glow primary" value="修改密码" style='margin-right:-222px;' id="bounceIn"/>
                            <input type="submit" class="btn-glow primary" value="保存修改" />
                       		<input type="button" class="btn-glow" value="返回" style='margin-left:30px;' onclick="javascrtpt:window.location.href='login/home'"/>                           	
                        </div>
                    </form>
                </div>
            </div>
     </div>
     
     <!-- 修改密码弹框 -->
     <div class="box">
		<div id="dialogBg"></div>
		<div id="dialog" class="animated">
			<img class="dialogIco" width="50" height="50" src="./img/ico.png" alt="" />
			<div class="dialogTop" style='margin-top:20px;'>
				<span id='lable'></span>
				<a href="javascript:;" class="claseDialogBtn" style='color:white;'>关闭</a>
			</div>
			<form action="login/modifyPwd" method="post" id="editForm" onsubmit="return check()">
				<ul class="editInfos">
					<li>
						<label><font color="#ff0000">* </font>
							旧密码：<input type="password" name="pwd" required value="" class="ipt" id="pwd" />
								<input type="hidden" value="${aM.account }" name="account" >
								<input type="hidden" value="${pwdB }" name="pwdOld" id="pwdOld">
						</label>
					</li>
					<li>
						<label>
							<font color="#ff0000">* </font>
							新密码：<input type="password" name="newpwd" required value="" class="ipt" id='a' maxlength="13"/>
						</label></li>
					<li>
						<label><font color="#ff0000">* </font>
							确认密码：<input type="password" name="ispwd" required value="" class="ipt" id='b' maxlength="13"/>
						</label></li>
					<li>						
						<input type="submit" value="确认提交" class="submitBtn btn-glow primary" />
					</li>
				</ul>
			</form>
		</div>
	</div>
     <script src='./js/dog_e/jquery.min.js'></script>
     <script type="text/javascript">
	     $(function () {
		   	 //弹框样式
		     var w,h,className;
		     function getSrceenWH(){
		         w = $(window).width();
		         h = $(window).height();
		         $('#dialogBg').width(w).height(h);
		     }
		     window.onresize = function(){  
		         getSrceenWH();
		     }  
		     $(window).resize();            
		     getSrceenWH();
		     //显示弹框
		     $('#bounceIn').click(function(){
		         className = $(this).attr('class');
		         $('#dialogBg').fadeIn(300);
		         $('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
		     });
		
		     //关闭弹窗
		     $('.claseDialogBtn').click(function(){
		         $('#dialogBg').fadeOut(300,function(){
		             $('#dialog').addClass('bounceOutUp').fadeOut();
		         });
		     })
		
		     //验证新密码是否一致
		    /*  $('#b').blur(function(){		    	 
		    	 var newpwd = $('#a').val()
		    	 var ispwd = $('#b').val()
		    	 if(newpwd != ispwd){
		    		 $('#lable').html('两次密码必须一致，请重新输入！')
		    	 }
		     }) */
	     });
	     function check(){	    	 
	    	 	var pwd=document.getElementById("pwd").value;
	    	 	var pwdOld=document.getElementById("pwdOld").value;
	    	 
	    	    var newpwd = document.getElementById("a").value;
	    	    var ispwd = document.getElementById("b").value;
	    	    if(newpwd != ispwd ){
	    	    	 $('#lable').html('两次密码必须一致，请重新输入！')
	    	        return false;
	    	    }else if (pwd!=pwdOld) {
	    	    	 $('#lable').html('旧密码输入错误，请重新输入！')
		    	     return false;
				}
	    	   	return true;
	    	 }
     </script>
  
</body>
</html>