<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
	<title>欢迎登录蓉e犬后台管理系统</title>
	<link rel="stylesheet" type="text/css" href="../css/dog_e/common.css" />
<style>
    .box{
        text-align: center;
        width: 50px;
        margin-left: -200px;
        height: 10px;
    }

</style>
</head>
<body>

<div><%@ include file="menu.jsp"%></div>
 
	<!-- main container -->
    <div class="content">
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid header">
                    <h3>审核管理</h3>
                </div>
                 
            </div>  
            <div id="pad-wrapper" class="datatables-page">
            <table cellpadding="0" cellspacing="0" border="0" class="dataTable" id="example" style="width: 100%;margin-left:-10px;" aria-describedby="example_info">
                     <thead>
                         <tr role="row">
                             <th tabindex="0" rowspan="1" colspan="1">姓名</th>
                             <th tabindex="0" rowspan="1" colspan="1">联系方式</th>
                             <th tabindex="0" rowspan="1" colspan="1">狗狗名字</th>
                             <th tabindex="0" rowspan="1" colspan="1">犬种</th>
                             <th tabindex="0" rowspan="1" colspan="1">狗狗颜色</th>
                             <th tabindex="0" rowspan="1" colspan="1">犬主区域</th>
                             <th tabindex="0" rowspan="1" colspan="1">犬主街道</th>
                             <th tabindex="0" rowspan="1" colspan="1">提交时间</th>
                             <th tabindex="0" rowspan="1" colspan="1">状态</th>
                             <th tabindex="0" rowspan="1" colspan="1">操作</th>
                         </tr>
                     </thead>
                     <tbody style="text-align: center; width: 50px; ">
                      	<c:forEach items="${list}" var="approval">
                              	<tr align="center">
                                  	<td><a href="common/approval_detail?id=${approval.id}">${approval.realName}</a></td>
                                  	<td>${approval.phoneNum}</td>
                                  	<td>${approval.dogName}</td>
                                  	<td>${approval.varieties}</td>
                                  	<td>${approval.color}</td>
                                  	<td>${approval.area}</td>
                                  	<td>${approval.street}</td>
                                  	<td>${approval.createTime}</td>
                                  	
                                  	<c:choose>
                                  		<c:when test="${approval.status==0}">
                                  			<td>待审核</td>
                                  			<td><button value="${approval.id}" class="btn-glow primary" id="bounceIn">审核</button></td>
                                  		</c:when>
                                  		<c:when test="${approval.status==1}">
                                  			<td>已通过</td>
                                  			<td><a href="common/approval_history?id=${approval.id}">查看审批记录</a></td>
                                  		</c:when>
                                  		<c:when test="${approval.status==2}">
                                  			<td>未通过</td>
                                  			<td><a href="common/approval_history?id=${approval.id}">查看审批记录</a></td>
                                  		</c:when>
                                  	</c:choose>
                              	</tr> 
                           	</c:forEach>
                     </tbody>
                      </table>
                </div>
        </div>
         <!-- 审核弹框 -->
	     <div class="box">
			<div id="dialogBg"></div>
			<div id="dialog" class="animated" style='height:310px;'>
				<img class="dialogIco" width="50" height="50" src="./img/ico.png" alt="" />
				<div class="dialogTop" style='margin-top:20px;'>
					<span id='lable'></span>
					<a href="javascript:;" class="claseDialogBtn" style='color:white;'>关闭</a>
				</div>
				<iframe id="iframe_display" name="iframe_display" style="display: none;"></iframe>
				<form action="common/approval" method="post" id="editForm" target="iframe_display">
					<ul class="editInfos">
						<li>
							<label><font color="#ff0000">* </font>该信息审核情况选择</label>
						</li>
						<li style='margin-left:19px;margin-top: 30px;'>
							<button class="btn-glow" style='width:64px;' type='button' id='pass'>通过</button>
							<button class="btn-glow" style='margin-left:30px;' id='btn' type='button'>不通过</button>
							<p id='span' style='margin: 18px -20px 0 -72px;'></p>
						<li>
							<div id='text' style='display:none;'>
								<input type='text' style='width:259px;height:30px;margin-left:-20px;margin-top:8px;' value='请输入不通过原因...' required/>								
								<input type="submit" value="确认提交" class="submitBtn btn-glow primary" style='margin-top:25px;' id='submitBtn'/>
							</div>
						<li>						
							
						</li>
					</ul>
				</form>
			</div>
		</div>

 <script src='./js/dog_e/jquery.min.js'></script>

<script>
		
   	 //弹框样式
     var w,h,className;
     function getSrceenWH(){
         w = $(window).width();
         h = $(window).height();
         $('#dialogBg').width(w).height(h);
     }
     window.onresize = function(){  
         getSrceenWH();
     }  
     $(window).resize();            
     getSrceenWH();
     //显示弹框
     //获取到的id     
     $('#bounceIn').click(function(){
    	 var newsId = $('#bounceIn').val()   	
         className = $(this).attr('class');
         $('#dialogBg').fadeIn(300);
         $('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
       //通过
     	$('#pass').on('click',function(){         		
     		 $.ajax({
     	        type: "POST",
     	        dataType: "json",
     	        data:{id:data.newsId},
     	        url: 'common/approval',
     	        success: function (data) {
     	        	console.log(data)
     	        	$('#span').html(data.info)
     	        	/* setTimeout(function(){
		     			window.location.href='common/approval_list'
		     		},2000)  */
     	        }
     	    });  

     	})
     });

     //关闭弹窗
     $('.claseDialogBtn').click(function(){
         $('#dialogBg').fadeOut(300,function(){
             $('#dialog').addClass('bounceOutUp').fadeOut();
         });
     })
	//不通过
     $('#btn').on('click',function(){
    	 $('#text').css('display','block')
    	 $("#pass").attr('disabled',true)
     })
	$('#submitBtn').on('click',function(){
		setTimeout(function(){
 			window.location.href='common/approval_list'
 		},2000)
	})
	
	
	
	
	
	
</script>
</body>
</html>