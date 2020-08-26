<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<script src="../layui/layui.js"></script>


<%--add roles dialog--%>
<script type="text/html" id="add-role-dialog">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">role name</label>
           <div class="layui-input-block">
             <select id="select-options" name="rid" lay-verify="required">
                   <option value="">please choose a role </option>
             </select>
           </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="save-role-form">save</button>
                <button type="reset" class="layui-btn layui-btn-primary">reset</button>
            </div>
        </div>
    </form>
</script>

<%--add用户对话框--%>
<script type="text/html" id="add-dialog">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">user name</label>
            <div class="layui-input-block">
                <input type="text" name="uname" required lay-verify="required" placeholder="please enter username"
                       class="layui-input">
            </div>

          <label class="layui-form-label">password</label>
            <div class="layui-input-block">
                <input type="text" name="password" required lay-verify="required" placeholder="please enter password"
                       class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="save-form">save</button>
                <button type="reset" class="layui-btn layui-btn-primary">reset</button>
            </div>
        </div>
    </form>
</script>

<%--修改对话框--%>
<script type="text/html" id="edit-dialog">
    <form class="layui-form" action="" lay-filter="edit-form">
        <div class="layui-form-item">
            <label class="layui-form-label">user name</label>
            <div class="layui-input-block">
                <input type="text" name="uname" required lay-verify="required" placeholder="please enter user name"
                       class="layui-input">
                <input type="hidden" name="uid" class="layui-input">
            </div>

        <label class="layui-form-label">password</label>
            <div class="layui-input-block">
                <input type="text" name="password" required lay-verify="required" placeholder="please enter user password"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="edit-form">save</button>
                <button type="reset" class="layui-btn layui-btn-primary">reset</button>
            </div>
        </div>
    </form>
</script>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>Edit</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="remove"><i class="layui-icon">&#xe640;</i>Delete</a>
    <a 	class="layui-btn layui-btn-xs" layui-btn-xs" lay-event="checkRole"><i class="layui-icon">&#xe770;</i>Check Roles</a>
