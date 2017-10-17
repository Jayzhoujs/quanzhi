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
	<title>接种记录</title>
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
      font-size: 28px;
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

	.weui-cells_form {								/*---------公共类-------*/
    margin: 0 15px;
		font-size: 14px;
		-border-top: 1px solid #e6e6e6;
		-border-bottom: 1px solid #e6e6e6;
  }
  .weui-cell {											/*---------公共类-------*/
  	padding: 0;
		margin: 0;
		text-indent: 10px;
  	line-height: 40px;
		border: 1px solid #e6e6e6;
		border-bottom: none;
  }
	.weui-cell:before {
		border-top: none;
	}
	.last {
		border-bottom: 1px solid #e6e6e6;
	}
	h4 {
		line-height: 76px;
		background: #f2f2f2;
		font-size: 1em;
		font-weight: normal;
		text-indent: 10px;
	}
	.weui-textarea {
		margin: 0;
		padding: 0;
		border: 0;
		list-style: none;
		resize: none;
		border-left: 0 solid;
		border-right: 0 solid;
	}
	.textarea {
		margin: 0;
		padding: 0;
	}

	/* ====clear float====== */
	.fl {
		float: left;
	}
	.fr {
		float: right;
	}
  .clear {
    zoom:1
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

	.page {
    width: 100%;
    height: 100%;
    position: absolute;
    overflow: hidden;
    left: 0;
    top: 0;
  }
	.scrollWrap{
		width: 100%;
		position: absolute;
		top: 0;
		bottom: 60px;
		overflow: auto;
  }
  .weui-cell {
    padding: 10px;
    line-height: 22px;
  }
  .weui-cells {
    margin: 0;
    font-size: 16px;
    border: none;
    line-height: 0;
  }
  .weui-cell__bd {
    width: 60%;
  }
  .weui-cell__bd p {
    font-size: 14px;
    color: #999999;
  }
  .weui-cell__ft {
    color: #333333;
    margin-right: 10px;
  }
  .injected {
    width: 16px;
    height: 16px;
    display: inline-block;
  }
  .injected img {
    vertical-align: top;
    width: 100%;
    height: 100%;
  }

	.next {
    position: absolute;
    left: 0;
    bottom: 0;
    font-size: 18px;
    line-height: 3.33;
    width: 100%;
		-height: 9%;
    margin: 0;
    border-radius: 0;
  }
  </style>
</head>

<body>
	<article class="page">


	<section class="scrollWrap">
  <div class="page__bd">
    <div class="weui-cells">
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <span>小犬二联苗</span>
          <p>接种日期：2017-08-01</p>
        </div>
        <div class="weui-cell__ft clear">
          <span>已接种</span>
          <div class="injected fr">
            <img src="./img/injected.png" alt="">
          </div>
        </div>
      </div>
    </div>
    <div class="weui-cells">
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <span>滴鼻免疫犬窝咳疫苗</span>
          <p>接种日期：2017-08-01</p>
        </div>
        <div class="weui-cell__ft clear">已接种
          <div class="injected fr">
            <img src="./img/injected.png" alt="">
          </div>
        </div>
      </div>
    </div>
    <div class="weui-cells">
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <span>四联疫苗</span>
          <p>接种日期：2017-08-01</p>
        </div>
        <div class="weui-cell__ft clear">
          <span>已接种</span>
          <div class="injected fr">
            <img src="./img/injected.png" alt="">
          </div>
        </div>
      </div>
    </div>
    <div class="weui-cells">
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <span>五联苗</span>
          <p>接种日期：2017-08-01</p>
        </div>
        <div class="weui-cell__ft clear">
          <span>已接种</span>
          <div class="injected fr">
            <img src="./img/injected.png" alt="">
          </div>
        </div>
      </div>
    </div>
    <div class="weui-cells">
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <span>六联苗</span>
          <p>接种日期：2017-08-01</p>
        </div>
        <div class="weui-cell__ft clear">
          <span>已接种</span>
          <div class="injected fr">
            <img src="./img/injected.png" alt="">
          </div>
        </div>
      </div>
    </div>
    <div class="weui-cells">
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <span>七联苗</span>
          <p>接种日期：2017-08-01</p>
        </div>
        <div class="weui-cell__ft clear">
          <span>已接种</span>
          <div class="injected fr">
            <img src="./img/injected.png" alt="">
          </div>
        </div>
      </div>
    </div>
    <div class="weui-cells">
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <span>狂犬疫苗</span>
          <p>接种日期：2017-08-01</p>
        </div>
        <div class="weui-cell__ft clear">
          <span>已接种</span>
          <div class="injected fr">
            <img src="./img/injected.png" alt="">
          </div>
        </div>
      </div>
    </div>
  </div>
	</section>
	</article>
	<input class="submit next" name="" type="button" value="上传疫苗信息" />
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
