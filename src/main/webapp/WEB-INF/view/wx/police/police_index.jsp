<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <!DOCTYPE html>
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
    background-color: #FFFFFF;
    border: none;
  }
  .weui-cells_form {
    height: 71.01%;
		padding-top: 5%;

  }
  .weui-cell:before {
    border: none;
  }
  .weui-cells:after {
    border: none;
  }
  .weui-cell__bd input {
    width: 85%;
    padding: 5px;
    border-radius: 5px;
    border: 1px solid #AAAAAA;
  }
  </style>
</head>

<body>
  <div class="header">
    <img src="./img/pc_banne_01.png" alt="">
  </div>
  <div class="weui-cells weui-cells_form">
	  <form action="wx/police/login" method="post">
		  <div class="weui-cell">
		      <div class="weui-cell__bd" >
						<input id="username" type="text" name="account" value="" required placeholder="请输入账号">
		      </div>
				</div>
		    <div class="weui-cell">
		      <div class="weui-cell__bd">
						<input id="pwd" type="password" name="password" value="" required placeholder="请输入密码">
		      </div>
			</div>
		    <input class="submit next" name="" type="submit" value="登录" />
	  </form>
  </div>
  <script src="./lib/jquery-2.1.4.js"></script>
  <script src="./js/jquery-weui.js"></script>
  <script src="./lib/fastclick.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	  
	  $(".submit").click(function(){
		  //console.log($("#pwd").val());
	      if (!$("#username").val()||$("#username").val().search(/^[a-zA-Z0-9_]{6,20}$/)==-1) {
	        $.toptip('请重新输入6-20位账号',2000,'warning');
	        return false;
	      }else if (!$("#pwd").val()||$("#pwd").val().search(/^\S{6,20}$/)==-1) {
	        $.toptip('请重新输入6-20位密码',2000,'warning');
	        return false;
	      }else {
	        $("#hform").submit();
	      }
	    });
	 
		  var str=${mapResult.data};
		  var status=str['status'];
		  var info=str['info'];
			 if(status=='error'){
				 $.toptip(info,2000,'warning');
			 }
</script>
</body>
</html>
    