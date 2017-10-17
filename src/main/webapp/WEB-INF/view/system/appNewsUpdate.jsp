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

    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>修改资讯</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                            <form class="new_user_form inline-input" action="system/updateNews" method="post" id="form-wiz" >
                                <div class="span12 field-box" style='margin-left:30px'>
                                    <label>主    题:</label>
                                    <input name="id"  value="${newsModel.id }" type="hidden" maxlength="100">
                                    <input class="span9" type="text" name="title" id='title' value="${newsModel.title }"/>
                                </div>
                                <div class="span12 field-box">
                                    <label>摘    要:</label>
                                    <input class="span9" type="text" name="abstracts" id='abstracts'value="${newsModel.abstracts }"/>
                                </div>
                                <div class="span12 field-box">
                                    <label>类    型:</label>
                                    <select name="type" style='width:260px;'>
                                    <c:if test="${newsModel.type==0 }">
                                        <option value="0">内链接</option>
                                    </c:if>
                                    <c:if test="${newsModel.type==1 }">
                                        <option value="1">外链接</option>
                                    </c:if>     
                                    </select>
                                </div>
                                <div class="span12 field-box textarea" style='margin-top:65px;'>
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
                                    <input type="submit" class="btn-glow primary" value="提交" id='submitForm'/>
                                    <input type="button" value="放弃" class="btn-glow" id='reset' style='margin-left:0;'/>
                                </div>
                            </form>
                             <div hidden="true" id="tempDetail">${newsModel.content}</div> 
                        </div>
                    </div>
                    
                   

                </div>
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
            $(function () {
                editor = new wangEditor('textareaEditor');
                editor.config.uploadImgUrl='wx/upload';
                editor.create();
                editor.$txt.html('<p>请在这里输入活动详细描述</p>');
            });
            
          //进入后加载已有页面信息进入富文本编辑器
            $(document).ready(function() { 
             	var tempDetail = $("#tempDetail").html();
            	editor.$txt.html(tempDetail); 
            });
          
            $("#submitForm").click(function(){
                var activityHtml = editor.$txt.html(); 
            $("#activityHTML").val(activityHtml);
            if(activityHtml=="<p>请在这里输入活动详细描述</p>"||activityHtml=="<p><br></p>"|| activityHtml==""){
                swal("Sorry!", "请编辑活动具体内容！", "error");
                return false;
            }else if($("#thumbnail").val() =="" ){
                swal("Sorry!", "请选择图片！", "error");
            }else{
                $("#submit_myForm").click();
            }
            
            //新增广告验证
            var inputArr = $('.span9');
            var checkValue = [false,false];
            inputArr.eq(1).on('change',titleFuc);
            inputArr.eq(2).on('change',urlFuc);
            function titleFuc(){
            	console.log('222')
            
               if($('#title').val() == ''){
                      sweetAlert("NO!", "标题不能为空，请正确填写！", "error");
                      checkValue[1] = false;
                  }else{
                      checkValue[1] = true;
                  }
            }
            function urlFuc(){
                if($('#url').val() == ''){
                      sweetAlert("NO!", "链接地址不能为空，请正确填写！", "error");
                      checkValue[2] = false;
                      
                  }else{
                     checkValue[2] = true;
                  }
            }
            
                for(var val in checkValue){
                           if(val){
                        	   
                               sweetAlert("YES!", "添加成功 ！", "SUCCESS");
                           }
                }
            
            
        });
           
    </script>

</body>
</html>