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
<body>

<div><%@ include file="menu.jsp"%></div>
 
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3>申报相关</h3>
                </div>
                  <button id='btnchart'>已通过统计信息</button>
                  <button id='btnchart1'>未通过统计信息</button>
                  <button id='btnchart2'>全部申报统计信息</button>
                  <div class="content main" style="margin-left: -66px;">
          			 <div id="main" style="width:700px; height:400px; margin-left:200px; margin-top:100px;"></div>         			 
        		 </div>
               	 <div class="content main1" style="margin-left: -66px; display:none;">
          			 <div id="main1" style="width:700px; height:400px; margin-left:200px; margin-top:100px;"></div>         			 
        		</div>
        		<div class="content main2" style="margin-left: -66px; display:none;">
          			 <div id="main2" style="width:700px; height:400px; margin-left:200px; margin-top:100px;"></div>         			 
        		</div>
            </div>
        </div>
    </div>   
    <!--Echats图标插件    -->
    <script src='js/dog_e/echarts.min.js'></script>
    
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        var myChart1 = echarts.init(document.getElementById('main1'));
        var myChart2 = echarts.init(document.getElementById('main2'));
        
        var dateList0=${mapResult.data.list0};// 提交的申报数量，折线图   
        var dateList1=${mapResult.data.list1};// 通过数量，折线图       
        var dateList2=${mapResult.data.list2};//未通过数量，折线图
        
        //提交的申报数量
        var timeArr = [];
        var passArr = []
        for(var i = 0; i < dateList0.length; i++){
        	timeArr.push(dateList0[i]['name'])
        	passArr.push(dateList0[i]['amount'])
        }
        //通过数量
        var timeArr1 = [];
        var passArr1 = []
        for(var i = 0; i < dateList1.length; i++){
        	timeArr1.push(dateList1[i]['name'])
        	passArr1.push(dateList1[i]['amount'])
        }
        //未通过数量
        var timeArr2 = [];
        var passArr2 = []
        for(var i = 0; i < dateList2.length; i++){
        	timeArr2.push(dateList2[i]['name'])
        	passArr2.push(dateList2[i]['amount'])
        }
        
        //折线图
        var option = {
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['全部申报数量统计']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : timeArr
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    series : [
				        
				        {
				            name:'全部申报数量统计',
				            type:'line',
				            stack: '总量',
				            data:passArr
				        }			        
				    ]
				};
        
        var option1 = {
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['通过的数量统计']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            boundaryGap : false,
			            data : timeArr1
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        
			        {
			            name:'通过的数量统计',
			            type:'line',
			            stack: '总量',
			            data:passArr1
			        }			        
			    ]
			};
        
        var option2 = {
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['未通过的数量统计']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            boundaryGap : false,
			            data : timeArr2
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        
			        {
			            name:'未通过的数量统计',
			            type:'line',
			            stack: '总量',
			            data:passArr2
			        }			        
			    ]
			};
        
        // 使用刚指定的配置项和数据显示图表。
       myChart.setOption(option);
       myChart1.setOption(option1);
       myChart2.setOption(option2);
       
       //视图切换
       $('#btnchart').on('click',function(){
    	   $('.main').css('display','none');
    	   $('.main1').css('display','block')
       })
       $('#btnchart1').on('click',function(){
    	   $('.main').css('display','none');
    	   $('.main1').css('display','none');
    	   $('.main2').css('display','block')
       })
       $('#btnchart2').on('click',function(){
    	   $('.main').css('display','block');
    	   $('.main1').css('display','none');
    	   $('.main2').css('display','none')
       })
    </script>
    
</body>
</html>