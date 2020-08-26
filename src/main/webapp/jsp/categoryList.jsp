<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<script src="../layui/layui.js"></script>
<%--添加对话框--%>
<script type="text/html" id="add-dialog">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">Category Name</label>
            <div class="layui-input-block">
                <input type="text" name="catename" required lay-verify="required" placeholder="please enter category name "
                       class="layui-input">
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
            <label class="layui-form-label">Category Name</label>
            <div class="layui-input-block">
                <input type="text" name="catename" required lay-verify="required" placeholder="please enter category name"
                       class="layui-input">
                <input type="hidden" name="cateid" class="layui-input">
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
    <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>Edit</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="remove"><i class="layui-icon">&#xe640;</i>Delete</a>
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
            if (layEvent === 'remove') {
                layer.confirm('Are you sure to delete?', {icon: 3, title: 'Alarm'}, function () {
                    $.post('../categoryController/removeOneCategoryInfo', {cateid: obj.data.cateid}, function (flag) {
                        if (flag) {
                            table.reload('demo', {});
                            layer.msg('Successful', {icon: 6});
                        } else {
                            layer.msg('Failed', {icon: 5});
                        }
                    })
                });

            } else if (layEvent === 'edit') {
                layer.open({
                    type: 1,
                    title: 'Edit Category Info',
                    area: ['500px'],
                    content: $("#edit-dialog").html()
                });
                form.val('edit-form', {   //填充修改表单数据
                    'cateid': obj.data.cateid,
                    'catename': obj.data.catename
                })
            }
        });
        //更新数据
        form.on('submit(edit-form)', function (data) {
            $.post('../categoryController/updateCategoryInfo', data.field, function (flag) {
                if (flag) {
                    layer.msg('操作成功', {icon: 6});
                    table.reload('demo', {}); //表格重载数据
                    layer.closeAll('page');//关闭弹出对话框
                } else {
                    layer.msg('操作失败', {icon: 5});
                }
            })
            return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
        })

        //批量删除
        $("#removeBatch-but").click(function () {

            const array = table.checkStatus('demo').data;
            if (array.length == 0) {
                layer.msg('please selct the category you want to delete');
            } else {
                const cateids = [];
                for (var i = 0; i < array.length; i++) {
                	cateids.push(array[i].cateid);
                }
                $.post('../categoryController/removeBatchCategoryInfo', {"cateids[]": cateids}, function (flag) {
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
            layer.open({
                type: 1,
                title: 'add category Info',
                area: ['500px'],
                content: $("#add-dialog").html()
            });
        })
        //添加数据
        form.on('submit(save-form)', function (data) {
            console.log(data.field);
            $.post('../categoryController/saveCategoryInfo', data.field, function (flag) {
                if (flag) {
                    layer.msg('successed', {icon: 6});
                    table.reload('demo', {}); //表格重载数据
                    layer.closeAll('page');//关闭弹出对话框
                } else {
                    layer.msg('faileded', {icon: 5});
                }
            })
            return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
        })
        //表格条件查询

        $("#search-but").click(function () {
            table.reload('demo', {
                where: {
                    catename: $("#catename").val()
                }
            })
        })
        // 表格数据渲染
        table.render({
            elem: '#demo'
            , url: '../categoryController/categoryListPage' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {field: 'cateid', title: 'Category ID', type: 'checkbox'}
                , {field: 'catename', title: 'Category Name'},
                , {title: 'Operation', toolbar: '#barDemo', width: 165, align: 'center'}
            ]]
        });
    })
</script>

<div class="demoTable">
    Category Name：
    <div class="layui-inline">
        <input class="layui-input" id="catename">
    </div>
    <button class="layui-btn" id="search-but"><i class="layui-icon">&#xe615;</i>Search</button>
    <button class="layui-btn  layui-btn-normal" id="add-but"><i class="layui-icon">&#xe654;</i>Add</button>
    <button class="layui-btn layui-btn-danger" id="removeBatch-but"><i class="layui-icon">&#xe640;</i>Batch Delete</button>
</div>
<%--表格--%>
<div id="demo" lay-filter="test"></div>
</body>
</html>
