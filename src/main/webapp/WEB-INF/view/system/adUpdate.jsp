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
    <iframe id='iframe_display' name='iframe_display' style='display:none'></iframe>
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>编辑广告</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                            <form class="new_user_form inline-input" action="system/updateAd" method="post"  target="iframe_display">
                                <div class="span12 field-box textarea" style='margin-left:55px;'>
                                    <label>标    题:</label>
                                    <input type="hidden" value="${adModel.id }" name="id"> 
                                    <input class="span9" type="text" name='title' required value="${adModel.title }"/>
                                </div>
                                 <div class="span12 field-box textarea">
                                    <label>链接地址:</label>
                                    <input class="span9" type="text" name='url'  value="${adModel.url }"/>
                                </div>
                                 <div class="span12 field-box textarea">
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图	片:</label>
                                    <!--   图片上传-->
                                        <div class="personal-image" id='uploadForm'>
                                            <input id="myFileUpload" type="file" name="file" multiple='multiple'/>
                                        </div>
                                        <div class="image_container" style='margin-top:40px;'>
                                            <img src="${adModel.imgUrl }" alt="" id="myImg" name="imgUrl" width="150" height="120">
                                          
                                        </div>
                                </div>
                                <div class="span11 field-box actions">
                                    <input type="submit" class="btn-glow primary" value="提交" id="form-wiz"/>
                                    <input type="button" value="取消" class="btn-glow" id='reset' style='margin-left:0;'/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script src='./js/dog_e/ajaxfileupload.js'></script>
    <!--    弹框插件-->
    <script src='js/sweetAeler/sweet-alert.js'></script>
    <script src='js/sweetAeler/sweet-alert.min.js'></script>    

   
 <script type="text/javascript">   
     //放弃
     $('#reset').on('click',function(){
              swal({
              title: "你确定要放弃?",
              type: "warning",
              showCancelButton: true,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: "Yes",
              cancelButtonText: "No",
              closeOnConfirm: false
            },
            function(){
              swal("OK!", "该信息已经不存在.", "success");
            });
        });
     //图片上传预览
     $('#myFileUpload').on('change',function(){
         var file = $(this);
         var fileObj = file[0];
         var dataURL;
         var windowURL = window.URL;
         var img = $('#myImg');
         if(fileObj && fileObj.files && fileObj.files[0]){
                dataURL = windowURL.createObjectURL(fileObj.files[0])
                img.attr('src',dataURL);
            }else{
                dataURL = file.val();
                img.style.filter = 'progid:DXImageTransform.Micsoft.AlphaImageLoader(sizingMethod = scale)'
                img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = dataURL;
            }
         $.ajaxFileUpload({
             url:"wx/upload",
             fileElementId: "myFileUpload",
             dataType: "string",
             success: function(data) {
                 //图片路径
                 $("#myImg").attr("src",data);
             }
         });
     })
     
     
</script>
   &nbsp;
    
   
    
    

</body>
</html>