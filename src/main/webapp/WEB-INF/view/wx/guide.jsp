<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<% 
String path = request.getContextPath();
		String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+path +"/";
%>
<base href="<%=basePath%>"></base>
	<title>在线办理</title>
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
  </style>
</head>
<body>
  <h3>犬主信息检索</h3>
	<form method="post" action="wx/verify" id="hform">
    <div class="weui-cells weui-cells_form">
			<div class="weui-cell">
        <div class="weui-cell__hd"><label for="" class="weui-label">身份证号：&nbsp;&nbsp;</label></div>
        <div class="weui-cell__bd">

          <input id="userid" class="weui-input" type="text" name="IDNum" value="" maxlength="19" pattern="^\d{15}$|^\d{17}([0-9]|X)$" required oninvalid="setCustomValidity('请输入有效的身份证号码');" >

        </div>
			</div>
			<input class="submit next" name="" type="submit" value="下一步" />
  	</div>
	</form>

  <script src="./lib/jquery-2.1.4.js"></script>
  <script src="./js/jquery-weui.js">
	</script><script src="./lib/fastclick.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	  
	  $(".submit").click(function(){
	      if (!$("#userid").val()||$("#userid").val().search(/^\d{15}$|^\d{17}([0-9]|X)$/)==-1) {
	        $.toptip('请输入有效身份证号码',2000,'warning');
	        return false;
	      }else {
	        $("#hform").submit();
	      }
	   });
	</script>
</body>


</html>