</script>
<script type="text/javascript">
    layui.use(['layer', 'table', 'jquery', 'form'], function () {
        const layer = layui.layer;
        const table = layui.table;
        const $ = layui.$;
        const form = layui.form;
        //编辑和删除
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            //console.log(obj);
            const layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'remove') {
                layer.confirm('Are you sure you want to delete this user?', {icon: 3, title: '提示'}, function () {
                    $.post('../userController/removeOneUserInfo', {uid: obj.data.uid}, function (flag) {
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
                    title: 'edit user info',
                    area: ['500px'],
                    content: $("#edit-dialog").html()
                });
                form.val('edit-form', {   //填充修改表单数据
                    'uid': obj.data.uid,
                    'uname': obj.data.uname,
                    'password': obj.data.password
                })
            }else if(layEvent === 'checkRole'){// check the role
            	   $.post('../rolesController/getRoleInfo', {uid: obj.data.uid}, function (array) {
                       if (array.length>0) {
                           layer.msg("role name: " +array[0].rname+", role desc: "+ array[0].rdesc);
                       } else {
                           layer.msg("there is no role for this user");
                       }
                   })

            	
            }
 
        });
        //更新数据
        form.on('submit(edit-form)', function (data) {
            $.post('../userController/updateUsersInfo', data.field, function (flag) {
                if (flag) {
                    layer.msg('Successed', {icon: 6});
                    table.reload('demo', {}); //表格重载数据
                    layer.closeAll('page');//关闭弹出对话框
                } else {
                    layer.msg('Failed', {icon: 5});
                }
            })
            return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
        })

        //批量删除
        $("#removeBatch-but").click(function () {

            const array = table.checkStatus('demo').data;
            if (array.length == 0) {
                layer.msg('please choose at least one user to delete');
            } else {
                const uids = [];
                for (var i = 0; i < array.length; i++) {
                    uids.push(array[i].uid);
                }
                $.post('../userController/removeBatchUsersInfo', {"uids[]": uids}, function (flag) {
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
                title: 'add user info',
                area: ['500px'],
                content: $("#add-dialog").html()
            });
        })
        //添加数据
        form.on('submit(save-form)', function (data) {
            console.log(data.field);
            $.post('../userController/saveUsersInfo', data.field, function (flag) {
                if (flag) {
                    layer.msg('Successed', {icon: 6});
                    table.reload('demo', {}); //表格重载数据
                    layer.closeAll('page');//关闭弹出对话框
                } else {
                    layer.msg('Failed', {icon: 5});
                }
            })
            return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
        })
        //表格条件查询

        $("#search-but").click(function () {
            table.reload('demo', {
                where: {
                    uname: $("#uname").val()
                }
            })
        })
        
        
        //add role 添加角色/分配角色
         $("#addRole-but").click(function () {
            const array = table.checkStatus('demo').data;

            var uid = null;
            
            if (array.length == 0) {
                layer.msg('please choose the user you want to assign roles');
            } else if(array.length>1){
            	layer.msg('you can only choose one user to assign roles');
            }else{
            	
            $.post('../rolesController/listAllRolesInfo', {"uid": uid}, function (data) {
                   
                	//role下拉列表
               for(var i = 0;i<data.length;i++){
                		$("#select-options").append(			
                	"<option value='"+data[i].rid+"'>"+ data[i].rname  + "</option>"
                	);
	
               }
                	
                form.render();//role: 让下拉列表显示
                },'json')
                
                layer.open({
                	type:1,
                	title: 'add role information',
                	area: [ '500px', '250px' ],
                	content: $("#add-role-dialog").html()
                });
            	
            form.render();//role: 让下拉列表显示          	
            }	
        })
        
        
          //添加数据
        form.on('submit(save-role-form)', function (data) {
            //console.log(data.field);
            //get rid & uid 获得uid & rid
 //           {
 //           	rid:$('#select-options').val(),
 //           	uid: array[0].uid
 //           }      
            const array = table.checkStatus('demo').data;
            const uid = array[0].uid;
            $.post('../userController/saveRoleInfo', { rid: data.field.rid,uid: uid}, function (flag) {
                if (flag) {
                    layer.msg('Successed', {icon: 6});
                    table.reload('demo', {}); //表格重载数据
                    layer.closeAll('page');//关闭弹出对话框
                } else {
                    layer.msg('Failed', {icon: 5});
                }
            })
            return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
        })
       
        
        //deleteRole-but 删除角色信息
         $("#deleteRole-but").click(function () {

            const array = table.checkStatus('demo').data;
            if (array.length == 0) {
                layer.msg('please choose the user you want to delete the role');
            } else {
                const uids = [];
                for (var i = 0; i < array.length; i++) {
                    uids.push(array[i].uid);
     
            }
                
                $.post('../rolesController/deleteRole', {"uids[]": uids}, function (flag) {
                    if (flag) {
                        layer.msg('Successed', {icon: 6});
                        table.reload('demo', {}); //表格重载数据
                    } else {
                        layer.msg('Failed, please make sure that this user had roles', {icon: 5});
                    }
                })
            
                
                
            }

        })
        
        
        
        
        
        
        // 
        table.render({
            elem: '#demo'
            , url: '../userController/UsersListPage' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {field: 'uid', title: 'user ID', type: 'checkbox'}
                , {field: 'uname', title: 'User name'},
                {field: 'password', title: 'User password'},
                , {title: 'Operation', toolbar: '#barDemo', width: 165, align: 'center'}
            ]]
        });
    })
</script>

<div class="demoTable">
    User Name：
    <div class="layui-inline">
        <input class="layui-input" id="uname">
    </div>
    <button class="layui-btn" id="search-but"><i class="layui-icon">&#xe615;</i> Search</button>
    <button class="layui-btn  layui-btn-normal" id="add-but"><i class="layui-icon">&#xe654;</i>Add User</button>
    <button class="layui-btn layui-btn-danger" id="removeBatch-but"><i class="layui-icon">&#xe640;</i> Batch Delete Users</button>
    <button class="layui-btn layui-btn-warm" id="addRole-but"><i class="layui-icon">&#xe612;</i> Assign Roles</button>
    <button class="layui-btn layui-btn-danger" id="deleteRole-but"><i class="layui-icon">&#xe613;</i> Delete Roles</button>
</div>
<%--表格--%>
<div id="demo" lay-filter="test"></div>
</body>
</html>
