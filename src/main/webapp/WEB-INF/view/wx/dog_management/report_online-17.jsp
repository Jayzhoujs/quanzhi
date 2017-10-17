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
	.weui-cell__hd {
		width: 43%;
	}
	.weui-label{
		width: 100%;
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
	.img_preview span {
		line-height: 45px;
	}
	.s_pic #preview {
		width:63.95%;
		height:180px;
		margin-left: 86px;
		margin-bottom: 10px;
		border:1px solid #E6E6E6;
		overflow:hidden;
	}
	.l_pic #preview {
		width:94.29%;
		height:180px;
		border:1px solid #E6E6E6;
		margin:0 auto 10px;
	}
	#imghead {
		filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
	}

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

  h4 {
		line-height: 40px;
		font-size: 16px;
		text-indent: 10px;
	}
	.weui-input {
	  width: 92%;
    padding: 5px;
	}
  .weui-cells_form {
    border: none;
    background-color: #f2f2f2;
  }
  .weui-cell {
    border: 1px solid #e6e6e6;
    border-radius: 5px;
    background: #FFFFFF;
    font-size: 16px;
    color: #999999;
  }

  .file {
    margin: 16px 25px;
  }
  .next {
    position: absolute;
    bottom: 0;
    left:35.34%;
  }
  </style>
</head>

<body>
	<form action="">
    <div class="weui-cells weui-cells_form">
      <h4>地点</h4>
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <input class="weui-input" type="text" name="username" value="" placeholder="请输入地点" pattern="^\S+$" maxlength="30" required oninvalid="setCustomValidity('请输入地点');">
        </div>
      </div>

      <h4>不文明行为</h4>
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <input class="weui-input" type="text" name="username" value="" placeholder="请输入不文明行为" pattern="^\S+$" maxlength="50" required oninvalid="setCustomValidity('请输入不文明行为');">
        </div>
      </div>

      <h4>图片</h4>
			<div class="weui-cell img_uploader">
			    <div class="weui-cell__bd clear s_pic">

						<label class="file fl">
							<input id="upbtn" type="file" name="file" accept="image/jpg,image/jpeg,image/png,image/bmp"/>
						</label>
					</div>
			</div>
			
    </div>
    <input class="submit next" name="" type="button" value="发布" />
    </form>
  <script src="./lib/jquery-2.1.4.js"></script>
  <script src="./js/jquery-weui.js"></script>
	<script src="./lib/fastclick.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	  
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
		
			$("#upbtn").on("change",function(){
				var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
				//console.log(objUrl);
				if (objUrl) {
					//$(".imghead").attr("src", "") ;	//先清空src
					//$(".imghead").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
					$.ajax({
						type: "POST",
			 			url: "wx/upload",
				 		data:{"imgSrc":objUrl},
				 		contentType: "application/json; charset=utf-8",
				 		dataType:'json',
						success:function(data){
							$(".file").attr("isFinished","t");
				 		},
					 	error:function(er){
					 		$(".file").attr("isFinished","f");
						}
					});
				}
				return false;
			});
	  
	  $(".submit").click(function(){
			if (!$(".weui-input").eq(0).val()||$(".weui-input").eq(0).val().search(/^\S+$/)==-1) {
				$.toptip('请输入发现地点', 2000,'warning');
				return false;
			}else if (!$(".weui-input").eq(1).val()||$(".weui-input").eq(1).val().search(/^\S+$/)==-1) {
				$.toptip('请填写不文明行为', 2000,'warning');
				return false;
			}else if (!$(".file").attr("isFinished")) {
				$.toptip('请上传狗狗彩色全身照',2000,'warning');
				return false;
			}else {
				$("#hform").submit();
			}
	});
	</script>
	<script src="./js/city-picker.js"></script>
</body>
</html>
