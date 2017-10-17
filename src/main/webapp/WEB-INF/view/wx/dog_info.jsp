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
  }
  .weui-cell {											/*---------公共类-------*/
  	padding: 0;
		margin: 0;
		text-indent: 10px;
  	line-height: 40px;
		border: 1px solid #e6e6e6;
		border-bottom: none;
  }
	.weui-cell__hd {
		width: 43%;
	}
	.weui-label{
		width: 100%;
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
  </style>
</head>

<body>
  <section class="scrollWrap">
    <h3>犬只信息登记</h3>
     <form action="wx/declare" id="hform" method="post">
    <div class="weui-cells weui-cells_form">

	    <input type="hidden" name="userId" value="${data.userId}">
	    <input type="hidden" name="type" id="tempType" value="${data.type}">
		      <div class="weui-cell">
		        <div class="weui-cell__hd"><label for="" class="weui-label">犬名：</label></div>
		        <div class="weui-cell__bd">
		          <input class="weui-input vali" type="text" name="dogName" value="" maxlength="20" required>
		        </div>
		      </div>
			<div class="weui-cell weui-cell_select-after">
				<div class="weui-cell__hd">
					<label for="" class="weui-label">犬种：</label>
				</div>
				<div class="weui-cell__bd">
					<select class="weui-select multi" name="varieties">
						<option value="">请选择</option>
						<c:forEach items="${data.breedList}" var="breed">
							<option value="${breed.type}">${breed.type}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			 <div class="weui-cell">
		      <div class="weui-cell__hd"><label for="" class="weui-label">犬性别：</label></div>
		      <div class="weui-cell__bd gender">
				  	<label><input name="gender" type="radio" checked value="0"/>&nbsp;&nbsp;公</label>
			      <label><input name="gender" type="radio" value="1"/>&nbsp;&nbsp;母</label>
		      </div>
		    </div>
				<div class="weui-cell">
	        <div class="weui-cell__hd"><label for="birth" class="weui-label">生日：</label></div>
					<div class="weui-cell__bd">
						<input class="weui-input multi" id="birth" type="text" name="dateOfBirth">
	        </div>
	      </div>
	  		<div class="weui-cell  weui-cell_select-after">
	        <div class="weui-cell__hd"><label for="" class="weui-label">毛色：</label></div>        <!-- 样式要改 -->
	        <div class="weui-cell__bd">
						<select class="weui-select multi" name="color">
							<option value="">请选择</option>
							<c:forEach items="${data.colorList}" var="color">
								<option value="${color.color}">${color.color}</option>
							</c:forEach>
						</select>
	        </div>
	      </div>
			<div class="weui-cell">
	        <div class="weui-cell__hd"><label for="" class="weui-label">免疫证号：</label></div>          <!-- 样式要改 -->
	        <div class="weui-cell__bd">
	          <input class="weui-input vali" type="text" name="immuneNum" value="" maxlength="20">
	        </div>
	      </div>
			<div class="weui-cell">
		      <div class="weui-cell__hd"><label for="" class="weui-label">是否绝育：</label></div>
		      <div class="weui-cell__bd">
						<label><input name="isSterilized" checked type="radio" value="1"/>&nbsp;&nbsp;是</label>
			      <label><input name="isSterilized" type="radio" value="0"/>&nbsp;&nbsp;否</label>
		      </div>
		    </div>
			<div class="weui-cell">
				<div class="weui-cell__hd"><label for="" class="weui-label">申请用途：</label></div>
				<div class="weui-cell__bd">
					<label><input name="uses" type="radio" checked value="0" />&nbsp;&nbsp;观赏</label>
					<label><input name="uses" type="radio" value="1" />&nbsp;&nbsp;扶助</label>
					<label><input name="uses" type="radio" value="2" />&nbsp;&nbsp;导盲</label>
				</div>
			</div>
			<div class="weui-cell" style="width:100%;">
		      <div class="weui-cell__hd"><label for="" class="weui-label" style="width:100%;">是否属于禁养犬：</label></div>
		      <div class="weui-cell__bd">
						<label><input name="isForbidden" type="radio" value="1"/>&nbsp;&nbsp;是</label>
			      <label><input name="isForbidden" type="radio" checked value="0"/>&nbsp;&nbsp;否</label>
		      </div>
		    </div>

	      <h4>照片上传：</h4>
				<div class="weui-cell img_uploader last">
				    <div class="weui-cell__bd clear l_pic">
						<div class="img_preview fl" >
							<span>请上传狗狗彩色侧面全身照&nbsp;(要求：照片清晰可见犬只的侧身全貌，以及犬只面部)</span>
						</div>
						<label class="file fr" id="up-div">
							<input id="upBtn_s" type="file" name="imgUrlTemp" value="" accept="image/jpg,image/jpeg,image/png,image/bmp"/>
						</label>
						<div id="preview" style="text-indent:0;">
							<img class="imghead"  border=0 src="">
							<input type="hidden" name="imgUrl" id="imgUrl" value=""/>
						</div>
					</div>
				</div>
				<div style="height:10px;background-color:#f2f2f2;"></div>			<!-- 间隔  -->
				<div class="weui-cell img_uploader last">
					<div class="weui-cell__bd clear l_pic">
						<div class="img_preview fl">
							<span>请上传有效免疫证明图片（免疫证内页）</span>
						</div>
						<label class="file fr" id="up-div2">
							<input id="upBtn_l" type="file" name="immuneUrlTemp" accept="image/jpg,image/jpeg,image/png,image/bmp"/>
						</label>
						<div id="preview" style="text-indent:0;">
							<img class="imghead"  border=0 src="">
							<input type="hidden" name="immuneUrl" id="immuneUrl" value=""/>
						</div>
					</div>
				</div>
				<div style="height:10px;background-color:#f2f2f2;"></div>			<!-- 间隔  -->
				<div class="weui-cell weui-cell_vcode" style="text-indent:0;padding:0 8px">
    				<div class="weui-cell__hd" ><label class="weui-label">搜索派出所网点：</label></div>
    				<div class="weui-cell__bd">
      					<input class="weui-input" type="text" id="branchName" value="" placeholder="请输入地区">
    				</div>
    				<div id="search" class="weui-cell__ft" style="font-size:14px; color:#333;">
      					<span>搜索</span>
    				</div>
  				</div>
  				<div class="weui-cell  weui-cell_select-after last" style="text-indent:0;padding:0 8px">
	        		<div class="weui-cell__hd"><label for="" class="weui-label">请选择办理网点：</label></div>
	        		<div class="weui-cell__bd">
						<select class="weui-select multi" name="branchId" id="branchList">
							<option value="">请选择</option>
						</select>
	       			 </div>
	      		</div>
		     	 
					<input class="submit next" name="" type="button" value="下一步" />
					</div>
			</form>
  </section>
  <script src="./lib/jquery-2.1.4.js"></script>
  <script src="./js/jquery-weui.js"></script>
	<script src="./lib/fastclick.js"></script>
	<script src="./js/dog_e/ajaxfileupload.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });

		$("#birth").calendar({
			onChange: function (p, values, displayValues) {
				console.log(values, displayValues);
				$(this).attr("isFinished","t");
			}
		});
		
	
		
		
		
			
	</script>
	<script>
		//验证
		$(".submit").click(function(){
			
				if (!$(".multi").eq(0).val()) {
					$.toptip('请选择犬种信息', 2000,'warning');
					return false;
				}
				else if (!$(".vali:eq(0)").val()||$(".vali:eq(0)").val().search(/^\S*$/g)==-1){
				     $.toptip('请填写犬名', 2000,'warning');
				     return false;
				}
				else if (!$(".multi").eq(1).val()) {
					$.toptip('请填写生日信息', 2000,'warning');
					return false;
				}else if (!$(".multi").eq(2).val()) {
					$.toptip('请选择毛色信息', 2000,'warning');
					return false;
				}else if (!$(".vali:eq(1)").val()||$(".vali:eq(1)").val().search(/^[a-zA-z0-9]+$/)==-1){
					$.toptip('请填写免疫证号',2000,'warning');
					return false;
				}else if (!$("#imgUrl").attr("isFinished")) {
					$.toptip('请上传狗狗彩色全身照',2000,'warning');
					return false;
				}else if (!$("#immuneUrl").attr("isFinished")) {
					$.toptip('请上传免疫证明照片',2000,'warning');
					return false;
				}else if (!$("#branchList").val()){
					$.toptip('请搜索并选择办理网点',2000,'warning');
					return false;
				}else {
					$("#hform").submit();
				}
		});
		
		$("#search").on("click",function(){
			var keyWord = $("#branchName").val();
			//console.log($("#branchName").val());
			if(!keyWord){
				$.toptip('请先输入地区再搜索',2000,'warning');
				return false;
			}
			var type=$("#tempType").val();
			//type="1";测试数据
			$.post("wx/branch_search", {type:type,keyWord:keyWord}, function(data) {
				if (data.status!="error") {
					var list = data.branchList;
					var html="";
					if(list.length==0){
						html+='没有相关派出所网点';
					}
					else{
						for (var i = 0; i < list.length; i++) {
							html+='<option value="'+list[i].id+'">'+list[i].name+'</option>';
						}
					}
					$("#branchList").html(html); 
				}
			});
		});
		
		//上传文件
		
		
		
		$("#up-div").delegate("#upBtn_s","change",function(){
		    $.ajaxFileUpload({
		              url:"wx/upload",
		              fileElementId: "upBtn_s",
		              dataType: "string",
		              success: function(data) {
		              if(data){
		                //图片路径
		             	$(".imghead:eq(0)").attr("src", data) ; 
	                	$("#imgUrl").val(data);
	                	$("#imgUrl").attr("isFinished","t");
		              }
		              else{
		                $.toptip('图片上传失败',2000,'warning');
		              }
		              $('#upBtn_s').replaceWith('<input id="upBtn_s" type="file" name="imgUrlTemp" value="" accept="image/jpg,image/jpeg,image/png,image/bmp"/>');
		    }
		   });
		  });
			
			$("#up-div2").delegate("#upBtn_l","change",function(){
			    $.ajaxFileUpload({
			              url:"wx/upload",
			              fileElementId: "upBtn_l",
			              dataType: "string",
			              success: function(data) {
			              if(data){
			                //图片路径
			             	$(".imghead:eq(1)").attr("src", data) ; 
		                	$("#immuneUrl").val(data);
		                	$("#immuneUrl").attr("isFinished","t");
			              }
			              else{
			                $.toptip('图片上传失败',2000,'warning');
			              }
			              $('#upBtn_l').replaceWith('<input id="upBtn_l" type="file" name="immuneUrlTemp" value="" accept="image/jpg,image/jpeg,image/png,image/bmp"/>');
			    }
			   });
			  });
		
		
		
	</script>
</body>
</html>
