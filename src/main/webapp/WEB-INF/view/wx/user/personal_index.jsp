<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<%
String path = request.getContextPath();
		String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+path +"/";
%>
<base href="<%=basePath%>"></base>
	<title>个人中心</title>
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

  html,body{
    height: 100%;
  }
  .header {
    width: 100%;
    height: 28%;
    position: relative;
    background: linear-gradient(top,#31D3E7,#58B0E4);
    background: -webkit-linear-gradient(top,#31D3E7,#58B0E4);
    background: -moz-linear-gradient(top,#31D3E7,#58B0E4);
  }
  .head_portrait {
    width: 20%;
		height: 44.12%;
    position: absolute;
    top: 15.88%;
    left: 40%;
  }
  .head_portrait img {
    vertical-align: top;
    width:100%;
    height: 100%;
  }
  .user_id {
    width: 20%;
    position: absolute;
    top: 63.53%;
    left: 42%;
    font-size: 16px;
    color: #FFFFFF;
  }
  .user_id  span,em {
    font-size: 14px;
    line-height: 20px;
    font-style: normal;
  }
  .num {
    position: absolute;
    right: 0;
  }
  .weui-cell {
    border: none;
  }

  .weui-cells__title {
    line-height: 48px;
    margin: 0;
  }
  .weui-cell__ft {
    margin-right: 30px;
  }
  </style>
</head>

<body>
  <div class="header">
    <div class="head_portrait">
      <img src="./img/peo_head.png" alt="">
    </div>

  </div>

  <div class="weui-cells__title">犬只管理</div>
  <div class="weui-cells info-list">
    <a class="weui-cell weui-cell_access" href="wx/personal_dog_index">
      <div class="weui-cell__bd">
        <p>查询犬证</p>
      </div>
      <div class="weui-cell__ft">
      </div>
    </a>
    <a class="weui-cell weui-cell_access" href="wx/zhuxiao_search">
      <div class="weui-cell__bd">
        <p>注销犬证</p>
      </div>
      <div class="weui-cell__ft">
      </div>
    </a>
  </div>

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
