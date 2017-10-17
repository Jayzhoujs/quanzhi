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

  .scrollWrap{									/*---------公共类-------*/
		position: relative;
		height: 100%;
		min-height: 480px;
		overflow: auto;
	}
  .report-list {
    width: 100%;
    background-color: white;
    font-size: 12px;
    line-height: 18px;
    color: #999999;
  }
  .report-list li {
    width: 100%;
    border: 1px solid #E6E6E6;
  }
  .pic_wrap {
    width: 24%;
    margin: 10px;
  }
  img {
    width: 100%;
    vertical-align: top;
  }

  .content {
    width: 73%;
  }
  .report-list li h4 {
    -display: inline;
    font-size: 16px;
    line-height: 10px;
    margin-top: 10px;
  }
  .report-list li p {
    font-size: 12px;
    line-height: 18px;
    color: #333333;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
  }
  .report-list li span {
    font-size: 12px;
    line-height: 32px;
  }
  </style>
</head>

<body>
  <section class="scrollWrap">
    <ul class="report-list">
      <li class="clear">
        <div class="pic_wrap fl">
          <img src="./img/dog_life.png" alt="">
        </div>
        <div class="content ">
          <h4>让文明养犬成为一种常态</h4>
          <p>
            规范不文明养犬，一直以来深受社会广泛关注。规范养犬，文明养犬，不仅是改善城市生活环境</p>
          <span>2017-08-01</span>
        </div>
      </li>
      <li class="clear">
        <div class="pic_wrap fl">
          <img src="./img/dog_life.png" alt="">
        </div>
        <h6>让文明养犬成为一种常态</h6>
        <p>
          规范不文明养犬，一直以来深受社会广泛关注。规范养犬，文明养犬，不仅是改善城市生活环境</p>
        <span>2017-08-01</span>
      </li>
      <li class="clear">
        <div class="pic_wrap fl">
          <img src="./img/dog_life.png" alt="">
        </div>
        <h6>让文明养犬成为一种常态</h6>
        <p>
          规范不文明养犬，一直以来深受社会广泛关注。规范养犬，文明养犬，不仅是改善城市生活环境</p>
        <span>2017-08-01</span>
      </li>
      <li class="clear">
        <div class="pic_wrap fl">
          <img src="./img/dog_life.png" alt="">
        </div>
        <h6>让文明养犬成为一种常态</h6>
        <p>
          规范不文明养犬，一直以来深受社会广泛关注。规范养犬，文明养犬，不仅是改善城市生活环境</p>
        <span>2017-08-01</span>
      </li>
      <li class="clear">
        <div class="pic_wrap fl">
          <img src="./img/dog_life.png" alt="">
        </div>
        <h6>让文明养犬成为一种常态</h6>
        <p>
          规范不文明养犬，一直以来深受社会广泛关注。规范养犬，文明养犬，不仅是改善城市生活环境</p>
        <span>2017-08-01</span>
      </li>
      <li class="clear">
        <div class="pic_wrap fl">
          <img src="./img/dog_life.png" alt="">
        </div>
        <h6>让文明养犬成为一种常态</h6>
        <p>
          规范不文明养犬，一直以来深受社会广泛关注。规范养犬，文明养犬，不仅是改善城市生活环境</p>
        <span>2017-08-01</span>
      </li>
      <li class="clear">
        <div class="pic_wrap fl">
          <img src="./img/dog_life.png" alt="">
        </div>
        <h6>让文明养犬成为一种常态</h6>
        <p>
          规范不文明养犬，一直以来深受社会广泛关注。规范养犬，文明养犬，不仅是改善城市生活环境</p>
        <span>2017-08-01</span>
      </li>
    </ul>
  </section>
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
