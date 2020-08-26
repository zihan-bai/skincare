<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Management</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<script src="../layui/layui.js"></script>

<%--usedialog--%>
<script type="text/html" id="use-dialog">
    <form class="layui-form" action="" lay-filter="use-form">
        <div class="layui-form-item">
            <label class="layui-form-label">Product Name</label>
            <div class="layui-input-block">
                <input type="text" name="pname" required lay-verify="required" disabled
                       class="layui-input">
                <input type="hidden" name="pid" class="layui-input">
            </div>
        </div>

	 

	 <div class="layui-form-item">
            <label class="layui-form-label">Usage Date</label>
            <div class="layui-inline"> 
                      <input type="text" class="layui-input" id="date1"  name="usedate" >
           </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="use-form">Save</button>
                <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
            </div>
        </div>
    </form>
</script>







<%--添加对话框--%>
<script type="text/html" id="add-dialog">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">Product Name</label>
            <div class="layui-input-block">
                <input type="text" name="pname" required lay-verify="required" placeholder="please enter product name"
                       class="layui-input">
            </div>
        </div>


	 <div class="layui-form-item">
            <label class="layui-form-label">Product Brand</label>
            <div class="layui-input-block">
                <input type="text" name="pbrand" required lay-verify="required" placeholder="please enter product brand"
                       class="layui-input">
            </div>
      </div>

	 <div class="layui-form-item">
            <label class="layui-form-label">Pruct Size</label>
            <div class="layui-input-block">
                <input type="text" name="psize" required lay-verify="required" placeholder="please enter product size"
                       class="layui-input">
            </div>
      </div>
		
		 <div class="layui-form-item">
            <label class="layui-form-label">Product Price</label>
            <div class="layui-input-block">
                <input type="text" name="pprice" required lay-verify="required" placeholder="please enter product price"
                       class="layui-input">
            </div>
        </div>

	 <div class="layui-form-item">
            <label class="layui-form-label">Product Discount</label>
            <div class="layui-input-block">
                <input type="text" name="pdiscount" required lay-verify="required" placeholder="please enter discount"
                       class="layui-input">
            </div>
        </div>


	 <div class="layui-form-item">
            <label class="layui-form-label">Shopping Place</label>
            <div class="layui-input-block">
                <input type="text" name="plocation" required lay-verify="required" placeholder="please enter shopping place"
                       class="layui-input">
            </div>
        </div>



	 <div class="layui-form-item">
            <label class="layui-form-label">Produce Date</label>
           <div class="layui-inline"> 
                      <input type="text" class="layui-input" id="date1"  name="producedate" >
           </div>
        </div>

	 <div class="layui-form-item">
            <label class="layui-form-label">Purchase Date</label>
           <div class="layui-inline"> 
                      <input type="text" class="layui-input" id="date2"  name="purchasedate" >
           </div>
        </div>
	 <div class="layui-form-item">
            <label class="layui-form-label">Expiration</label>
           <div class="layui-inline"> 
                      <input type="text" class="layui-input" id="date3"  name="expiration" >
           </div>
        </div>


	 <div class="layui-form-item">
            <label class="layui-form-label">Product Description</label>
            <div class="layui-input-block">
                <input type="text" name="pdesc" required lay-verify="required" placeholder="please enter product description"
                       class="layui-input">
            </div>
       </div>

	 
		
	 <div class="layui-form-item">
            <label class="layui-form-label"> Product Category </label>
            <div class="layui-input-block">
                <select name="cateid" id="select-options" lay-verify="required">
                            <option value="">please choose category name</option>
                </select>
            </div>
        </div>

	

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="save-form">Save</button>
                <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
            </div>
        </div>
    </form>
</script>

<%--修改对话框--%>
<script type="text/html" id="edit-dialog">
    <form class="layui-form" action="" lay-filter="edit-form">
        <div class="layui-form-item">
            <label class="layui-form-label">Product Name</label>
            <div class="layui-input-block">
                <input type="text" name="pname" required lay-verify="required" placeholder="please enter product name"
                       class="layui-input">
                <input type="hidden" name="pid" class="layui-input">
            </div>
        </div>

