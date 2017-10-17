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
	<title>防疫服务</title>
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
	input,textarea {
	  margin:0;
	  padding:0;
	  outline:none;
	  border:none;
	}
	textarea {
	  resize:none;
	  overflow:auto;
	}
	ul,li {
	  margin: 0;
	  padding: 0;
	  list-style: none;
	}
	a,input{
	  -webkit-tap-highlight-color:rgba(255,0,0,0);
	  }
	h3 {
	  font-weight: normal;
	  font-size: 18px;
	  line-height: 42px;
	  text-align: left;
	  margin-left: 21px;
	}
	img {
	  width: 100%;
	  vertical-align: top;
	}
	.weui-cells_form {
	  margin: 0 15px;
	  font-size: 14px;
	}
	.weui-cell {
	  padding: 0;
	  margin: 0;
	  text-indent: 10px;
	  line-height: 40px;
	  border: 1px solid #e6e6e6;
	  border-bottom: none;
	}

	/*======== main =========*/
  body {
      background-color: #f2f2f2;
      color:#333333;
  }
  h3 {
    text-align: center;
    font-weight: normal;
    font-size: 16px;
    line-height: 56px;
  }
  .weui-cells {
		margin: 0;
    font-size: 14px;
    color: #666666;
    padding: 15px 0 15px 0;
    border-top: 1px solid #e6e6e6;
    border-bottom: 1px solid #e6e6e6;
	}
	.weui-cell {
		background-color: #ffffff;
		border: 0;
    line-height: 26px;
		font-size: 14px;
	}
  .weui-cell:before {
		border-top: none;
	}
  .weui-cells__title {
    margin: 0;
    font-size: 16px;
    color: #333333;
    line-height:77px;
    text-align: center;
  }
  .weui-cell__hd {
    width: 10px;
    margin-left: 24px;
  }
  .weui-cell__bd {
    margin-left: 10px;
  }
  .home {
    font-size: 16px;
    color: #333333;
    line-height: 40px;
  }
  .home .weui-cell__hd {
    width: 16px;
    margin-left: 20px;
  }
  </style>
</head>

<body>
  <div class="weui-cells__title">——&nbsp;&nbsp;成都市宠物防疫服务点&nbsp;&nbsp;——</div>

  <div class="weui-cells">
    <div class="weui-cell home">
      <div class="weui-cell__hd"><img src="./img/home_icon.png" alt="" style="display:block"></div>
      <div class="weui-cell__bd">
        <p>成都华西宠物医院</p>
      </div>
    </div>
    <a class="weui-cell weui-cell_access" href="tel:028-80000000;">
      <div class="weui-cell__hd"><img src="./img/tel_icon.png" alt="" style="display:block"></div>
      <div class="weui-cell__bd">
        <p>028-80000000</p>
      </div>
    </a>
    <a class="weui-cell weui-cell_access" href="javascript:;">
      <div class="weui-cell__hd"><img src="./img/address_icon.png" alt="" style="display:block"></div>
      <div class="weui-cell__bd">
        <p>成都市武侯区小天北巷15-17号</p>
      </div>
    </a>
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
