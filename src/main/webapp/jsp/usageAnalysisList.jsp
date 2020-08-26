<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Year Use Analysis</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<script src="../layui/layui.js"></script>




<script type="text/javascript">
    layui.use(['layer', 'table', 'jquery', 'form'], function () {
        const layer = layui.layer;
        const table = layui.table;
        const $ = layui.$;
        const form = layui.form;


        $("#search-but").click(function () {
            table.reload('demo', {
                where: {
                    years: $("#years").val()
                }
            })
        })
        // 表格数据渲染
        table.render({
            elem: '#demo'
            , url: '../usageController/yearUsageInfo' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
             
               {field: 'useyear', title: 'Use Year'},
               {field: 'totalprice', title: 'Total Use Price '}
                
            ]]
        });
    })
</script>

<div class="demoTable">
    Years：
    <div class="layui-inline">
        <input class="layui-input" id="years">
    </div>
    <button class="layui-btn" id="search-but"><i class="layui-icon">&#xe615;</i> 查询</button>

</div>
<%--表格--%>
<div id="demo" lay-filter="test"></div>
</body>
</html>
