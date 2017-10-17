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
    width: 100%;
  }
  .icon_s {
    width: 56px;
    position: absolute;
    bottom: 10px;
    right: 12px;
  }
  .icon_s img {
    width: 28px;
		margin: 0 auto;
		display: block;
		vertical-align: top;
  }
  .icon_s strong {
    font-weight: normal;
  }
	.box__thumb {
		width: 26.67%;
		padding-right: 8px;
	}
  </style>
</head>

<body>
  <div class="weui-cell weui-cell_vcode">
    <div class="weui-cell__hd"><label class="weui-label">关键字搜索</label></div>
    		<div class="weui-cell__bd">
	     	 <input class="weui-input" type="text" id="keyWord" value="" placeholder="请输入犬主姓名或证件号">
	    	</div>
	   		 <div class="weui-cell__ft">
      			<span id="search">查询</span>
    		</div>
	    
  </div>

  <div class="weui-panel weui-panel_access">
      <div class="weui-panel__bd" id="myDiv">
          
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
	<script>
	$("#search").on("click",function(){
		var IDNum = $("#keyWord").val();
		var realName = $("#keyWord").val();
		if(!realName) return false;
		$.post("wx/police/police_to_approvaled_search", {IDNum : IDNum,realName:realName}, function(data) {
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
			            +' <img class="weui-media-box__thumb" src="'+list[i].imgUrl+'">'
			            +' </div>'
			            +'<div class="weui-media-box__bd">'
			            +' <ul class="list">'
			            +' <li>证件号码：<span>'+list[i].idnum+'</span></li>'
			            +' <li>犬主姓名：<span>'+list[i].realName+'</span></li>'
			            +' <li>犬种：<span>'+list[i].varieties+'</span></li>'
			            +'<li>申请日期：<span>'+list[i].createTime+'</span></li>'
			            +'</ul>'
			            +' <div class="icon_s">';
			            if(list[i].status=='1'){
			            	html+=' <img src="./img/pc_get.png" alt="">'
				            +'<strong>审核通过</strong>';
			            }
			            else{
			            	html+=' <img src="./img/icon_08.png" alt="">'
					            +'<strong>未通过</strong>';
			            }
			            html+='</div>'
			            +' </div>'
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
