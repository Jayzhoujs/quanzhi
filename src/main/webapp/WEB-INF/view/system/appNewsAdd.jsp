<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>欢迎登录蓉e犬后台管理系统</title>   
<!--    弹框-->
   <link rel="stylesheet" href="../css/sweetAlert/example.css">
   <link rel="stylesheet" href="../css/sweetAlert/sweet-alert.css">
   
   <!--   富文本-->
   <link rel="stylesheet" href="../css/dog_e/wangEditor.css">
</head>
<body>
<div><%@ include file="menu.jsp"%></div>
    <div class="content" style='height:750px;'>
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>新增资讯</h3>
                </div>

                <div class="row-fluid form-wrapper" id='box'>
                    <!-- left column -->
                    <div class="span9 with-sidebar" style='margin-top:15px;'>
                        <div class="container">
                        		<div class="span12 field-box">
                                    <label>类    型:</label>
                                    <select name="type" style='width:260px;' id='sel' onChange="cll(this.value)">
                                        <option value="0">内链接</option>
                                        <option value="1">外链接</option>
                                    </select>                                    
                                </div> 
                           <div id="div"> 
                            <form class="new_user_form inline-input" action="system/addNews" method="post" id="form-wiz">
                                <div class="span12 field-box" style='margin-left:30px'>
                                    <label>主    题:</label>
                                    <input class="span9" type="text" name="title" id='title' required  />
                                </div>
                                <div class="span12 field-box">
                                    <label>摘    要:</label>
                                    <input class="span9" type="text" name="abstracts" id='abstracts' required  />
                                </div>
                                                   
                                	<div class="span12 field-box textarea" style='margin-top:65px;' id='textarea'>
                                    	<label></label>
                                <!-- 富文本编辑器 -->
                                    	<div class="col-xs-10" style="height: 360px;margin-top: 60px;margin-left:245px;width:500px">
                                        	<div id="textareaEditor" style="height: 272px;">
                                               
                                               <p>请输入内容...</p>
                                        	</div>  
                                    	</div>   
                                	</div>
                                 
	                                <div class="span11 field-box actions" style='margin-top:-130px;'> 
	                                	<input id="activityHTML" name="content"  value="" type="hidden">
	                                    <input type="hidden" name="type" value="0">
	                                    <input type="submit" class="btn-glow primary" value="提交" id='submitForm'/>
	                                </div>
                                
                                 
                            </form>
                            </div> 
                           <div id="div1"> 
                            <form class="new_user_form inline-input" action="system/addNews" method="post" id="form-wiz">
                                <div class="span12 field-box" style='margin-left:30px'>
                                    <label>主    题:</label>
                                    <input class="span9" type="text" name="title" id='title' required  />
                                </div>
                                <div class="span12 field-box">
                                    <label>摘    要:</label>
                                    <input class="span9" type="text" name="abstracts" id='abstracts' required  />
                                </div>
                               	<div class="span12 field-box" >
                               		<label>地     址:</label>
                					<input class="span9" name="content" value='http://' type="url" required style='margin-left: 64px;margin-top: 10px;'/>
                				</div> 
                               	<div class="span11 field-box actions" style='margin-top:80px;'>
                               		<input type="hidden" name="type" value="1">
                                   	<input type="submit" class="btn-glow primary" value="提交"/>
                               	</div>
                            </form>
                            </div> 
                        </div>
                    </div>                                                                
                </div>
                
                <!--隐藏表单   -->

				<!-- left column 
				<div class="row-fluid form-wrapper" id='box1' style='display:none;'>
                    <div class="span9 with-sidebar" style='margin-top:15px;'>
                        <div class="container">
                            <form class="new_user_form inline-input" action="system/addNews" method="post" id="form-wiz">
                                <div class="span12 field-box" style='margin-left:30px'>
                                    <label>主    题:</label>
                                    <input class="span9" type="text" name="title" id='title' required  />
                                </div>
                                <div class="span12 field-box">
                                    <label>摘    要:</label>
                                    <input class="span9" type="text" name="abstracts" id='abstracts' required  />
                                </div>
                                <div class="span12 field-box">
                                    <label>类    型:</label>
                                    <select name="type" style='width:260px;' id='sel1'  onChange="cll(this.value)">
                                        <option value="0">内链接</option>
                                        <option value="1">外链接</option>
                                    </select>                                   
                                </div>
                                <div class="span12 field-box">
                 					<input class="span9" name="content" value='http://' type="url" required style='margin-left: 64px;margin-top: 10px;'/>
                 				</div>
                                <div class="span11 field-box actions" style='margin-top:80px;'>
                                 	
                                    <input type="submit" class="btn-glow primary" value="提交"/>
                                </div>
                            </form>
                        </div>
                    </div>                                                            
                </div>
                
               -->
                
            </div>
        </div>
    </div>



    <script src='js/sweetAeler/sweet-alert.js'></script>
    <script src='js/sweetAeler/sweet-alert.min.js'></script>    
    

   <!-- 富文本插件 -->
    <script src="js/dog_e/wangEditor.js"></script>
   

    <script>
     //富文本加載
    var editor;           
             editor = new wangEditor('textareaEditor');
             editor.config.uploadImgUrl='wx/upload';
             editor.create();
             editor.$txt.html('<p>请在这里输入活动详细描述</p>');         
            $("#submitForm").click(function(){
                var activityHtml = editor.$txt.html(); 
            $("#activityHTML").val(activityHtml);
            if(activityHtml=="<p>请在这里输入活动详细描述</p>"||activityHtml=="<p><br></p>"|| activityHtml==""){
                swal("Sorry!", "请编辑活动具体内容！", "error");
                return false;
            }else if($("#thumbnail").val() =="" ){
                swal("Sorry!", "请选择图片！", "error");
            }
                   
        });

function cll(id){ 
	if(id==1){ 
	  eval("div1.style.display=\"block\";"); 
	  eval("div.style.display=\"none\";");} 
	else if(id==0){ 
	  eval("div.style.display=\"\";"); 
	  eval("div1.style.display=\"none\";");} 
}         
            
            
    /*  $('#sel').on('change',function(){
    	 var sel = $('#sel').val()
    	 if(sel == 1){
    		 $('#box').css('display','none')
    		 $('#box1').css('display','block')
    	 }
     })
      
     $('#sel1').on('change',function(){
    	 var sel = $('#sel').val()
    	 if(sel == 1){
    		 $('#box').css('display','block')
    		 $('#box1').css('display','none')
    	 }
     }) */
            
     
           
    </script>

</body>
</html>