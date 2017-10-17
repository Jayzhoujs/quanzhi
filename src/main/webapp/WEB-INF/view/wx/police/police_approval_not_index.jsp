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
	<title>查询犬证</title>
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
    background-color: #f2f2f2;
    border-top: 1px solid #e6e6e6;
    border-bottom: 1px solid #e6e6e6;
		font-size: 14px;
    line-height: 48px;
		text-indent: 22px;
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


  .weui-cells_form,.weui-cell {
    -background-color: white;
    border: none;
    -text-indent: 10px;
  }
  .weui-cells_form {
    height: 76.01%;
    background:#f2f2f2;
  }
  .weui-cell:before {
    border: none;
  }
  .weui-cells:after {
    border: none;
  }
  .weui-cell__hd label {
    width: 110px;
  }
  .weui-cells__title {
    color: #333;
    text-indent: 8px;
  }
  .weui-textarea {
    width: 93.6%;
    margin: 0 auto;
    border: 1px solid #e6e6e6;
    font-size: 14px;
    text-indent: 10px;
  }
  textarea::-webkit-input-placeholder{
    font-size: 12px;
    color: #999;
  }
  textarea:-moz-placeholder{
    font-size: 12px;
    color: #999;
  }
  textarea::-moz-placeholder{
    font-size: 12px;
    color: #999;
  }
  textarea:-ms-input-placeholder{
    font-size: 12px;
    color: #999;
  }
  .next {
    position: absolute;
    bottom: 0;
    left:35.34%;
  }
  </style>
</head>

<body>
    <div class="weui-cells__title">未通过原因</div>
    <div class="weui-cells weui-cells_form">
    	<form action="wx/police/police_approval" method="post" id="hform">
    		 <div class="weui-cell">
    		 	<input type="hidden" name="id" value="${data.approvalId}"/>
    		 	<input type="hidden" name="status" value="2"/>
		        <div class="weui-cell__bd">
		          <textarea class="weui-textarea" name="remark" placeholder="请输入未通过原因" rows="3"  ></textarea>
		        </div>
		       
      		</div>
       		<input class="submit next" name="" id="mySubmit" type="submit" value="提交" />
    	</form>
     
    </div>
    


  <script src="./lib/jquery-2.1.4.js"></script>
  <script src="./js/jquery-weui.js">
	</script><script src="./lib/fastclick.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	  
<<<<<<< HEAD
	  $(".submit").click(function(){
		  if (!$(".weui-textarea").val()||$(".weui-textarea").val().search(/^\S+$/)==-1) {
=======
	 /*  $("#mySubmit").click()(function(){
		  if (!$(".weui-textarea").val()) {
>>>>>>> branch 'master' of git@192.168.0.192:/home/gitrepo/zttr.git
		        $.toptip('请输入未通过原因',2000,'warning');
		        return false;
		      }else {
		       $("#hform").submit();
		      } 
	  }) */
	</script>
</body>
</html>