<div class="layui-form-item">
            <label class="layui-form-label">Product Brand</label>
            <div class="layui-input-block">
                <input type="text" name="pbrand" required lay-verify="required" placeholder="please enter product brand"
                       class="layui-input">
            </div>
      </div>

	 <div class="layui-form-item">
            <label class="layui-form-label">Pruct Size</label>
            <div class="layui-input-block">
                <input type="text" name="psize" required lay-verify="required" placeholder="please enter product size"
                       class="layui-input">
            </div>
      </div>
		
		 <div class="layui-form-item">
            <label class="layui-form-label">Product Price</label>
            <div class="layui-input-block">
                <input type="text" name="pprice" required lay-verify="required" placeholder="please enter product price"
                       class="layui-input">
            </div>
        </div>

	 <div class="layui-form-item">
            <label class="layui-form-label">Product Discount</label>
            <div class="layui-input-block">
                <input type="text" name="pdiscount" required lay-verify="required" placeholder="please enter discount"
                       class="layui-input">
            </div>
        </div>


	 <div class="layui-form-item">
            <label class="layui-form-label">Shopping Place</label>
            <div class="layui-input-block">
                <input type="text" name="plocation" required lay-verify="required" placeholder="please enter shopping place"
                       class="layui-input">
            </div>
        </div>



	 <div class="layui-form-item">
            <label class="layui-form-label">Produce Date</label>
           <div class="layui-inline"> 
                      <input type="text" class="layui-input" id="date1"  name="producedate" >
           </div>
        </div>

	 <div class="layui-form-item">
            <label class="layui-form-label">Purchase Date</label>
           <div class="layui-inline"> 
                      <input type="text" class="layui-input" id="date2"  name="purchasedate" >
           </div>
        </div>
	 <div class="layui-form-item">
            <label class="layui-form-label">Expiration</label>
           <div class="layui-inline"> 
                      <input type="text" class="layui-input" id="date3"  name="expiration" >
           </div>
        </div>


	 <div class="layui-form-item">
            <label class="layui-form-label">Product Description</label>
            <div class="layui-input-block">
                <input type="text" name="pdesc" required lay-verify="required" placeholder="please enter product description"
                       class="layui-input">
            </div>
       </div>

	 
		
	 <div class="layui-form-item">
            <label class="layui-form-label"> Product Category </label>
            <div class="layui-input-block">
                <select name="cateid" id="select-options" lay-verify="required">
                            <option value="">please choose category name</option>
                </select>
            </div>
        </div>

	

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="edit-form">Save</button>
                <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
            </div>
        </div>
        
    </form>
