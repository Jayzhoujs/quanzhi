<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<html>
<head>
<% 
String path = request.getContextPath();
		String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+path +"/";	
%>
<base href="<%=basePath%>"></base>
	<title>管理条例</title>
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
  ul,li {
    margin: 0;
    padding: 0;
    list-style: none;
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

  body {
    background-color: #FFFFFF;
  }
  .scrollWrap{
		position: relative;
		height: 100%;
		min-height: 480px;
		overflow: auto;
	}
  h3 {
    font-size: 18px;
    line-height: 42px;
    text-align: left;
    margin-left: 21px;
  }
  .topic {
    margin-left: 21px;
    font-size: 12px;
    color: #999999;
  }
  em {
    font-style: normal;
    margin-left: 8px;
  }
  .pic {
    width: 81.71%;
    margin: 8px auto 16px;
  }
  .pic img {
    width: 100%;
    vertical-align: top;
  }
  .content {
  	width:100%;
  	box-sizing:border-box;
  	padding: 0 12px;
  	font-size: 14px;
  }
  .content img {
  	width:100%;
	vertical-align: top;
  }
  .content h6 {
    text-indent: 0;
  }
  .footer {
    margin: 0 0 5px 12px;
    font-size: 12px;
    line-height: 33px;
    color: #999999;
  }
  </style>
</head>

<body>
  <section class="scrollWrap">
    
    <div class="content">
     ${data.regulation.detail}
    </div>
    <div class="footer">
      <span>来源：</span><em>成都蓉e犬</em>
    </div>
  </section>
  <script src="./lib/jquery-2.1.4.js"></script>
  <script src="./js/jquery-weui.js"></script>
  <script src="./lib/fastclick.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	</script>
</body>
</html>
