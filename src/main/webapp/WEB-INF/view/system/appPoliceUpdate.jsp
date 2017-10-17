<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.xtoucher.model.AccountModel"%>

<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>"></base>

	<title>Detail Admin - User list</title>
<c:set scope="request" var="status" value="${status }"></c:set>
<%
	String errorInfo = (String)request.getAttribute("status");         // 获取错误属性
	if(errorInfo != null) {
%>
	<script type="text/javascript" language="javascript">
		alert("<%=errorInfo%>");                                            // 弹出错误信息		                   
	</script>	
<%
	}
%>
	<title>欢迎登录蓉e犬后台管理系统</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="./css/dog_e/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="./css/dog_e/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="./css/dog_e/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="./css/dog_e/layout.css" />
    <link rel="stylesheet" type="text/css" href="./css/dog_e/elements.css" />
    <link rel="stylesheet" type="text/css" href="./css/dog_e/icons.css" />

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="./css/dog_e/lib/font-awesome.css" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="./css/dog_e/compiled/new-user.css" type="text/css" media="screen" />
    
<!--    弹框插件-->
   <link rel="stylesheet" href="./css/sweetAlert/example.css">
   <link rel="stylesheet" href="./css/sweetAlert/sweet-alert.css">
   
    <!-- open sans font -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<style>
    .selArea{
        width: 322px;
    }    
</style>
<body>


    <!-- navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-inner">
            <button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>          
             <a class="brand" href="login/home"><img src="./img/logo.png" /></a>       
        </div>
    </div>
    <!-- end navbar -->

    <!-- sidebar -->
    <div id="sidebar-nav">
            <ul id="dashboard-menu">
           <c:if test="${accountModel.rank==1 }">
			
				<li>
               		<a class="dropdown-toggle">
                    	<i class="icon-home"></i>
                   			 <span>审批管理</span>
                    	<i class="icon-chevron-down"></i>
                	</a>
                	<ul class="submenu">
                    	<li><a href="system/branchAndUnApporval">未审批</a></li>
                   	 	<li><a href="system/statusA">已审批</a></li>
                   	 	<li><a href="system/statusA?i=notPass">未通过记录</a></li>
                    	<li><a href="system/all">全部审核历史</a></li>
                	</ul>
           		</li>   
           		 
            <li>
                 <a class="dropdown-toggle" href="#">
                    <i class="icon-th-large"></i>
                    <span>犬只管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="system/dogBreed">犬种类</a></li>
                    <li><a href="system/dogColour">犬毛色</a></li>
                    <li><a href="system/allDogForbidden">禁养犬种</a></li>
                   <li><a href="system/dogHospital">疫苗网点</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-group"></i>
                    <span>组织架构</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                   <li><a href="system/queryAllBranch">地区管理</a></li>
                    <li><a href="system/branchSelect">用户列表</a></li>
                    <li><a href="system/addUserJsp">新用户</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-picture"></i>
                    <span>广告</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="system/allAd">查看已发布</a></li>
                    <li><a href="system/saveAd">新增广告</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-th-large"></i>
                    <span>资讯</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="system/newsAll">查看已发布</a></li>
                    <li><a href="system/SaveNews">新增资讯</a></li>
                </ul>
            </li>
            <li>
                <a href="tables.html">
                    <i class="icon-signal"></i>
                    <span>统计</span>
                </a>
            </li>
			</c:if>
			<c:if test="${accountModel.rank==2 }">
				<li class="active">
                <a class="dropdown-toggle" href="index.html">
                    <i class="icon-home"></i>
                    <span>审批管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    
                    	<li><a href="office/statusA?i=UnApproved">未审批</a></li>
                   	 	<li><a href="office/statusA">已审批</a></li>
                   	 	<li><a href="office/statusA?i=notPass">未通过记录</a></li>
                    	<li><a href="office/all">全部审核历史</a></li>
                	
                </ul>
            </li>  
				<li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-group"></i>
                    <span>组织架构</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
						<li><a href="office/branchSelect">用户列表</a></li>
						<li><a href="office/addUserJsp">新用户</a></li>
					</ul>
            </li>

			</c:if>
			<c:if test="${accountModel.rank==4 }">
				<li>
               		<a class="dropdown-toggle" href="index.html">
                    	<i class="icon-home"></i>
                   			 <span>审批管理</span>
                    	<i class="icon-chevron-down"></i>
                	</a>
                	<ul class="submenu">
                    	<li><a href="branch/statusA?i=UnApproved">未审批</a></li>
                   	 	<li><a href="branch/statusA">已审批</a></li>
                   	 	<li><a href="branch/statusA?i=notPass">未通过记录</a></li>
                    	<li><a href="branch/all">全部审核历史</a></li>
                	</ul>
           		 </li>
				<li>
					<a class="dropdown-toggle" href="#"> 
						<i class="icon-group"></i> 
						<span>组织架构</span> 
						<i class="icon-chevron-down"></i>
					</a>
					<ul class="submenu">
						<li><a href="branch/branchSelect">用户列表</a></li>
						<li><a href="branch/addUserJsp">新用户</a></li>
					</ul>
				</li>
			</c:if>
			<li>
                <a href="login/Current">
                	<i class="icon-user"></i> 
                    <span>我的信息</span>
                </a>
            </li>
            <li>
                <a  href="login/quit">
                	<i class="icon-signin"></i> 
                    <span>退出</span> 
                </a>
               
            </li>
		</ul>
	</div>
	<!-- end sidebar -->
 
