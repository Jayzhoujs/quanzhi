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
	<title>犬只信息登记</title>
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
  </style>
</head>

<body>
  <section class="scrollWrap">
    <h3>犬只信息登记</h3>
    <div class="weui-cells weui-cells_form">
      <div class="weui-cell">
        <div class="weui-cell__hd"><label for="" class="weui-label">犬名：</label></div>
        <div class="weui-cell__bd">
          <input class="weui-input" type="text" name="username" value="" >
          <!--<input class="weui-input" type="number" pattern="[0-9]*" value="weui input error" placeholder="请输入卡号">-->
        </div>
      </div>
			<div class="weui-cell weui-cell_select weui-cell_select-after">
				<div class="weui-cell__hd">
					<label for="" class="weui-label">犬种：</label>
				</div>
				<div class="weui-cell__bd">
					<select class="weui-select" name="select2" placeholder="请选择">
						<option value="1">犬1</option>
						<option value="2">犬2</option>
						<option value="3">犬3</option>
					</select>
				</div>
			</div>
			<div class="weui-cell">
	      <div class="weui-cell__hd"><label for="" class="weui-label">犬性别：</label></div>
	      <div class="weui-cell__bd gender">
					<label><input name="username" type="radio" value=""/>&nbsp;&nbsp;公</label>
		      <label><input name="username" type="radio" value=""/>&nbsp;&nbsp;母</label>
	      </div>
	    </div>
      <div class="weui-cell">
        <div class="weui-cell__hd"><label for="" class="weui-label">生日：</label></div>          <!-- 样式要改 -->
        <div class="weui-cell__bd">
          <input class="weui-input" type="text" name="username" value="" >
        </div>
      </div>
  		<div class="weui-cell">
        <div class="weui-cell__hd"><label for="" class="weui-label">毛色：</label></div>        <!-- 样式要改 -->
        <div class="weui-cell__bd">
					<select class="weui-select" name="select2" placeholder="请选择">
						<option value="1">毛色1</option>
						<option value="2">毛色2</option>
						<option value="3">毛色3</option>
					</select>
        </div>
      </div>
			<div class="weui-cell">
        <div class="weui-cell__hd"><label for="" class="weui-label">免疫证号：</label></div>          <!-- 样式要改 -->
        <div class="weui-cell__bd">
          <input class="weui-input" type="text" name="username" value="" >
        </div>
      </div>
			<div class="weui-cell">
	      <div class="weui-cell__hd"><label for="" class="weui-label">是否绝育：</label></div>
	      <div class="weui-cell__bd">
					<label><input name="username" type="radio" value=""/>&nbsp;&nbsp;是</label>
		      <label><input name="username" type="radio" value=""/>&nbsp;&nbsp;否</label>
	      </div>
	    </div>
			<div class="weui-cell">
				<div class="weui-cell__hd"><label for="" class="weui-label">申请用途：</label></div>
				<div class="weui-cell__bd">
					<label><input name="username" type="radio" value="" />&nbsp;&nbsp;观赏</label>
					<label><input name="username" type="radio" value="" />&nbsp;&nbsp;扶助</label>
					<label><input name="username" type="radio" value="" />&nbsp;&nbsp;导盲</label>
				</div>
			</div>
			<div class="weui-cell" style="width:100%;">			 							<!-- ——————————————宽度要调 ———————————————————————— -->
	      <div class="weui-cell__hd"><label for="" class="weui-label" style="width:100%;">是否属于禁养犬：</label></div>
	      <div class="weui-cell__bd">
					<label><input name="username" type="radio" value=""/>&nbsp;&nbsp;是</label>
		      <label><input name="username" type="radio" value=""/>&nbsp;&nbsp;否</label>
	      </div>
	    </div>

      <h4>照片上传：</h4>
			<div class="weui-cell img_uploader last">
			    <div class="weui-cell__bd clear s_pic">
						<div class="img_preview fl">
							<span>法人照片&nbsp;(要求：正面免冠彩色，确保清晰)</span>
							<div id="preview">
							    <img id="imghead"  border=0 src="">
							</div>
						</div>
						<label class="file fr">
							<input type="file" name="file" accept="image/jpg,image/jpeg,image/png,image/bmp"/>
						</label>
					</div>
			</div>
			<div style="height:10px;background-color:#f2f2f2;"></div>			<!--  间隔style要改  -->
			<div class="weui-cell img_uploader last">
					<div class="weui-cell__bd clear l_pic">
						<div class="img_preview" style="padding-bottom:30px;">
							<span>身份证照片</span>
							<label class="file fr">
								<input type="file" name="file" accept="image/jpg,image/jpeg,image/png,image/bmp"/>
							</label>
						</div>
						<div id="preview">
								<img id="imghead"  border=0 src="">
						</div>
					</div>
			</div>
			<div style="height:10px;background-color:#f2f2f2;"></div>
			<div class="weui-cell">			<!-- 样式要改 style="width:156px;"-->
				<div class="weui-cell__hd"><label for="name" class="weui-label" style="">办理地点：</label></div>
	      <div class="weui-cell__bd">
	        <input class="weui-input" id="start" type="text" value="四川省 成都市 高新区">
	      </div>
			</div>
    </div>

    <input class="submit next" name="" type="button" value="下一步" />
  </section>
  <script src="./lib/jquery-2.1.4.js"></script>
  <script src="./js/jquery-weui.js"></script>
	<script src="./lib/fastclick.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	</script>
	<script src="./js/city-picker.js"></script>
	<script type="text/javascript">
	$("#start").cityPicker({
		title: "请选择地址",
		onChange: function (picker, values, displayValues) {
			//console.log(values, displayValues);
		}
	});
	</script>
</body>
</html>
