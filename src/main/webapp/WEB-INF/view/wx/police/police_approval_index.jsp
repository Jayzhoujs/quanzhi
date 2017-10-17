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
	.scrollWrap{									/*---------公共类-------*/
		position: relative;
		height: 100%;
		min-height: 480px;
		overflow: auto;
	}
	h3 {							/*  ---------------公共类  */
    text-align: center;
    font-weight: normal;
    font-size: 16px;
    line-height: 56px;
  }

  .weui-cells_form {								/*---------公共类-------*/
    margin: 0 15px;
		font-size: 14px;
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
	.weui-cell__hd {
		width: 43%;
	}
	.weui-label{
		width: 100%;
	}
	.weui-cell_hd  label{
		width: 150px;
	}
	.last {
		border-bottom: 1px solid #e6e6e6;
	}

	.radio label {
		margin-right: 26px;
	}

	h4 {
		line-height: 38px;
		background: #f2f2f2;
		font-size: 14px;
		font-weight: normal;
		text-indent: 10px;
	}

	/*-------- imgup ----------*/			/*---还要改样式---*/
	.file {
		width: 50px;
    	height: 50px;
    	margin-top: 10px;
		margin-right: 10px;
		background: url(./img/up_btn.png) no-repeat;
		background-size: cover;
	}
	.file input {
		display: none;
	}
	.weui-cell .img_preview span {
		line-height: 20px;
		margin-bottom: -10px;
	}
	.img_preview {
		width:78%;
	}
	.s_pic #preview {
		width:63.95%;
		height:180px;
		margin-left: 60px;
		margin-bottom: 10px;
		border:1px solid #E6E6E6;
		overflow:hidden;
	}
	.l_pic #preview {
		width:94.29%;
		height:180px;
		border:1px solid #E6E6E6;
		margin:0 auto 10px;
		overflow:hidden;
	}
	.imghead {
		filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
		width:100%;
		vertical-align:top;
	}

	/* ====clear float====== */
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
	.page {
		display: none;
	}
	.active {
		display: block;
	}
	.lbtn {
		margin-left: 50px;
	}
	.rbtn {
		margin-right: 50px;
	}
  </style>
</head>

