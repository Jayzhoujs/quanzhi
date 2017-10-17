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
    <div class="content" style='height:710px;'>    
                <div class="row-fluid header" style="margin:0 0 30px 0;">
                    <h3 style='margin: 65px 100px 0 100px;'>账号相关</h3>
                </div>
                  <div class="content" style="margin-left: -66px;">
          			 <div id="main" style="width:600px; height:400px; margin-left:200px; margin-top:100px;"></div>         			
        		</div>
    </div>   
    <!--Echats图标插件    -->
    <script src='js/dog_e/echarts.min.js'></script>
    
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        var dateList0=${mapResult.data.list0};//系统账号情况，饼状图
   		
        var arr = [];
        var valArr = [];
        for(var i=0;i < dateList0.length;i++){
    		var a = dateList0[i]["name"]
    		var b = dateList0[i]["amount"]
    		arr.push(a)
    		valArr.push(b)
    	}
		
        // 饼状图指定图表的配置项和数据
        var option = {
            title : {
                text: '系统账号情况',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: arr
            },
            series : [
                {
                    name: '系统账号情况',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {value:valArr[0], name:arr[0]},
                        {value:valArr[1], name:arr[1]},
                        {value:valArr[2], name:arr[2]},
                        {value:valArr[3], name:arr[3]},
                        {value:valArr[4], name:arr[4]}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
       
       
        
    </script>
    
</body>
</html>