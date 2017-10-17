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
<title>个人犬主信息登记</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
  <link rel="stylesheet" href="./lib/weui.min.css">
  <link rel="stylesheet" href="./css/jquery-weui.css">
  <script type="text/javascript" src="./js/jquery.min.js"></script>
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
		line-height: 76px;
		background: #f2f2f2;
		font-size: 1em;
		font-weight: normal;
		text-indent: 10px;
	}

	/*-------- imgup ----------*/
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
  </style>
</head>

<body>
<section class="scrollWrap">
  <h3>个人犬主信息登记</h3>
  <div class="weui-cells weui-cells_form">
  	<form action="wx/user_info_upload" id="hform" method="post">
  	<input type="hidden" name="userId" value="${data.user.userId}">
		<div class="weui-cell">
			<div class="weui-cell__hd"><label for="" class="weui-label">犬主类型：</label></div>
			<div class="weui-cell__bd radio type">
				<label><input name="type" type="radio" checked value="0"/>&nbsp;&nbsp;个人</label>
				<label><input name="type" type="radio" value="1"/>&nbsp;&nbsp;单位</label>
			</div>
		</div>
		<div style="height:10px;background-color:#f2f2f2;"></div>
		<div class="page active">
			<div class="weui-cell">
	      <div class="weui-cell__hd"><label for="" class="weui-label title">身份证号：</label></div>
	      <div class="weui-cell__bd">
	        <label for="" class="weui-label">${data.user.idcardNum}</label>
	        <!--<input class="weui-input" type="number" pattern="[0-9]*" value="weui input error" placeholder="请输入卡号">-->
	      </div>
	    </div>
	    <div class="weui-cell">
	      <div class="weui-cell__hd"><label for="" class="weui-label title">犬主姓名：</label></div>
	      <div class="weui-cell__bd">

	        <label for="" class="weui-label">${data.user.realName}</label>
	      </div>
	    </div>
	    <div class="weui-cell">
	      <div class="weui-cell__hd"><label for="" class="weui-label title">犬主性别：</label></div>
	      <div class="weui-cell__bd radio">

				<c:choose>
					<c:when test="${data.user.gender==0}">
						<label for="" class="weui-label">男</label>
	         		</c:when>
	         		<c:when test="${data.user.gender==1}">
	      				<label for="" class="weui-label">女</label>
	         		</c:when>
				</c:choose>
	      </div>
	    </div>
	    <div class="weui-cell">
	      <div class="weui-cell__hd"><label for="" class="weui-label title">犬主民族：</label></div>
	      <div class="weui-cell__bd">
	        <label for="" class="weui-label">${data.user.nation}</label>
	      </div>
	    </div>
			<div class="weui-cell last">
	      <div class="weui-cell__hd"><label for="" class="weui-label title">联系电话：</label></div>
	      <div class="weui-cell__bd">
	        <input class="weui-input vali" type="number" name="phoneNum" value="${data.user.phoneNum}" maxlength="11">
	      </div>
	    </div>
		</div>

		<div class="page">
			<div class="weui-cell">
        <div class="weui-cell__hd"><label for="" class="weui-label">单位名称：</label></div>
        <div class="weui-cell__bd">
          <input class="weui-input vali" type="text" name="companyName" value="" maxlength="50">
        </div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__hd"><label for="" class="weui-label">法人身份证号码：</label></div>        <!-- 样式要改 -->
        <div class="weui-cell__bd">
			<label for="" class="weui-label">${data.user.idcardNum}</label>
        </div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__hd"><label for="" class="weui-label">法人姓名：</label></div>
        <div class="weui-cell__bd">
          <label for="" class="weui-label">${data.user.realName}</label>
        </div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__hd"><label for="" class="weui-label" >责任人姓名：</label></div>          <!-- 样式要改 -->
        <div class="weui-cell__bd">
          <input class="weui-input vali" type="text" name="contactName" value="" maxlength="10">
        </div>
      </div>
  		<div class="weui-cell">
        <div class="weui-cell__hd"><label for="" class="weui-label">责任人联系电话：</label></div>        <!-- 样式要改 -->
        <div class="weui-cell__bd">
          <input class="weui-input vali" type="text" name="contactPhone" value="" maxlength="11">
        </div>
      </div>
		</div>

		<h4>地址：</h4>
		<!-- <div class="weui-cell weui-cell_select weui-cell_select-after">
			<div class="weui-cell__hd"><label for="name" class="weui-label">所在地区</label></div>
			<div class="weui-cell__bd">
				<input class="weui-input" id="start"  name="area" type="text" value="四川省 成都市 高新区">

			</div>
		</div> -->
		<div class="weui-cell weui-cell_select weui-cell_select-after">
			<div class="weui-cell__hd">
				<label for="" class="weui-label">所在区域：</label>
			</div>
			<div class="weui-cell__bd">
				<select class="weui-select multi" name="area" id="area" placeholder="请选择">
					<option class="selectArea" value>请选择</option>
					<c:forEach items="${data.areaList}" var="area">
						<option id="${area.id}" value="${area.id}">${area.street}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="weui-cell weui-cell_select weui-cell_select-after">
			<div class="weui-cell__hd">
				<label for="" class="weui-label">街道：</label>
			</div>
			<div class="weui-cell__bd">
				<select class="weui-select" name="street" id="street" placeholder="请选择">
					<option value>请选择</option>
				</select>
			</div>
		</div>
    <div class="weui-cells" style="margin:0;height:75px;font-size:14px;">
      <div class="weui-cell">
          <textarea class="weui-textarea vali" name="address" minlength="2" placeholder="请填写详细地址，不少于5字" rows="3" style="text-indent:10px;"></textarea>
      </div>
    </div>

	<!-- 	<h4>照片上传：</h4>
		<div class="weui-cell img_uploader">
			<div class="weui-cell__bd clear s_pic">
				<div class="img_preview fl">
					<span>犬主照片&nbsp;(要求：正面免冠彩色，确保清晰)</span>
					<div id="preview">
							<img id="imghead"  border=0 src="">
					</div>
				</div>
				<label class="file fr">
					<input type="file"  accept="image/jpg,image/jpeg,image/png,image/bmp" />
				</label>
			</div>
		</div> -->

		<input class="submit next" name="" type="button" value="下一步" />
		</form>
  </div>