<!--    防止页面跳转标签-->
    <iframe id='iframe_display' name='iframe_display' style='display:none'></iframe>
	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>修改一个用户</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                           <c:choose>
<c:when test="${accountModel.rank==2}"> 
 <form class="new_user_form inline-input" action="office/updateUser" method="post" id="formSub" target="iframe_display">
                                <div class="span12 field-box">
                                    <label>网 点:</label>
                                    
                                   	<c:forEach items="${list}" var="list">
                                       	<c:if test="${am.branchId==list.id }">
                                       	<input name="" value="${list.name}" class="span9" type="text" />
                                       	</c:if>
                                     </c:forEach>
                                </div>
                                <div class="span12 field-box">
                                    <label>角 色:</label>
                                    <c:if test="${am.rank==1 }"><input name="" value="市局" 	class="span9"	type="text" /></c:if>
                                    <c:if test="${am.rank==2 }"><input name="" value="分局"  class="span9"    type="text" /></c:if>
                                    <c:if test="${am.rank==3 }"><input name="" value="分局民警" class="span9"  type="text" /></c:if>
                                    <c:if test="${am.rank==4 }"><input name="" value="派出所"   class="span9"  type="text" /></c:if>
                                    <c:if test="${am.rank==5 }"><input name="" value="派出所民警" class="span9" type="text" /></c:if>
                                </div>
                                <div class="span12 field-box">
                                    <label>帐 号:</label>
                                    <input name="account" value="${am.account }" class="span9" id='test' type="text" maxlength='20'/>
                                </div>
                                <div class="span12 field-box">
                                    <label>新密 码:</label>
                                    <input name="pwd"  class="span9" type="password" />
                                </div>
                                <div class="span12 field-box">
                                    <label>姓 名:</label>
                                    <input name="userName" value="${am.userName }" class="span9" type="text" maxlength='10'/>
                                </div>
                                <div class="span12 field-box">
                                    <label>电 话:</label>
                                    <input name="phone" value="${am.phone }" class="span9" type="text" maxlength='11'/>
                                </div>
                                <div class="span11 field-box actions">
                                	<input type="hidden" value="${am.id }" name="id">
                                
                                	<input type="hidden" value="${am.branchId }" name="branchId">
                                    <input type="submit"  class="btn-glow primary" id="btn-glow" value="提交" />
                                    <span>OR</span>
                                    <input type="reset" value="放弃" class="reset" id="reset-r" />
                                </div>
                            </form>