</script>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="use"><i class="layui-icon">&#xe65e;</i>Use</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>Edit</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="remove"><i class="layui-icon">&#xe640;</i>Delete</a>
</script>
<script type="text/javascript">
    layui.use(['layer', 'table', 'jquery', 'form'], function () {
        const layer = layui.layer;
        const table = layui.table;
        const $ = layui.$;
        const form = layui.form;
        layer.ready(function() {
    	   //编辑和删除
           table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
               console.log(obj);
               const layEvent = obj.event; //获得 lay-event 对应的值
               if (layEvent === 'remove') {
                   layer.confirm('are you sure you want to delete this product', {icon: 3, title: 'Alarm'}, function () {
                       $.post('../productController/removeOneProductInfo', {pid: obj.data.pid}, function (flag) {
                           if (flag) {
                               table.reload('demo', {});
                               layer.msg('successed', {icon: 6});
                           } else {
                               layer.msg('failed', {icon: 5});
                           }
                       })
                   });

               } else if (layEvent === 'edit') {
            	   layer.open({
                       type: 1,
                       title: 'edit product information',
                       area: ['500px'],
                       content: $("#edit-dialog").html(),
                       success: function(layero, index){
                    	   layui.use('laydate', function(){
                    		  	var laydate = layui.laydate;
                    		  //执行一个laydate实例
                    		  laydate.render({
                    		    elem: '#date1' //指定元素
                    		  });
                    		  //执行一个laydate实例
                    		  laydate.render({
                    		    elem: '#date2' //指定元素
                    		  });
                    		  //执行一个laydate实例
                    		  laydate.render({
                    		    elem: '#date3' //指定元素
                    		  });
                    		  
                    		});
                 
                      	
                    
                          
                
                          form.val('edit-form', {  
                              'pid': obj.data.pid,
                              'pname': obj.data.pname,
                              'pbrand': obj.data.pbrand,
                              'psize': obj.data.psize,
                              'pprice': obj.data.pprice,
                              'pdiscount': obj.data.pdiscount,
                              'plocation': obj.data.plocation,
                              'producedate': obj.data.producedate,
                              'purchasedate': obj.data.purchasedate,
                              'expiration': obj.data.expiration,
                              'pdesc': obj.data.pdesc,
                              'cateid': obj.data.cateid,
                              'catename': obj.data.catename
                              
                          })
                          
                          
                          
                           $.post('../categoryController/listAllCategoryInfo',
		                       function(data) {
		                           //初始化部门下拉列表
		                           for (var i = 0; i < data.length; i++) {
		                               $("#select-options").append(
		                                       "<option value='"+data[i].cateid+"'>"
		                                               + data[i].catename
		                                               + "</option>");
		                           }
		                           form.val('edit-form', { //显示 category
		                               'cateid' : obj.data.cateid
		                           })
		                           form.render();//重新渲染表单使下拉列表显示
		                       }, 'json');
                       }
                   });  
               }else if (layEvent === 'use') {
               	layui.use('laydate', function(){
               		  var laydate = layui.laydate;
          			  layer.open({
                            type: 1,
                            title: 'use prodcut info',
                            area: ['500px'],
                            content: $("#use-dialog").html()
                        });
              		  
              		  //执行一个laydate实例
              		  laydate.render({
              		    elem: '#date1'
      
              		  });

                         form.val('use-form', {  
                             'pid': obj.data.pid,
                             'pname': obj.data.pname
                         })
                         
                         
                         form.on('submit(use-form)', function (data) {
                             $.post('../usageController/saveUsageInfo', data.field, function (flag) {
                                 if (flag=="1") {
                                     layer.msg('Successed', {icon: 6});
                                     table.reload('demo', {}); //表格重载数据
                                     layer.closeAll('page');//关闭弹出对话框
                                 } else{
                                	 layer.msg('failed', {icon: 5});
                                 }
                             })
                             return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
                         })
               	});
               }
               });
                //更新数据
           form.on('submit(edit-form)', function (data) {
           	
           	
               $.post('../productController/updateProductInfo', data.field, function (flag) {
                   if (flag) {
                       layer.msg('successed', {icon: 6});
                       table.reload('demo', {}); //表格重载数据
                       layer.closeAll('page');//关闭弹出对话框
                   } else {
                       layer.msg('failed', {icon: 5});
                   }
               })
               return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
           })

           //批量删除
           $("#removeBatch-but").click(function () {

               const array = table.checkStatus('demo').data;
               if (array.length == 0) {
                   layer.msg('please select the product you want to delete');
               } else {
                   const pids = [];
                   for (var i = 0; i < array.length; i++) {
                       pids.push(array[i].pid);
                   }
                   $.post('../productController/removeBatchProductInfo', {"pids[]": pids}, function (flag) {
                       if (flag) {
                           layer.msg('successed', {icon: 6});
                           table.reload('demo', {}); //表格重载数据
                       } else {
                           layer.msg('failed', {icon: 5});
                       }
                   })
               }

           })
           //弹出添加对话框
           $("#add-but").click(function () {
           	layui.use('laydate', function(){
           		  var laydate = layui.laydate;
           		  
           		  //执行一个laydate实例
           		  laydate.render({
           		    elem: '#date1' 
           		  });
           		 
           		  //执行一个laydate实例
           		  laydate.render({
           		    elem: '#date2' 
           		  });
           		  
           		  //执行一个laydate实例
           		  laydate.render({
           		    elem: '#date3' 
           		  });
           		  
           		  
           		  
           		});
           	
        
           	$.post('../categoryController/listAllCategoryInfo',
   					function(data) {
   						//初始化部门下拉列表
   						for (var i = 0; i < data.length; i++) {
   							$("#select-options").append(
   									"<option value='"+data[i].cateid+"'>"
   											+ data[i].catename
   											+ "</option>");
   						}
   						form.render();//重新渲染表单使下拉列表显示
   					}, 'json')
           	
           	
               layer.open({
                   type: 1,
                   title: 'add product information',
                   area: ['500px'],
                   content: $("#add-dialog").html()
               });
               
               
               
               
               
           })
           //添加数据
           form.on('submit(save-form)', function (data) {
          
               $.post('../productController/saveProductInfo', data.field, function (flag) {
                   if (flag) {
                       layer.msg('successed', {icon: 6});
                       table.reload('demo', {}); //表格重载数据
                       layer.closeAll('page');//关闭弹出对话框
                   } else {
                       layer.msg('failed', {icon: 5});
                   }
               })
               return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
           })
           //表格条件查询

           $("#search-but").click(function () {
               table.reload('demo', {
                   where: {
                       pname: $("#pname").val()
                   }
               })
           })
           // 表格数据渲染
           table.render({
               elem: '#demo'
               , url: '../productController/productListPage' //数据接口
               , page: true //开启分页
               , cols: [[ //表头
               	{
   					field : 'pid',
   					title : 'Product ID',
   					type : 'checkbox'
   				}, {
   					field : 'pname',
   					title : 'Product Name'
   				}, {
   					field : 'pbrand',
   					title : 'Brand',
   				}, {
   					field : 'psize',
   					title : 'Size',
   				}, 	
   				{
   					field : 'pprice',
   					title : 'Price'
   				}, {
   					field : 'pdiscount',
   					title : 'Discount',
   				}, {
   					field : 'plocation',
   					title : 'Shopping place'
   				},{
   					field : 'producedate',
   					title : 'Produce Date'
   				}, {
   					field : 'purchasedate',
   					title : 'Purchase Date',
   				}, {
   					field : 'expiration',
   					title : 'Expiration'
   				},{
   					field : 'pdesc',
   					title : 'Description'
   				},{
   					field : 'catename',
   					title : 'Category'
   				},	
   				
   				{
   					title : 'operation',
   					toolbar : '#barDemo',
   					width : 165,
   					align : 'center'
   				}
               ]]
           });
        });
    });
</script>

<div class="demoTable">
    Product Name：
    <div class="layui-inline">
        <input class="layui-input" id="pname">
    </div>
    <button class="layui-btn" id="search-but"><i class="layui-icon">&#xe615;</i>Search</button>
    <button class="layui-btn  layui-btn-normal" id="add-but"><i class="layui-icon">&#xe654;</i>Add</button>
    <button class="layui-btn layui-btn-danger" id="removeBatch-but"><i class="layui-icon">&#xe640;</i> Batch Delete</button>
</div>
<%--表格--%>
<div id="demo" lay-filter="test"></div>
</body>
</html>
