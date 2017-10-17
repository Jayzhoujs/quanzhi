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


  .weui-panel__hd {
    font-size: 16px;
    background-color: #f2f2f2;
    color: #333333;
  }
  .weui-media-box_appmsg .weui-media-box__hd {
    width: 27.14%;
  }
  .list {
    width: 60%;
  }

	.icon_s {
    width: 56px;
    margin: 16px 10px;
  }
  .icon_s img {
    width: 28px;
		margin: 0 auto;
		display: block;
		vertical-align: top;
  }
  .icon_s strong {
  	display: block;
  	text-align: center;
    font-weight: normal;
		line-height: 28px;
  }
	.box__thumb {
		width: 26.67%;
		padding-right: 8px;
	}
  </style>
</head>

<body>
  <div class="weui-panel weui-panel_access">
    <div class="weui-panel__hd">基本信息</div>
      <div class="weui-panel__bd">
          <div class="weui-media-box weui-media-box_appmsg">
            <div class="box__thumb">
              <img class="weui-media-box__thumb" src="./img/thumb.png">
            </div>
            <div class="weui-media-box__bd clear">
              <ul class="list fl">
                <li>犬主姓名：<span>${data.userName}</span></li>
                <li>犬名：<span>${data.dogName}</span></li>
                <li>犬种：<span>${data.varieties}</span></li>
                <li>申请日期：<span>${data.submitTime}</span></li>
              </ul>
              <div class="fr icon_s">
              		<c:choose>
						<c:when test="${data.status==0}">
        					<img src="./img/icon_10.png" alt="">
           				    <strong>审核中</strong>
           				</c:when>
           				<c:when test="${data.status==1}">
           					<img src="./img/icon_09.png" alt="">
           				    <strong>已通过</strong>
           				</c:when>
           				<c:when test="${data.status==2}">
           					<a href="wx/progress_histoty?approvalId=${data.id}">
	           					<img src="./img/icon_08.png" alt="">
	           				    <strong>未通过</strong>
	           				    <strong>查看原因</strong>
           					</a>
           				</c:when>
					</c:choose>
              </div>
            </div>
          </div>
      </div>
  </div>
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