<body>
<section class="scrollWrap">
  <h3>个人犬主信息登记</h3>
  <div class="weui-cells weui-cells_form">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="" class="weui-label title">身份证号：</label></div>
      <div class="weui-cell__bd">
        <label for="" class="weui-label">${policeApproval.IDNum}</label>
      </div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="" class="weui-label title">犬主姓名：</label></div>
      <div class="weui-cell__bd">
        <label for="" class="weui-label">${policeApproval.realName}</label>
      </div>
    </div>
    <div class="weui-cell">
    <div class="weui-cell__hd"><label for="" class="weui-label title">犬主性别：</label></div>
     
      <div class="weui-cell__bd">
       <c:choose>
      	<c:when test="${policeApproval.masterGender==0}">
      		<label for="" class="weui-label">男</label>
      	</c:when>
      	<c:when test="${policeApproval.masterGender==1}">
      		<label for="" class="weui-label">女</label>
      	</c:when>
      </c:choose>
        
      </div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="" class="weui-label title">犬主民族：</label></div>
      <div class="weui-cell__bd">
        <label for="" class="weui-label">${policeApproval.nation}</label>
      </div>
    </div>
		<div class="weui-cell last">
      <div class="weui-cell__hd"><label for="" class="weui-label title">联系电话：</label></div>
      <div class="weui-cell__bd">
        <label for="" class="weui-label">${policeApproval.phone}</label>
        
      </div>
    </div>

		<h4>地址：</h4>
		<div class="weui-cell">
			<div class="weui-cell__hd"><label for="name" class="weui-label">所在地区</label></div>
			<div class="weui-cell__bd">
				<label for="" class="weui-label">${policeApproval.area}</label>
			</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__hd">
				<label for="" class="weui-label">街道：</label>
			</div>
			<div class="weui-cell__bd">
				<label for="" class="weui-label">${policeApproval.street}</label>
			</div>
		</div>
    <div class="weui-cells last" style="margin:0;height:75px;font-size:14px;">
      <div class="weui-cell">
         <div class="weui-cell__hd">
				<label for="" class="weui-label">详细地址：</label>
			</div>
			<div class="weui-cell__bd">
				<label for="" class="weui-label">${policeApproval.address}</label>
			</div>
      </div>
    </div>

		
		
  </div>

  <h3>犬只信息登记</h3>
  <div class="weui-cells weui-cells_form">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="" class="weui-label">犬名：</label></div>
      <div class="weui-cell__bd">
        <label for="" class="weui-label">${policeApproval.dogName}</label>
      </div>
    </div>
    <div class="weui-cell weui-cell_select weui-cell_select-after">
      <div class="weui-cell__hd">
        <label for="" class="weui-label">犬种：</label>
      </div>
      <div class="weui-cell__bd">
         <label for="" class="weui-label">${policeApproval.varieties}</label>
      </div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="" class="weui-label">犬性别：</label></div>
      <div class="weui-cell__bd">
       <c:choose>
      	<c:when test="${policeApproval.dogGender==0}">
      		<label for="" class="weui-label">公</label>
      	</c:when>
      	<c:when test="${policeApproval.dogGender==1}">
      		<label for="" class="weui-label">母</label>
      	</c:when>
      </c:choose>
      </div>
      	
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="" class="weui-label" style="width:156px;" >生日：</label></div>          <!-- 样式要改 -->
      <div class="weui-cell__bd">
        <label for="" class="weui-label">${policeApproval.dogBirth}</label>
      </div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="" class="weui-label" style="width:156px;">毛色：</label></div>        <!-- 样式要改 -->
      <div class="weui-cell__bd">
         <label for="" class="weui-label">${policeApproval.color}</label>
      </div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="" class="weui-label" style="width:156px;" >免疫证号：</label></div>          <!-- 样式要改 -->
      <div class="weui-cell__bd">
        <label for="" class="weui-label">${policeApproval.immuneNum}</label>
      </div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="" class="weui-label">是否绝育：</label></div>
      <div class="weui-cell__bd">
      	<c:choose>
      	<c:when test="${policeApproval.isSterilized==1}">
      		<label for="" class="weui-label">是</label>
      	</c:when>
      	<c:when test="${policeApproval.dogGender==0}">
      		<label for="" class="weui-label">否</label>
      	</c:when>
      </c:choose>
       
      </div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label for="" class="weui-label">申请用途：</label></div>
      <div class="weui-cell__bd">
       <c:choose>
      	<c:when test="${policeApproval.uses==0}">
      		<label for="" class="weui-label">观赏</label>
      	</c:when>
      	<c:when test="${policeApproval.uses==1}">
      		<label for="" class="weui-label">扶助</label>
      	</c:when>
      	<c:when test="${policeApproval.uses==2}">
      		<label for="" class="weui-label">导盲</label>
      	</c:when>
      </c:choose>
      </div>
    </div>
    <div class="weui-cell" style="width:100%;">			 							<!-- ——————————————宽度要调 ———————————————————————— -->
      <div class="weui-cell__hd"><label for="" class="weui-label" style="width:100%;">是否属于禁养犬：</label></div>
      <div class="weui-cell__bd">
        <c:choose>
      	<c:when test="${policeApproval.isForbidden==1}">
      		<label for="" class="weui-label">是</label>
      	</c:when>
      	<c:when test="${policeApproval.isForbidden==0}">
      		<label for="" class="weui-label">否</label>
      	</c:when>
      </c:choose>
      </div>
    </div>

    <h4>照片上传：</h4>
    <div class="weui-cell img_uploader last">
  		<div class="weui-cell__bd clear s_pic">
    		<div class="img_preview fl" >
      			<span>请上传狗狗彩色侧面全身照&nbsp;(要求：照片清晰可见犬只的侧身全貌，以及犬只面部)</span>
    		</div>
   			<label class="file fr" id="myLabel">
      			<input id="upBtn_s" type="file" name="imgUrlTemp" value="" accept="image/jpg,image/jpeg,image/png,image/bmp"/>
    		</label>
    		<div id="preview" style="text-indent:0;">
     			<img class="imghead"  border=0 src="${policeApproval.imgUrl}">
    		</div>
  		</div>
	</div>
    
    <div style="height:10px;background-color:#f2f2f2;"></div>			<!--  间隔style要改  -->
   	
   	<div class="weui-cell img_uploader last">
  		<div class="weui-cell__bd clear l_pic">
   			<div class="img_preview fl">
      			<span>请上传有效免疫证明图片（免疫证内页）</span>
    		</div>
    		<label class="file fr">
      			<input id="upBtn_l" type="file" name="immuneUrl" accept="image/jpg,image/jpeg,image/png,image/bmp"/>
    		</label>
    		<div id="preview" style="text-indent:0;">
      			<img class="imghead"  border=0 src="${policeApproval.immuneUrl}">
    		</div>
  		</div>
	</div>
    
  </div>
  
  <a href="wx/police/police_approval_not_index?id=${policeApproval.id}">
  	<input class="submit next lbtn fl" name="" type="button" value="未通过" />
  </a>
 <%--  <a href="wx/police/police_approval?id=${policeApproval.id}">
  	<input class="submit next rbtn fr" name="" type="button" value="通过审核" />
  </a> --%>
  
 		 <form action="wx/police/police_approval" method="post">
    		 <div class="weui-cell">
    		 	<input type="hidden" name="id" value="${policeApproval.id}"/>
    		 	<input type="hidden" name="status" value="1"/>
    		 	<input type="hidden" name="remark" value="审核通过"/>
      		</div>
       		<input class="submit next rbtn fr" name="" type="submit" value="通过审核" />
    	</form>