</c:when>
<c:when test="${accountModel.rank==4}">
 <form class="new_user_form inline-input" action="branch/updateUser" method="post" id="formSub" target="iframe_display">
                                <div class="span12 field-box">
                                    <label>网 点:</label>
                                    
                                   	<c:forEach items="${list}" var="list">
                                       	<c:if test="${am.branchId==list.id }">
                                       	<input name="" value="${list.name}" class="span9" type="text" />
                                       	</c:if>
                                     </c:forEach>
                                </div>
                                <div class="span12 field-box">
                                    <label>角 色:</label>
                                    <c:if test="${am.rank==1 }"><input name="" value="市局" 	class="span9"	type="text" /></c:if>
                                    <c:if test="${am.rank==2 }"><input name="" value="分局"  class="span9"    type="text" /></c:if>
                                    <c:if test="${am.rank==3 }"><input name="" value="分局民警" class="span9"  type="text" /></c:if>
                                    <c:if test="${am.rank==4 }"><input name="" value="派出所"   class="span9"  type="text" /></c:if>
                                    <c:if test="${am.rank==5 }"><input name="" value="派出所民警" class="span9" type="text" /></c:if>
                                </div>
                                <div class="span12 field-box">
                                    <label>帐 号:</label>
                                    <input name="account" value="${am.account }" class="span9" id='test' type="text" maxlength='20'/>
                                </div>
                                <div class="span12 field-box">
                                    <label>新密 码:</label>
                                    <input name="pwd"  class="span9" type="password" />
                                </div>
                                <div class="span12 field-box">
                                    <label>姓 名:</label>
                                    <input name="userName" value="${am.userName }" class="span9" type="text" maxlength='10'/>
                                </div>
                                <div class="span12 field-box">
                                    <label>电 话:</label>
                                    <input name="phone" value="${am.phone }" class="span9" type="text" maxlength='11'/>
                                </div>
                                <div class="span11 field-box actions">
                                	<input type="hidden" value="${am.id }" name="id">
                                
                                	<input type="hidden" value="${am.branchId }" name="branchId">
                                    <input type="submit"  class="btn-glow primary" id="btn-glow" value="提交" />
                                    <span>OR</span>
                                    <input type="reset" value="放弃" class="reset" id="reset-r" />
                                </div>
                            </form>
</c:when>
<c:otherwise>
 <form class="new_user_form inline-input" action="system/updateUser" method="post" id="formSub" target="iframe_display">
                                <div class="span12 field-box">
                                    <label>网 点:</label>
                                    
                                   	<c:forEach items="${list}" var="list">
                                       	<c:if test="${am.branchId==list.id }">
                                       	<input name="" value="${list.name}" class="span9" type="text" />
                                       	</c:if>
                                       	<c:if test="${am.branchId==null }">
                                       	<input name="" value="市局" class="span9" type="text" />
                                       	</c:if>
                                     </c:forEach>
                                </div>
                                <div class="span12 field-box">
                                    <label>角 色:</label>
                                    <c:if test="${am.rank==1 }"><input name="" value="市局" 	class="span9"	type="text" /></c:if>
                                    <c:if test="${am.rank==2 }"><input name="" value="分局"  class="span9"    type="text" /></c:if>
                                    <c:if test="${am.rank==3 }"><input name="" value="分局民警" class="span9"  type="text" /></c:if>
                                    <c:if test="${am.rank==4 }"><input name="" value="派出所"   class="span9"  type="text" /></c:if>
                                    <c:if test="${am.rank==5 }"><input name="" value="派出所民警" class="span9" type="text" /></c:if>
                                </div>
                                <div class="span12 field-box">
                                    <label>帐 号:</label>
                                    <input name="account" value="${am.account }" class="span9" id='test' type="text" maxlength='20'/>
                                </div>
                                <div class="span12 field-box">
                                    <label>新密 码:</label>
                                    <input name="pwd"  class="span9" type="password" />
                                </div>
                                <div class="span12 field-box">
                                    <label>姓 名:</label>
                                    <input name="userName" value="${am.userName }" class="span9" type="text" maxlength='10'/>
                                </div>
                                <div class="span12 field-box">
                                    <label>电 话:</label>
                                    <input name="phone" value="${am.phone }" class="span9" type="text" maxlength='11'/>
                                </div>
                                <div class="span11 field-box actions">
                                	<input type="hidden" value="${am.id }" name="id">
                                
                                	<input type="hidden" value="${am.branchId }" name="branchId">
                                    <input type="submit"  class="btn-glow primary" id="btn-glow" value="提交" />
                                    <span>OR</span>
                                    <input type="reset" value="放弃" class="reset" id="reset-r" />
                                </div>
                            </form>
