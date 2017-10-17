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
		-text-indent: 22px;
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


  .weui-cells__title {
    margin: 0;
    font-size: 16px;
    color: #333333;
    line-height:55px;
    text-align: center;
  }
  .weui-cell {
    padding-left: 15px;
  }
  .weui-cell__hd {
    width: 95px;
  }
  .weui-panel{
    margin: 0 12px;
  }
  .weui-panel__bd {
    border: 1px solid #f2f2f2;
  }
  .weui-panel__hd {
    font-size: 16px;
    background-color: #f2f2f2;
    color: #333333;
  }
  .weui-media-box {
    padding: 0;
  }
  .weui-media-box_appmsg .weui-media-box__hd {
    width: 27.14%;
  }
  .weui-media-box__bd {
    position: relative;
  }
  .list {
    width: 100%;
    border-bottom: 1px solid #E6E6E6;
  }
  .list li {
    line-height: 40px;
    text-indent: 18px;
    border: 1px solid #E6E6E6;
    border-bottom: none;
  }
	.box__thumb {
	  position: absolute;
    background-color: #FFFFFF;
    top: 0;
    right: 0;
		width: 42.86%;
		padding: 6px;
    border: 1px solid #E6E6E6;
	}

  </style>
</head>

<body>
  <div class="weui-cells__title">——&nbsp;&nbsp;犬只信息&nbsp;&nbsp;——</div>
  <div class="weui-panel weui-panel_access">
      <div class="weui-panel__bd">
          <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__bd">
              <ul class="list">
                <li>犬名：<span>${dog.dogName}</span></li>
                <li>犬种：<span>${dog.varieties}</span></li>
                <li>毛色：<span>${dog.color}</span></li>
                 <c:choose>
                	<c:when test="${dog.gender==0}">
                	 <li>犬性别：<span>公</span></li>
                	</c:when>
                	<c:when test="${dog.gender==1}">
                	 <li>犬性别：<span>母</span></li>
                	</c:when>
                </c:choose>
                <li>犬登记号：<span>${dog.registrationNum}</span></li>
                <li>登记日期：<span>${dog.registrationTime}</span></li>
                <li>备注：<span>${dog.remark}</span></li>
              </ul>
              <div class="box__thumb">
                <img class="weui-media-box__thumb" src="${dog.imgUrl}">
              </div>
            </div>
          </a>
      </div>
  </div>
  <div class="weui-cells__title space"></div>

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
