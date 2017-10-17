<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<% 
String path = request.getContextPath();
		String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+path +"/";	
%>
<base href="<%=basePath%>"></base>
	<title>待审核</title>
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


  .weui-cell {
    padding: 0 15px;
  }
  .weui-cell__hd {
    width: 95px;
  }
  .weui-cell__ft span {
    color: #333;
  }
  .weui-panel__bd {
    border: 1px solid #f2f2f2;
    display:flex;
  }
  .weui-panel__hd {
    font-size: 16px;
    background-color: #f2f2f2;
    color: #333333;
  }
  .weui-media-box_appmsg {
    width: 27.14%;
    height:14.5%;
  }
  .list {
    width: 100%;
    margin:14px 0;
  }
  .icon_s {
    width: 20%;
    position: absolute;
    bottom: 25%;
    right: 6px;
  }
	.box__thumb {
		width:100%;
		padding-right: 8px;
	}
  .next {
    width: 100%;
    margin: 0;
    border-radius: 5px;
  }
  </style>
</head>

<body>
  <div class="weui-cell weui-cell_vcode">
    <div class="weui-cell__hd"><label class="weui-label">关键字搜索</label></div>
    <div class="weui-cell__bd">
      <input class="weui-input" type="text"  id="keyWord" value="" placeholder="请输入犬主姓名或证件号">
    </div>
    <div class="weui-cell__ft">
      <span id="search">查询</span>
    </div>
  </div>

  <div class="weui-panel weui-panel_access">
  <c:forEach items="${list}" var="approval">
  	<div class="weui-panel__bd" id="myDiv">
  		
  	
          <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
            <div class="box__thumb">
              <img class="weui-media-box__thumb" src="${approval.imgUrl}">
            </div>
          </a>
            <div class="weui-media-box__bd">
              <ul class="list">
                <li>犬主姓名：<span>${approval.realName}</span></li>
                <li>证件号码：<span>${approval.IDNum}</span></li>
                <li>犬种：<span>${approval.varieties}</span></li>
                <li>申请日期：<span>${approval.createTime.substring(0,10)}</span></li>
              </ul>
              <div class="icon_s">
                <a href="wx/police/police_approval_index?id=${approval.id}"><input class="submit next" name="" type="button" value="去审核" /></a>
              </div>
            </div>
      </div>
  </c:forEach>
      
      
  </div>
  <script src="./lib/jquery-2.1.4.js"></script>
  <script src="./js/jquery-weui.js"></script>
  <script src="./lib/fastclick.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	  
	  $("#search").on("click",function(){
			var IDNum = $("#keyWord").val();
			var realName = $("#keyWord").val();
			if(!realName) return false;
			$.post("wx/police/police_to_approval_search", {IDNum : IDNum,realName:realName}, function(data) {
				if (data.status!="error") {
					var list = data.list;
					var html="";
					if(list.length==0){
						html+='没有相关数据';
					}
					else{
						for (var i = 0; i < list.length; i++) {
							html+='<a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">'
				            +'<div class="box__thumb">'
				            +'<img class="weui-media-box__thumb" src="'+list[i].imgUrl+'">'
				            +'</div>'
				            +'<div class="weui-media-box__bd">'
				            +'<ul class="list">'
				            +'<li>犬主姓名：<span>'+list[i].realName+'</span></li>'
				            +'<li>证件号码：<span>'+list[i].idnum+'</span></li>'
				            +'<li>犬种：<span>'+list[i].varieties+'</span></li>'
				            +' <li>申请日期：<span>'+list[i].createTime+'</span></li>'
				            +'</ul>'
				            +'<div class="icon_s">'
				            +'<a href="wx/police/police_approval_index?id='+list[i].id+'"><input class="submit next" name="" type="button" value="去审核" /></a>'
				            +'</div>'
				            +'</div>'
				            +' </a>';
						}
					}
					
					$("#myDiv").html(html); 
				}
			});
		});
	</script>
</body>
</html>
