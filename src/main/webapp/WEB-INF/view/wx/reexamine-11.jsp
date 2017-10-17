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

  .wrap {
    width: auto;
    -height: 100px;
    margin: 12px;
    border: 1px solid #E6E6E6;
    background: #FFFFFF;
  }
  .pic {
    width: 21.37%;
    margin: 32px auto 0;
  }
  .pic img {
    vertical-align: middle;
    width: 100%;
  }
  .pic_wrap p {
    line-height: 60px;
    text-align: center;;
  }
  .wrap span {
    font-size: 16px;
    margin-left: 10px;
    color: #73B6FF;
  }
  ul,li {
    list-style: none;
  }
  ul {
    margin-left: 10px;
    line-height:28px;
    margin-bottom: 22px;
  }

  </style>
</head>

<body>
  <div class="wrap">
    <div class="pic_wrap">
      <div class="pic">
        <img src="./img/false.png" alt="">
      </div>
      <p>抱歉，您的申请未通过！</p>
    </div>

    <span>未通过原因</span>
    <ul>
      <li>1、免疫证照片不清晰</li>
    </ul>
  </div>
	<input class="submit next" name="" type="button" value="重新审核" />
  <script src="./lib/jquery-2.1.4.js"></script>
  <script src="./js/jquery-weui.js">
	</script><script src="./lib/fastclick.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	</script>
</body>
</html>
