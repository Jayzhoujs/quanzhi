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
                    <h3>犬只数量增长情况</h3>
                </div>
                  <div class="content" style="margin-left: -66px;">         			
          			 <div id="main_list" style="width:600px; height:400px; margin-left:200px; margin-top:100px; "></div>
        		</div>               
            </div>
        </div>
    </div>   
    <!--Echats图标插件    -->
    <script src='js/dog_e/echarts.min.js'></script>
    
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart_list = echarts.init(document.getElementById('main_list'));
        
        var dateList0=${mapResult.data.list0};
      	//犬只增长情况
        var a = [];
        var b = [];
        for(var i = 0; i < dateList0.length; i++){
        	a.push(dateList0[i]['name']);
        	b.push(dateList0[i]['amount']);
        }
        var option1 = {
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['犬只增长情况']
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
			            data : a
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        
			        {
			            name:'犬只增长情况',
			            type:'line',
			            stack: '总量',
			            data:b
			        }			        
			    ]
			};
        //折线图
        
       
        // 使用刚指定的配置项和数据显示图表。
        myChart_list.setOption(option1);
    </script>
    
</body>
</html>