</section>
  <script src="./lib/jquery-2.1.4.js"></script>
	<script src="./lib/fastclick.js"></script>
  <script src="./js/jquery-weui.js"></script>
	<script>
		$(function() {
			FastClick.attach(document.body);
		});
		
		//建立一個可存取到該file的url
		function getObjectURL(file) {
			var url = null ;
			if (window.createObjectURL!=undefined) { // basic
				url = window.createObjectURL(file) ;
			} else if (window.URL!=undefined) { // mozilla(firefox)
				url = window.URL.createObjectURL(file) ;
			} else if (window.webkitURL!=undefined) { // webkit or chrome
				url = window.webkitURL.createObjectURL(file) ;
			}
			return url ;
		}
		
			$("#upBtn_s").on("change",function(){
				var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
				//console.log(objUrl);
				if (objUrl) {
					$(".imghead:eq(0)").attr("src", "") ;	//先清空src
					$(".imghead:eq(0)").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
					$.ajax({
 						type: "POST",
			 			url: "wx/upload",
				 		data:{"imgSrc":objUrl},
				 		contentType: "application/json; charset=utf-8",
				 		dataType:'json',
						success:function(data){
							//$("upBtn_s").attr("isFinished","t");
				 		},
					 	error:function(er){
					 		//alert(er);
						}
					});
				}
				return false;
			});
		
			$("#upBtn_l").on("change",function(){
				var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
				//console.log(objUrl);
				if (objUrl) {
					$(".imghead:eq(1)").attr("src", "") ;	//先清空src
					$(".imghead:eq(1)").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
					$.ajax({
 						type: "POST",
			 			url: "wx/upload",
				 		data:{"imgSrc":objUrl},
				 		contentType: "application/json; charset=utf-8",
				 		dataType:'json',
						success:function(data){
							//$("upBtn_s").attr("isFinished","t");
				 		},
					 	error:function(er){
					 		//alert(er);
						}
					});
				}
				return false;
			});
	</script>
</body>
</html>
