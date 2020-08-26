//立即执行函数
(function(){
	layui.use(['jquery', 'form'], function () {
	    const $ = layui.$;
	    const form = layui.form;
	    $.post('../productController/listYears',
	            function(data) {
	                //初始化部门下拉列表
	                for (var i = 0; i < data.length; i++) {
	                    $("#select-options").append(
	                            "<option value='"+data[i]+"'>"
	                                    + data[i]
	                                    + "</option>");
	                }
	             
	                form.render();//重新渲染表单使下拉列表显示
	                
	              //实例化对象
	        	    var myChart = echarts.init(document.querySelector(".box"));
	        	  
	        	    	
	        	    $.get('../productController/yearPieChartCategory', {years: data[0]},function(chartData){
	        	    	 var option = {
	        	    		        color:[
	        	    		            "#006cff",
	        	    		            "#60cda0",
	        	    		            "#ed8884",
	        	    		            "#ff9f7f",
	        	    		            "#0096ff",
	        	    		            "#9fe6b8",
	        	    		            "#32c5e9",
	        	    		            "#1d9dff"
	        	    		        ],
	        	    		        title: {
	        	    		            text: 'Usage Analysis',
	        	    		            subtext: 'How much money I used for each category',
	        	    		            left: 'center'
	        	    		        },
	        	    		        tooltip: {
	        	    		            trigger: 'item',
	        	    		            formatter: '{a} <br/>{b} : {c} ({d}%)'
	        	    		        },
	        	    		        
	        	    		        legend: {
	        	    		            left: 'center',
	        	    		            top: 'bottom',
	        	    		            textStyle:{
	        	    		                color:"balck",
	        	    		                fontSize:"12"
	        	    		            },
	        	    		            data: []
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
	        	    		        series: [
	        	    		           
	        	    		            {
	        	    		                //鼠标放上去之后的显示信息
	        	    		                name: "the percentage of skin care product category",
	        	    		                type: "pie",
	        	    		                //修改大小
	        	    		                radius: ["10%", "70%"],
	        	    		                center: ['50%', '50%'],
	        	    		                //roseType: radius
	        	    		                roseType: 'area',
	        	    		                //图形文字标签
	        	    		                label: {
	        	    		                    fontSize:10
	        	    		                },
	        	    		                //修改线长短
	        	    		                labelLine:{
	        	    		                    //两条线
	        	    		                 
	        	    		                        length:10,
	        	    		                        length2:5
	        	    		                    

	        	    		                },

	        	    		                data: [
	        	    		                 
	        	    		                  //  {value: 40, name: 'rose8'}{2020:380}
	        	    		                ]
	        	    		            }
	        	    		        ]
	        	    		    };
	        	    		    
	        	    	 chartData.forEach((row) =>{
	 	        	    	option.series[0].data.push({
	 	        	    		value: row.totalprice,
	 	        	    		name:row.cateName
	 	        	    	});
	 	        	    	option.legend.data.push(row.cateName);
	 	        	    });
	        	    	myChart.setOption(option);
	        	    	
	        	    });
	        	    //监听提交
	        		form.on('select', function(selection){
	        			$.get('../productController/yearPieChartCategory', {years: selection.value},function(chartData){
	        				var option = {
	        						legend: {
	        	    		            left: 'center',
	        	    		            top: 'bottom',
	        	    		            textStyle:{
	        	    		                color:"balck",
	        	    		                fontSize:"12"
	        	    		            },
	        	    		            data: []
	        	    		        },
	        	    		        series: [
		        	    		           
	        	    		            {
	        	    		                //鼠标放上去之后的显示信息
	        	    		                name: "percentage of product category",
	        	    		                type: "pie",
	        	    		                //修改大小
	        	    		                radius: ["10%", "70%"],
	        	    		                center: ['50%', '50%'],
	        	    		                //roseType: radius
	        	    		                roseType: 'area',
	        	    		                //图形文字标签
	        	    		                label: {
	        	    		                    fontSize:10
	        	    		                },
	        	    		                //修改线长短
	        	    		                labelLine:{
	        	    		                    //两条线
	        	    		                 
	        	    		                        length:10,
	        	    		                        length2:5
	        	    		                    

	        	    		                },

	        	    		                data: [
	        	    		                 
	        	    		                  //  {value: 40, name: 'rose8'}{2020:380}
	        	    		                ]
	        	    		            }
	        	    		        ]
	        	    		        
	        				}
		        	    	 chartData.forEach((row) =>{
		 	        	    	option.series[0].data.push({
		 	        	    		value: row.totalprice,
		 	        	    		name:row.cateName
		 	        	    	});
		 	        	    	option.legend.data.push(row.cateName);
		 	        	    });
		        	    	myChart.setOption(option);
		        	    	
		        	    });
	        		});
	            }, 'json');
	    
	
	});
	 
  
//    })
})();