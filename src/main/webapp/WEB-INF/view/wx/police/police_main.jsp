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

  html,body{
    height: 100%;
  }
  .header {
    width: 100%;
    height: 25.49%;
    position: relative;
    background: linear-gradient(top,#31D3E7,#58B0E4);
    background: -webkit-linear-gradient(top,#31D3E7,#58B0E4);
    background: -moz-linear-gradient(top,#31D3E7,#58B0E4);
  }
  .head_portrait {
    width: 20%;
		height: 44.18%;
    position: absolute;
    top: 15.88%;
    left: 40%;
  }
  .head_portrait img {
    vertical-align: top;
    width:100%;
  }
  .user_id {
    position: absolute;
    top: 73.53%;
    left: 36%;
    font-size: 18px;
    display:flex;
    display:-webkit-flex;
    flex-derection:column;
    justify-content:center;
    color: #FFFFFF;
  }
  .user_id strong {
  	font-weight:normal;
  }
  .weui-cell {
    border: none;
  }
  .weui-cell_access .weui-cell__ft:after {
    right: 32px;
  }
  .weui-cells__title {
    height: 24px;
    margin: 0;
  }
  </style>
</head>

<body>
  <div class="header">
    <div class="head_portrait">
      <img src="./img/pc_head.png" alt="">
    </div>
    <div class="user_id"><strong>ID:</strong><span class="num">${data.accountModel.account}</span></div>
  </div>
  <div class="weui-cells__title"></div>
  <div class="weui-cells">
  	<c:choose>
  		<c:when test="${data.accountModel.rank==6}">
  			 <a class="weui-cell weui-cell_access" href="wx/police/police_dog_index">
      			<div class="weui-cell__bd">
        			<p>查询犬证</p>
      			</div>
     			<div class="weui-cell__ft">
      			</div>
   			 </a>
  		</c:when>
  		<c:otherwise>
  			<a class="weui-cell weui-cell_access" href="wx/police/police_to_approval">
     		 <div class="weui-cell__bd">
       		 <p>待审核</p>
      		 </div>
      		 <div class="weui-cell__ft">
      		 </div>
    		</a>
    		<a class="weui-cell weui-cell_access" href="wx/police/police_approvaled">
    		  <div class="weui-cell__bd">
        		<p>已审核</p>
      		 </div>
     		 <div class="weui-cell__ft">
      		</div>
    		</a>
    		 <a class="weui-cell weui-cell_access" href="wx/police/police_dog_index">
      			<div class="weui-cell__bd">
        			<p>查询犬证</p>
      			</div>
     			<div class="weui-cell__ft">
      			</div>
   			 </a>
   		</c:otherwise>
  	</c:choose>

  </div>
  <div class="weui-cells__title"></div>
  <div class="weui-cells">
    <a class="weui-cell weui-cell_access" href="wx/police/police_setting">
      <div class="weui-cell__bd">
        <p>设置</p>
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
