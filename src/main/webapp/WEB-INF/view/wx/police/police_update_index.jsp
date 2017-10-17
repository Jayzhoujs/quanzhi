<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<% 
String path = request.getContextPath();
		String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+path +"/";	
%>
<base href="<%=basePath%>"></base>
	<title>警务系统</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
  <link rel="stylesheet" href="./lib/weui.min.css">
  <link rel="stylesheet" href="./css/jquery-weui.css">
  <style>
  html, body {
    margin: 0;
    padding: 0;
    -webkit-tap-highlight-color: transparent;
  }
  body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      background-color: #f2f2f2;
      color:#333333;
      margin: 0;
      padding: 0;
  }
	input,textarea {					/* ----------------reset------*/
		margin:0;
		padding:0;
		outline:none;
		border:none;
	}
	textarea {							/* ----------------reset------*/
		resize:none;
		overflow:auto;
	}

	a,input{ -webkit-tap-highlight-color:rgba(255,0,0,0); }   /* 处理高亮 */

  h3 {							/*  ---------------公共类  */
    text-align: center;
    font-weight: normal;
    font-size: 16px;
    line-height: 56px;
  }
	.weui-cells {
			margin: 0;
	}
	.weui-cell {
		padding: 0;
		background-color: #ffffff;
    border-top: 1px solid #e6e6e6;
    border-bottom: 1px solid #e6e6e6;
		font-size: 14px;
    line-height: 48px;
		text-indent: 22px;
	}

	.submit{			/*  ---------------公共类  */
		background:#73b5ff;
		color:#fffeff;
	}
  .next{				/*  ---------------公共类  */
     width: 29.33%;
     display: block;
     margin: 30px auto;
     font-size: 16px;
     line-height: 40px;
     border-radius: 10px;
  }

  .header {
    width: 100%;
  }
  .header img {
    vertical-align: top;
    width:100%;
    height: 100%;
  }
  .weui-cells_form,.weui-cell {
    background-color: white;
  }
  .weui-cells_form {
    height: 100%;
    background:#f2f2f2;
  }
  .weui-cell {
    border-bottom: none;
  }
  .weui-cell:before {
    border-top: none;
  }
  .old_password {
    border-bottom: 1px solid #e6e6e6;
  }
  .weui-cell__hd label {
    width: 108px;
  }
  .weui-cell__bd input {
    width: 80%;
    padding: 5px;
  }
  .weui-cells__title {
    background-color: #f2f2f2;
    height: 20px;
    margin: 0;
    padding: 0;
  }
  .next {
    position: absolute;
    left: 0;
    bottom: 20px;
    font-size: 18px;
    line-height: 60px;
    width: 100%;
    margin: 0;
    border-radius: 0;
  }
  </style>
</head>

<body>
  <div class="weui-cells__title"></div>
  <div class="weui-cells weui-cells_form">
  <form action="wx/police/police_update" method="post" id="hform">
    <div class="weui-cell old_password">
      <div class="weui-cell__hd"><label class="weui-label">输入原密码：</label></div>
      <div class="weui-cell__bd">
        <input class="weui-input" type="password" name="oldPwd" maxlength="20" required  >
      </div>
    </div>
    <div class="weui-cells__title"></div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="" class="weui-label">设置新密码:</label></div>
      <div class="weui-cell__bd">
        <input class="weui-input" type="password" name="newPwd" value="" placeholder="请输入6-20位新密码" maxlength="20"  >
      </div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="" class="weui-label">确认密码:</label></div>
      <div class="weui-cell__bd">
        <input class="weui-input" type="password" name="newPwd2" value="" placeholder="请再次输入6-20位新密码" maxlength="20"   >
      </div>
    </div>
     <input class="submit next" name="" type="submit" value="保存新密码" />
     </form>
  </div>
 

  <script src="./lib/jquery-2.1.4.js"></script>
  <script src="./js/jquery-weui.js">
	</script><script src="./lib/fastclick.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	  
	  $(".submit").click(function(){
		  if(!$(".weui-input:eq(0)").val()||$(".weui-input:eq(0)").val().search(/^\S{5,9}$/)==-1){
		 	  $.toptip('旧密码输入有误，请重新输入',2000,'warning');
		  	  return false;
		  }else if(!$(".weui-input:eq(1)").val()||$(".weui-input:eq(1)").val().search(/^\S{5,19}$/)==-1){
			  $.toptip('新密码输入有误，请重新输入',2000,'warning');
			  return false;
		  }else{	//新旧密码都符合匹配时
			  if($(".weui-input:eq(1)").val()==$(".weui-input:eq(0)").val()){
				  $.toptip('新密码不能与旧密码相同',2000,'warning');
				  return false;
			  }else if ($(".weui-input:eq(2)").val()!=$(".weui-input:eq(1)").val()){
				  $.toptip('两次新密码输入不一致',2000,'warning');
				  return false;
			  }else{
				  $("#hform").submit();
			  }
		  }
	  })
	</script>
</body>
</html>
