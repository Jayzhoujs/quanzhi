<%@page import="com.xtoucher.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<title>蓉e犬后台管理系统</title>
 <!--    弹框插件-->
   <link rel="stylesheet" href="../css/sweetAlert/example.css">
   <link rel="stylesheet" href="../css/sweetAlert/sweet-alert.css">
</head>
<body>
<div><%@ include file="menu.jsp"%></div>
   <!--    防止页面跳转标签-->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>新增广告</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                            <form class="new_user_form inline-input" action="system/addAd" method="post" id="myForm" target="iframe_display">
                                <div class="span12 field-box textarea" style='margin-left:55px;'>
                                    <label>标    题:</label>
                                    <input class="span9" type="text" name='title' required maxlength="50" />
                                </div>
                                 <div class="span12 field-box textarea">
                                    <label>链接地址:</label>
                                    <input class="span9" type="url" name='url'  value="" required />
                                </div>
                                 <div class="span12 field-box textarea">
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图	片:</label>
                                    <!--   图片上传-->
                                        <div class="personal-image" id='uploadForm'>
                                            <input id="myFileUpload" type="file" name="inputFile" multiple='multiple'/>
                                        </div>
                                        <div class="image_container" style='margin-top:40px;'>
                                        	<input type="hidden" name="imgUrl" id="imgUrl" required/>
                                        	<img style="width:100px;height:100px;" id="myImg" src="./img/up_btn.png" alt="">                                    	
                                        </div>   
                                     </div>
                                <div class="span11 field-box actions">
                                    <input type="submit" class="btn-glow primary" value="提交" id="myButton" style='width:80px;'/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script src='js/dog_e/ajaxfileupload.js'></script>
    <!--    弹框插件-->
    <script src='js/sweetAeler/sweet-alert.js'></script>
    <script src='js/sweetAeler/sweet-alert.min.js'></script>    

   
 <script type="text/javascript">   
     //图片上传预览
    function test(){
               $.ajaxFileUpload({

                   url:"wx/upload",
                   fileElementId: "myFileUpload",
                   dataType: "string",
                   success: function(data) {
                       //图片路径
                       $("#myImg").attr("src",data);
                       $("#imgUrl").val(data);
                   }
               });
           }
           $('#myFileUpload').on('change',test);
           
           //提交表单
          $("#myForm").validate({
               submitHandler:function(form){
            	   var imgUrl=$("#imgUrl").val();
            	   if(imgUrl){
            		   $("#myForm").submit();
            	   }
            	   else{
            		   swal("Sorry!", "请选择图片！", "info");
            	   }
               }    
           }); 
</script>

    
   
    
    

</body>
</html>