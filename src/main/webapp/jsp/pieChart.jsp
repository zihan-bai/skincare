<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
 <style>
    
    .box{
        width:1400px;
        height:700px;
        background-color:white;
    }
     
 
    </style>
    <link rel="stylesheet" href="../css/index.css"/> 
    <!--引入-->
    <script src="../echarts/echarts.min.js"></script>


</head>
<body>
<script src="../layui/layui.js"></script>

<script type="text/javascript">



</script>



  <!--容器-->
  <form class="layui-form" action="">
  	 <div class="layui-form-item">
            <label class="layui-form-label"> Years </label>
            <div class="layui-input-block">
                <select name="purchasedate" id="select-options" lay-verify="required">
                </select>
            </div>
        </div>
        
    </form>
        
<div class="box">
		
</div>
<script src="../js/pieEcharts.js"></script>
</body>
</html>