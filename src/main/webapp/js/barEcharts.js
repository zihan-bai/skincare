

//立即执行函数
(function(){
    //实例化对象
    var myChart = echarts.init(document.querySelector(".box"));
    //指定配置项和数据
   
   $.get('../productController/yearBarChartPurchase').done(function(data){
	   var source = [["Years", "totalPurchase","totalUsage"]];
	   Object.keys(data).forEach((year) => {
		   source.push([year, data[year][0].toFixed(2), data[year][1].toFixed(2)]);
	   });
	   
	   var  option = {
		       
		        title: {
		            text: 'Purchase & Usage Analysis',
		            subtext: 'how much money I spend & use each year',
		            left: 'center'
		        },
		        legend: {
		            data: ['totalPurchase', 'totalUsage'],
		            left: 20,
		            top: 25,
		        
		        },
		        tooltip: {
		            trigger: 'axis',
		            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
		                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		            }
		        },
		        toolbox: {
		            show: true,
		            feature: {
		                mark: {show: true},
		                dataView: {show: true, readOnly: false},
		                magicType: {
		                    show: true,
		                    type: ['pie', 'funnel']
		                },
		                restore: {show: true},
		                saveAsImage: {show: true}
		            }
		        },
		        
		        //修改图表大小
		        grid: {
		            left: '10%',
		            top: '20%',
		            right: "10%",
		            bottom: '10%',
		            containLabel: true
		        },
		        dataset:{
		        	source:source
		        },
		        xAxis: 
		        	{
		        	type: 'category',
		        
		        	axisLabel:{
		        		//修改X轴文字颜色
		        		color:"dark grey",
		        		fontSize:"12"
		        	},
		        	
		        	
		        }
		       ,
		        yAxis: {},
		        	
		        	
		      
		        // Declare several bar series, each will be mapped
		        // to a column of dataset.source by default.
		        series: [
		            {
		            	type: 'bar',
		            	   barWidth:"25%"	,
				             itemStyle:{
				             	barBorderRadius:5
				             }
		            	
		            },
		            
		            {type: 'bar',
		             barWidth:"25%"	,
		             itemStyle:{
		             	barBorderRadius:5
		             }
		            
		            },
		        ] 
		   };
	   
	   
       myChart.setOption(option);
})
  


})();