</c:otherwise>
</c:choose>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


	<!-- scripts -->
 
   
    <script src="./js/dog_e/jquery-latest.js"></script>
    <script src="./js/dog_e/bootstrap.min.js"></script>
    <script src="./js/dog_e/theme.js"></script>
    
<!--    弹框插件-->
    <scpirt src='./js/dog_e/jquery-1.8.3.min.js'></scpirt>
    <script src='./js/sweetAeler/sweet-alert.js'></script>
    <script src='./js/sweetAeler/sweet-alert.min.js'></script>    
   
   

    <script type="text/javascript">
        $(function () {
                
                        var inputVal = $('.span9')
                        //所有的input默认为false
                        var checkArr = [false,false,false,false]
                        //警员编号验证
                        inputVal.eq(1).on('change',function(){
                            var input1 = inputVal.eq(1).val();
                            var reg = /^[A-Za-z0-9]{20}$/
                            if(reg.test(input1)){
                                checkArr[0] = true;

                            }else{
                                sweetAlert("NO!", "警员编号只能是数字/字母，请正确填写！", "error");
                                checkArr[0] = false;
                            }
                        })
                       
                        //密码验证  
                        inputVal.eq(2).change(function(){
                            var input2 = inputVal.eq(2).val();
                            var reg = /^[A-Za-z0-9]{6,20}$/
                            if(reg.test(input2)){
                                checkArr[1] = true;

                            }else{
                                sweetAlert("NO!", "请正确填写6-12位数字/字母密码！", "error");
                                checkArr[1] = false;
                            }
                        })
                        
                        //姓名的验证
                        inputVal.eq(3).change(function(){
                            var input3 = inputVal.eq(3).val();
                            if(input3){
                                checkArr[2] = true;
                            }else{
                                sweetAlert("NO!", "姓名不能为空，请正确填写！", "error");
                                checkArr[2] = false;
                            }
                        })

                        //电话验证
                        inputVal.eq(4).change(function(){
                            var input4 = inputVal.eq(4).val();
                            var reg = /^[0-9]{11}$/
                            	if(reg.test(input4)){
                                    checkArr[3] = true;
                                }else{
                                    sweetAlert("NO!", "电话号码为11位纯数字，请正确填写！", "error");
                                    checkArr[3] = false;
                                }
                        })
                        //按钮提交
                        $('#formSub').submit(function(){
                          for(var val in checkArr){
                                    if(!val){
                                        console.log('erro')
                                        sweetAlert("NO!", "请正确填写所有信息！", "error");
                                        return false
                                    }
                            }
                    
                            console.log('yes')
                            sweetAlert("Yes!", "提交成功！", "success");
                        })
                 
                        //放弃提交
                        $('.reset').on('click',function(){
                            swal({
                                  title: "你确定要放弃?",
                                  type: "warning",
                                  showCancelButton: true,
                                  confirmButtonColor: "#DD6B55",
                                  confirmButtonText: "Yes, 放弃!",
                                  cancelButtonText: "No, 再想想!",
                                  closeOnConfirm: false
                                },
                                 function(){
                                  swal("OK!", "该信息已经不存在.", "success");
                                });
                            })
                });
    </script>

</body>
</html>