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
	<title>养犬管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	  <meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
		<link rel="stylesheet" href="./lib/weui.min.css">
		<link rel="stylesheet" href="./css/jquery-weui.css">
		<style>
		a, img {
			-webkit-touch-callout:none;  /* 禁止长按链接与图片弹出菜单 */
	 }
	 html, body {
			-webkit-user-select:none;   /* 禁止选中文本（如无文本选中需求，此为必选项） */
			user-select:none;
			-webkit-text-size-adjust:100%;		/*  文本大小根据设备尺寸进行调整  */
			-ms-text-size-adjust:100%;
	 }
    html, body {
    		margin: 0;
				padding: 0;
				-webkit-tap-highlight-color: transparent;
        -position: relative;
    }
    body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color:#333333;
				background-color: #F2F2F2;
    }
		img {
			width: 100%;
			border:none;
			vertical-align:top;
		}
		.scrollWrap{
			position: relative;
			height: 100%;
			min-height: 480px;
			overflow: auto;
		}
		.weui-flex,.weui-flex {
			border-top: 1px solid #e5e4e2;
			border-bottom: 1px solid #e5e4e2;
		}
    .swiper-container {
        height: 26.23%;
    }
		.swiper-pagination-bullet {
			width: 7px;
			height: 7px;
			margin: 0 8px;
			background-color: #ffffff;
		}
		.swiper-pagination-bullet-active{
			background-color: #F2F2F2;
		}

		.weui-flex {
			height: 30%;
			background-color: white;
		}
		.weui-flex a {
		 	text-align: center;
			display: block;
		}
		.icon {
			padding-top: 32%;
			padding-bottom: 7.47%;
		}
		.icon img {			/*   没量   */
			width: 60%;
		}
		.text {
			padding-bottom: 30.9%;
			text-align: center;
			color: #333333;
			font-size: 14px;
			font-family: Arial;
			line-height: 200%;
		}

		.billboard {
			height: 6%;
			font-size: 16px;
			font-weight: normal;
			color: #333333;
			text-indent: .75em;
			line-height: 250%;
		}

		.notice {
			height: 7.5%;
		}
		.notice img {
			width: 9.07%;
		}
		.billboard_item_left {
			float: left;
			padding:16px 0 16px 12px;
		}
		.billboard_item_right{
			float: left;
			font-size: 1em;
			font-weight: normal;
			color: #333333;
			text-indent: 1.4285em;
			line-height: 350%;
		}

		.weui-cells {
			width:100%;
			margin: 0;
		}
		.weui-cells a {
			width:100%;
			padding: 0;
		}
		.weui-cell__bd {
			width:63.43%;
			font-size: 14px;
			color: #333333;
			line-height: 157.14%;
			padding:11px 0 7px 12px;
			height:42px;
		}
		.weui-cell__bd p {
			width:100%;
			min-width:200px;
			height:21px;
			overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
		}
		.weui-cell__ft {
			font-size: 14px;
			color: #999999;
			padding-top: 27px;
			line-height: 18px;
		}
		.weui-cell_access .weui-cell__ft:after {
			border: none;
		}
    </style>
</head>


<body>
	<section class="scrollWrap">	<!--自适应滚动条-->
		<div class="swiper-container" style="max-height:200px;">
        <div class="swiper-wrapper">
            <c:forEach items="${data.adList}" var="ad">
	            <div class="swiper-slide">
	            	<a href="${ad.url}"><img src="${ad.imgUrl}" alt=""></a>
	            </div>
            </c:forEach>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>

		<div class="weui-flex">
		  <div class="weui-flex__item">
				<a href="wx/guide" class="">
			    <div class="icon">
			      <img src="./img/index_icon_01.png" alt="">
			    </div>
			    <p class="text">
						在线办理
			    </p>
			  </a>
			</div>
			<div class="weui-flex__item">
				<a href="wx/progress_index" class="">
			    <div class="icon">
			      <img src="./img/index_icon_02.png" alt="">
			    </div>
			    <p class="text">
						进度查询
			    </p>
			  </a>
			</div>
			<!-- <div class="weui-flex__item">
				<a href="#" class="">
			    <div class="icon">
			      <img src="./img/index_icon_03.png" alt="">
			    </div>
			    <p class="text">
						犬类免疫
			    </p>
			  </a>
			</div> -->
			<div class="weui-flex__item">
				<a href="wx/hospital_index" class="">
			    <div class="icon">
			      <img src="./img/index_icon_03.png" alt="">
			    </div>
			    <p class="text">
						防疫服务
			    </p>
			  </a>
			</div>
		</div>

		<h3 class="billboard">公告</h3>
		<div class="weui-flex notice">
		  <div class="weui-flex__item left">
		  	<a href="wx/regulation">
		  	<img class="billboard_item_left" src="./img/index_icon_05.png" alt="">
				<p class="billboard_item_right">管理条例</p>
			</a>
		  </div>
		  <div class="weui-flex__item right">
		  	<a href="wx/dog_forbidden">
				<img class="billboard_item_left" src="./img/index_icon_06.png" alt="">
				<p class="billboard_item_right">禁养品种</p>
			</div>
			</a>
		</div>

		<h3 class="billboard">犬管动态</h3>
		<div class="weui-cells">
			 <c:forEach items="${data.newList}" var="news">
			 	<c:choose>
			 		<c:when test="${news.type==0}">
			 			<a class="weui-cell weui-cell_access" href="wx/news_detail?id=${news.id}">
			   			 <div class="weui-cell__bd">
			     			 <p>${news.title}</p><p>${news.abstracts}</p>
			   			 </div>
			    			<div class="weui-cell__ft">${news.createTime.substring(0,10)}</div>
			  			</a>
			 		</c:when>
			 		
			 		<c:when test="${news.type==1}">
			 			<a class="weui-cell weui-cell_access" href="${news.content}">
			   			 <div class="weui-cell__bd">
			     			 <p>${news.title}</p><p>${news.abstracts}</p>
			   			 </div>
			    			<div class="weui-cell__ft">${news.createTime.substring(0,10)}</div>
			  			</a>
			 		</c:when>
			 	</c:choose>
			  </c:forEach>

		</div>

	</section>
		<script src="./lib/jquery-2.1.4.js"></script>
		<script src="./lib/fastclick.js"></script>

		<script>
  		$(function() {
    		FastClick.attach(document.body);
  		});
		</script>

		<script src="./js/jquery-weui.js"></script>

    <script src="./js/swiper.js"></script>

    <script>
      $(".swiper-container").swiper({
        loop: true,
        autoplay: 3000
      });
    </script>
</body>
</html>