</section>
  <script src="./lib/jquery-2.1.4.js"></script>
	<script src="./lib/fastclick.js"></script>
  <script src="./js/jquery-weui.js"></script>
	<script>
		$(function() {
			FastClick.attach(document.body);
		});

		//选项卡
		var input=$(".type").children();
		var div= $(".page");
		input[0].onclick=function(){
			for (var i = 0; i < div.length; i++) {
				div[i].className='page';
			}
			div[0].className='page active';
		};
		input[1].onclick=function(){
			for (var i = 0; i < div.length; i++) {
				div[i].className='page';
			}
			div[1].className='page active';
		}

		//验证
		$(".submit").click(function(){
			if($(".type").val()==0){
				if(!$(".vali:eq(0)").val()||$(".vali:eq(0)").val().search(/^1[34578]\d{9}$/)==-1){
					$.toptip('请输入电话号码', 2000,'warning');
					return false;
				}else if (!$("#area").val()){
					$.toptip('请选择所在区域', 2000,'warning');
					return false;
				}else if (!$("#street").val()){
					$.toptip('请选择所在街道', 2000,'warning');
					return false;
				}else if (!$(".vali:eq(4)").val()||$(".vali:eq(4)").val().search(/^[\u4E00-\u9FA5]{1,}[\u4E00-\u9FA5a-z0-9A-Z]{1,}$/)==-1){
					$.toptip('请填写详细地址', 2000,'warning');
					return false;
				}else{
					$("#hform").submit();
				}
			}else{
				if(!$(".vali:eq(1)").val()||$(".vali:eq(1)").val().search(/^(([\u4e00-\u9fff]{2,20})|([a-z\.\s\,\(\)（）]{2,20}))$/i)==-1){
					$.toptip('请输入单位名称', 2000,'warning');
					return false;
				}else if (!$(".vali:eq(2)").val()||$(".vali:eq(2)").val().search(/^[\u4E00-\u9FA5]{2,4}$/)==-1){
					$.toptip('姓名错误，请重新填写', 2000,'warning');
					return false;
				}else if (!$(".vali:eq(3)").val()||$(".vali:eq(3)").val().search(/^1[34578]\d{9}$/)==-1){
					$.toptip('请填写电话号码', 2000,'warning');
					return false;
				}else if (!$("#area").val()){
					$.toptip('请选择所在区域', 2000,'warning');
					return false;
				}else if (!$("#street").val()){
					$.toptip('请选择所在街道', 2000,'warning');
					return false;
				}else if (!$(".vali:eq(4)").val()||$(".vali:eq(4)").val().search(/^[\u4E00-\u9FA5]{1,}[\u4E00-\u9FA5a-z0-9A-Z]{1,}$/)==-1){
					$.toptip('请填写详细地址', 2000,'warning');
					return false;
				}else{
					$("#hform").submit();
				}
			}
		});

		$("#area").change(function(){
			$(".selectArea").remove();
			var id = $(this).children('option:selected')[0].id;
			if(id ==""){
				$("#street").html("<option>暂无街道</option>");
				return false;
			}
			$.ajax({
				type : "post",
				url : "wx/street",
				data : "parentId=" + id,
				async : false,
				success : function(data){
					var list = data.streetList;
						var html="";
						for (var i = 0; i < list.length; i++) {
							html+="<option value='"+list[i].id+"'>"+list[i].street+"</option>";
						}
						$("#street").html(html);
				},
				error: function(data) {
					swal("Sorry!","查询失败","error");
				}
			});
		});
	</script>
</body>
</html>
