<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Usage Management</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<script src="../layui/layui.js"></script>

<%--feedbackdialog--%>
<script type="text/html" id="feedback-dialog">
    <form class="layui-form" action="" lay-filter="feedback-form">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="text" name="feedback" required lay-verify="required" 
                       class="layui-input">
                <input type="hidden" name="useid" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="feedback-form">Save</button>
                <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
            </div>
        </div>
    </form>	 

</script>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="undo"><i class="layui-icon">&#x1006;</i>Undo Usage</a>
    <a class="layui-btn layui-btn-xs" lay-event="feedback"><i class="layui-icon">&#xe642;</i>Feedback</a>
   
</script>
<script type="text/javascript">
    layui.use(['layer', 'table', 'jquery', 'form'], function () {
        const layer = layui.layer;
        const table = layui.table;
        const $ = layui.$;
        const form = layui.form;
        //编辑和删除
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            console.log(obj);
            const layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'undo') {
                layer.confirm('are you sure you want to undo the usage?', {icon: 3, title: '提示'}, function () {
                    $.post('../usageController/undoUsageInfo', {useid: obj.data.useid, pid: obj.data.pid}, function (flag) {
                        if (flag) {
                            table.reload('demo', {});
                            layer.msg('successed', {icon: 6});
                        } else {
                            layer.msg('failed', {icon: 5});
                        }
                    })
                });

            } else if(layEvent=== 'feedback'){
         	   layer.open({
                   type: 1,
                   title: 'your feedback about this product',
                   area: ['500px'],
                   content: $("#feedback-dialog").html(),
                   success: function(layero, index){
                	   form.val('feedback-form', {  
                           'useid': obj.data.useid,
                           'feedback': obj.data.feedback 
                       })
                       
                       
           
               
               
                	   
                	   
                   }
                  
               }); 
            	

             
               
               
               form.on('submit(feedback-form)', function (data) {
                   $.post('../usageController/addFeedback', data.field, function (flag) {
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
            	
            	
            }
            
            
            
            
            
        });
       
        //表格条件查询

        $("#search-but").click(function () {
            table.reload('demo', {
                where: {
                    dname: $("#dname").val()
                }
            })
        })
        // 表格数据渲染
        table.render({
            elem: '#demo'
            , url: '../usageController/usageListPage' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {field: 'useid', title: 'Usage ID', type: 'checkbox'},
                 {field: 'pname', title: 'Product Name'},
                 {field: 'usedate', title: 'Use Date'},     
                 {field: 'total', title: 'Actual Price', templet: '#cal_actualPrice'},
                 {field: 'feedback', title: 'Product Feedback'},
                 {title: 'Operation', toolbar: '#barDemo', width: 165, align: 'center'}
            ]]
        });
    })
</script>

<script type="text/html" id="cal_actualPrice">
    {{(d.pprice*d.pdiscount).toFixed(2)}}
</script>

<div class="demoTable">
    Product Name：
    <div class="layui-inline">
        <input class="layui-input" id="pname">
    </div>
    <button class="layui-btn" id="search-but"><i class="layui-icon">&#xe615;</i>Search</button>
   

</div>
<%--表格--%>
<div id="demo" lay-filter="test"></div>
</body>
</html>
