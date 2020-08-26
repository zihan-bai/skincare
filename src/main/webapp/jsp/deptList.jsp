<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>部门信息管理</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<script src="../layui/layui.js"></script>
<%--添加对话框--%>
<script type="text/html" id="add-dialog">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">部门名称</label>
            <div class="layui-input-block">
                <input type="text" name="dname" required lay-verify="required" placeholder="请输入部门名称"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="save-form">保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</script>

<%--修改对话框--%>
<script type="text/html" id="edit-dialog">
    <form class="layui-form" action="" lay-filter="edit-form">
        <div class="layui-form-item">
            <label class="layui-form-label">部门名称</label>
            <div class="layui-input-block">
                <input type="text" name="dname" required lay-verify="required" placeholder="请输入部门名称"
                       class="layui-input">
                <input type="hidden" name="did" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="edit-form">保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</script>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="remove"><i class="layui-icon">&#xe640;</i>删除</a>
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
                layer.confirm('是否删除?删除后数据不能恢复', {icon: 3, title: '提示'}, function () {
                    $.post('../deptController/removeDeptInfo', {did: obj.data.did}, function (flag) {
                        if (flag) {
                            table.reload('demo', {});
                            layer.msg('操作成功', {icon: 6});
                        } else {
                            layer.msg('操作失败', {icon: 5});
                        }
                    })
                });

            } else if (layEvent === 'edit') {
                layer.open({
                    type: 1,
                    title: '修改部门信息',
                    area: ['500px'],
                    content: $("#edit-dialog").html()
                });
                form.val('edit-form', {   //填充修改表单数据
                    'did': obj.data.did,
                    'dname': obj.data.dname
                })
            }
        });
        //更新数据
        form.on('submit(edit-form)', function (data) {
            $.post('../deptController/updateDeptInfo', data.field, function (flag) {
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
                layer.msg('请选择要删除的数据');
            } else {
                const dids = [];
                for (var i = 0; i < array.length; i++) {
                    dids.push(array[i].did);
                }
                $.post('../deptController/removeBatchDeptInfo', {"dids[]": dids}, function (flag) {
                    if (flag) {
                        layer.msg('操作成功', {icon: 6});
                        table.reload('demo', {}); //表格重载数据
                    } else {
                        layer.msg('操作失败', {icon: 5});
                    }
                })
            }

        })
        //弹出添加对话框
        $("#add-but").click(function () {
            layer.open({
                type: 1,
                title: '添加部门信息',
                area: ['500px'],
                content: $("#add-dialog").html()
            });
        })
        //添加数据
        form.on('submit(save-form)', function (data) {
            console.log(data.field);
            $.post('../deptController/saveDeptInfo', data.field, function (flag) {
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
            , url: '../deptController/listPage' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {field: 'did', title: '部门ID', type: 'checkbox'}
                , {field: 'dname', title: '部门名称'},
                , {title: '操作', toolbar: '#barDemo', width: 165, align: 'center'}
            ]]
        });
    })
</script>

<div class="demoTable">
    部门名称：
    <div class="layui-inline">
        <input class="layui-input" id="dname">
    </div>
    <button class="layui-btn" id="search-but"><i class="layui-icon">&#xe615;</i> 查询</button>
    <button class="layui-btn  layui-btn-normal" id="add-but"><i class="layui-icon">&#xe654;</i>添加</button>
    <button class="layui-btn layui-btn-danger" id="removeBatch-but"><i class="layui-icon">&#xe640;</i> 批量删除</button>
</div>
<%--表格--%>
<div id="demo" lay-filter="test"></div>
</body>
</html>
