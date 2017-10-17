<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
String path = request.getContextPath();
		String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+path +"/";	
%>
<base href="<%=basePath%>"></base> 
	<title>进度查询</title>
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
  .fl {
		float: left;
	}
	.fr {
		float: right;
	}
	.clear:after {
		content: '';
		display: block;
		clear: both;
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


  .weui-cell {
    border: none;
  }
  .weui-cell:before {
		border-top: none;
	}
  .weui-cell__hd {
    font-size: 16px;
    text-indent: none;
    width: 32.27%;
    min-width:118px;
  }
  .weui-label {
    width: 100%;
    text-indent: none;
  }
  .weui-input {
    width:94.48%;
    padding: 4.625px 0;
    border:1px solid #333;
    border-radius: 5px;
    line-height:39px;
    text-indent: 6px;
  }
  </style>
</head>

<body>
  <div class="weui-cells weui-cells_form">
  	<form action="wx/progress_search" method="post" id="hform">
	    <div class="weui-cell">
	      <div class="weui-cell__hd"><label for="" class="weui-label">身份证号码：</label></div>
	      <div class="weui-cell__bd clear">
	        <input class="weui-input fl" type="text" name="IDNum" value="" maxlength="19" pattern="^\d{15}$|^\d{17}([0-9]|X)$" required oninvalid="setCustomValidity('请输入有效的身份证号码');">
	      </div>
	    </div>
	    <div class="weui-cell">
	      <div class="weui-cell__hd"><label for="" class="weui-label">电话号码：</label></div>
	      <div class="weui-cell__bd clear">
	        <input class="weui-input fl" type="tel" name="phone" maxlength="11" value="" pattern="^1[3|4|5|7|8][0-9]{9}$" required oninvalid="setCustomValidity('请输入有效的身份证号码');">
	      </div>
	    </div>
	    <input class="submit next" name="" type="submit" value="查询" />
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
	      if (!$("input:eq(0)").val()||$("input:eq(0)").val().search(/^\d{15}$|^\d{17}([0-9]|X)$/)==-1) {
	        $.toptip('请输入有效身份证号码',2000,'warning');
	        return false;
	      }else if (!$("input:eq(1)").val()||$("input:eq(1)").val().search(/^1[3|4|5|7|8][0-9]{9}$/)==-1) {
		    $.toptip('请输入电话号码',2000,'warning');
			return false;
		  }else {
	        $("#hform").submit();
	      }
	  });
	</script>
</body>
</html>
