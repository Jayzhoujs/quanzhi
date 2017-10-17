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
	<title>线上举报</title>
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
    list-style: none;
  }

	a,input{ -webkit-tap-highlight-color:rgba(255,0,0,0); }   /* 处理高亮 */

  /* ====clear float====== */
  .fl {
		float: left;
	}
	.fr {
		float: right;
	}
  .clear {
    zoom:1;
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
    font-size: 16px;
    background-color: #E6E6E6;
  }
  .page {
    width: 100%;
    height: 100%;
    position: absolute;
    overflow: hidden;
    left: 0;
    top: 0;
  }

  .header {
    width: 100%;
    background-color: white;
    border-bottom: 1px solid #E6E6E6;
  }
  .header span {
    line-height: 41px;
  }
  span.fl {
    margin-left: 12px;
  }
  span.fr {
    margin-right: 12px;
  }
  .wrap {
    position:absolute;
    top:41px;
    bottom:60px;
    width:100%;
    overflow:auto;
  }
  .report-list {
    width: 93.87%;
    margin: 0 auto;
    background-color: white;
    font-size: 12px;
    line-height: 26px;
    color: #999999;
  }
  .report-list li {
    width: 100%;
    border: 1px solid #E6E6E6;
  }
  .pic_wrap {
    width: 90.91%;
    margin: 8px auto 0;
  }
  img {
    width: 100%;
    vertical-align: top;
  }
  strong {
    font-weight: normal;
  }

  .report-list li p {
    font-size: 14px;
    color: #333333;
  }
  .report-list li p,span,strong {
    margin:0 18px 0 15px;
  }
  .next {
    position: absolute;
    left: 0;
    bottom: 0;
    font-size: 18px;
    line-height: 60px;
    width: 100%;
    margin: 0;
    border-radius: 0;
  }
  </style>
</head>

<body>
  <article class="page">
      <div class="header clear">
        <span class="fl">时间</span>
        <span class="fr">搜索</span>
      </div>
      <section class="wrap">
        <ul class="report-list">
          <li>
            <div class="pic_wrap">
              <img src="./img/report_01.png" alt="">
            </div>
            <p>不文明行为：狗随地大便主人不收拾</p>
            <span>2017-08-01</span><strong>地点：小天路街</strong>
          </li>
          <li>
            <div class="pic_wrap">
              <img src="./img/report_01.png" alt="">
            </div>
            <p>不文明行为：狗随地大便主人不收拾</p>
            <span>2017-08-01</span><strong>地点：小天路街</strong>
          </li>
          <li>
            <div class="pic_wrap">
              <img src="./img/report_01.png" alt="">
            </div>
            <p>不文明行为：狗随地大便主人不收拾</p>
            <span>2017-08-01</span><strong>地点：小天路街</strong>
          </li>
          <li>
            <div class="pic_wrap">
              <img src="./img/report_01.png" alt="">
            </div>
            <p>不文明行为：狗随地大便主人不收拾</p>
            <span>2017-08-01</span><strong>地点：小天路街</strong>
          </li>
        </ul>
      </section>
    	<input class="submit next" name="" type="button" value="我要举报" />
  </article>
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
