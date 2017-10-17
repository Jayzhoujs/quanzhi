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
    padding: 0 12px;
    font-size: 14px;
    text-indent: 2em;
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
    <h3>公安分局治安署开展犬只宣传整治工作</h3>
    <div class="topic">
      <span>2017-08-01</span>
      <em>蓉e犬</em>
    </div>
    <div class="pic">
      <img src="./img/news_1.png" alt="">
    </div>
    <div class="content">
      <p>“美化家园、从我做起”，为进一步规范社区居民群众依法养犬、文明养犬，提高居民群众的文明素养，营造整洁有序、安全和谐的浓厚氛围，近期，派出所民警，在社区开展一系列文明养犬宣传工作，以更好的推进小区和谐社会建设。</p>
      <p>社区在各楼栋布置文明养犬的宣传漫画，工作人员在小区内宣传栏里张贴《城市养犬管理条例》。活动现场摆放文明养犬的宣传展板，并为大家发放《文明养犬倡议书》200余份，凡是签了倡议书的居民，社区都赠送了一双手工坊的志愿者做的环保袖套做为奖励。</p>
      <p>派出所民警向群众讲解如何办理狗证等知识，同时还与现场群众进行了文明养犬互动交流，征集群众意见和建议10余条，不少群众提出了诸如“养狗人互相监督、建立宠物联盟”等良好建议。</p>
      <p>希望社区居民以主人翁的姿态积极参与到社区环境卫生管理中来，在给予动物科学养护的同时，注意维护好社区的卫生秩序和邻里之间的和谐关系。</p>
      <p>文明养犬的宣传是一个长期的过程，希望通过我们的努力，给社区居民一个良好的居住环境，避免及减少养犬人与非养犬人之间的矛盾。通过此次活动，不仅使居民认识到了依法、文明、科学养犬的重要性，也增强了爱护家园、美化环境从我做起的意识。</p>
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
