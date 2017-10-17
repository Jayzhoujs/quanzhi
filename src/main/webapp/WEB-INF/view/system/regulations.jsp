<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>蓉e犬后台管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!--   富文本-->
   <link rel="stylesheet" href="../css/dog_e/wangEditor.css">
   <!--    弹框-->
   <link rel="stylesheet" href="../css/sweetAlert/example.css">
   <link rel="stylesheet" href="../css/sweetAlert/sweet-alert.css">
</head>
<style>
	.span11{
		margin-top:-100px;
	}
</style>

<body>

<div><%@ include file="menu.jsp"%></div>
 

	<!-- main container -->
   <!--    防止页面跳转标签-->
    <iframe id='iframe_display' name='iframe_display' style='display:none'></iframe>
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>管理条例</h3>
                </div>
                <div style="padding: 0px 20px 10px 20px;font-size: 14px;float:left;    text-align: left;">
			 	1.在本富文本编辑器内编辑内容，提交后，富文本编辑器内容即是移动端页面所显示的内容。<br>
				2.考虑到移动端页面显示效果，不建议对除标题外的字体进行字体大小修改。<br>
				3.本页更新提交成功后，即可在手机端查看预览效果。
				</div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                            <form class="new_user_form inline-input" action="system/updateRegulation" method="post" id="form-wiz" target="iframe_display">
                                
                                <div class="span12 field-box textarea">
                                <!-- 富文本编辑器 -->
                                    <div class="col-xs-10" style="height: 400px;margin-top: 50px">
                                        <div id="textareaEditor" style="height: 380px;">
                                               <p>请输入内容...</p>
                                        </div>  
                                    </div>
                                </div>
                                <div class="span11 field-box actions">
                                	<input id="activityHTML" name="detail"  value="" type="hidden">
                                    <input type="submit" class="btn-glow primary" value="提交" id='submitForm'style='width:150px;'/>                                 
                                </div>
                            </form>
                            <div hidden="true" id="tempDetail">${rm.detail}</div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- 富文本插件 -->
    <script src="js/dog_e/wangEditor.js"></script>
     <!-- 弹框-->
    <script src='js/sweetAeler/sweet-alert.js'></script>
    <script src='js/sweetAeler/sweet-alert.min.js'></script>  
    <script>
     //富文本加載
    		var editor;
            $(function () {
                editor = new wangEditor('textareaEditor');
                editor.config.uploadImgUrl='wx/upload';
                editor.create();
                editor.$txt.html('<p>请在这里输入...</p>');
            });
            
          //进入后加载已有页面信息进入富文本编辑器
            $(document).ready(function() { 
             	var tempDetail = $("#tempDetail").html();
            	editor.$txt.html(tempDetail); 
            });
          
            /* $("#submitForm").click(function(){
                var activityHtml = editor.$txt.html().trim(); 
	            $("#activityHTML").val(activityHtml);
	            $("#submitForm").submit();
            }); */
            
            $("#submitForm").click(function(){
            	var activityHtml = editor.$txt.html().trim(); 
	            $("#activityHTML").val(activityHtml);
        		$.post("system/updateRegulation",{detail:activityHtml},function(data){
        			if (data.status=='ok') {
        				swal({
        					title : "成功！",
        					type : "success",
        					confirmButtonText : "确认",
        					confirmButtonColor : "#07C6FC"
        				}, function() {
        					window.location.href = 'system/getRegulation';
        				});
        			} else {
        				swal("Sorry!", "出错了！", "error");
        			}
        		});
        	});
    </script>
 
</body>
</html>