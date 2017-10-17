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
  <link rel="stylesheet" href="./css/sweetAlert/sweet-alert.css">
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


  .scrollWrap{
		position: relative;
		height: 100%;
		min-height: 480px;
		overflow: auto;
	}
  .weui-cells__title {
    margin: 0;
    font-size: 16px;
    color: #333333;
    line-height:55px;
    text-align: center;
  }
  .weui-cell {
    padding:0 15px;
  }
  .weui-cell:before {
    border-top: none;
  }
  .weui-cell__hd {
    width: 95px;
  }
  .weui-cell__ft span {
    color: #333;
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

  .space {
    height: 20px;
  }
  .weui-cells {
    margin: 0 12px;
    border-left: 1px solid #E6E6E6;
    border-right: 1px solid #E6E6E6;
  }
  .weui-cell__hd {
    width: 68px;
  }
  #tempName {
  	width:100%;
  	height:48px;
  	font-size:14px;
  }
  .weui-cell_select .weui-cell__bd:after {
    border-color: transparent;
  }
  </style>
</head>

<body>
  <section class="scrollWrap">
    <div class="weui-cells__title">——&nbsp;&nbsp;成都市宠物防疫服务点&nbsp;&nbsp;——</div>
    <div class="weui-cells">
      <div class="weui-cell">
        <div class="weui-cell__hd">
          <label for="" class="weui-label">名称：</label>
        </div>
        <div class="weui-cell__bd">
          <input type="text" id="tempName" value="" placeholder="">
        </div>
      </div>
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
          <label for="" class="weui-label">地区：</label>
        </div>
        <div class="weui-cell__bd">
          <select class="weui-select" id="tempArea">
          	<c:forEach items="${data.areaList}" var="list">
          		<option value="${list.street}">${list.street}</option>
          	</c:forEach>
          </select>
        </div>
      </div>
    </div>
    <div class="weui-cells__title">
      <input class="submit next" id="mySearch" type="button" value="查询" />
    </div>
    <div class="weui-cells" id="myList">
    <c:forEach items="${data.hospitalList}" var="list">
    	<a class="weui-cell weui-cell_access" href="wx/hospital_detail?id=${list.id}">
        <div class="weui-cell__bd">
          <p>${list.name}</p>
        </div>
        <div class="weui-cell__ft">
        </div>
      </a>
    </c:forEach>
      
      
    </div>
  </section>
  <script src="./lib/jquery-2.1.4.js"></script>
  <script src="./js/jquery-weui.js"></script>
  <script src="./lib/fastclick.js"></script>
   <script src="./js/sweetAeler/sweet-alert.min.js"></script>
   <script src="./js/sweetAeler/sweet-alert.js"></script>
  <script>
    $(function() {
      FastClick.attach(document.body);
    });
    
    $("#mySearch").on("click",function(){
		var name = $("#tempName").val();
		var area = $("#tempArea").val();
		/* if (name=="") {
			swal("Sorry!","请输入关键字！", "info");
			return false;
		} */
		$.post("wx/hospital_search",{name:name,area:area},function(data){
			if(data.status!=="error"){
				var html='';
				var list=data.hospitalList;
				if(list.length==0){
					html=' <p>没有搜到对应数据，换个关键词试试？</p>';
				}
				else{
					for(var i=0;i<list.length;i++){
						html+='<a class="weui-cell weui-cell_access" href="wx/hospital_detail?id='+list[i].id+'">'
				        +'<div class="weui-cell__bd">'
				        +'<p>'+list[i].name+'</p>'
				        +'</div>'
				        +'<div class="weui-cell__ft">'
				        +'</div>'
				     	+' </a>'
					}
				}
				
				$("#myList").html(html);
			}
		});
	});
    
    
  </script>
</body>
</html>
