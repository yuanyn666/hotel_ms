<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SerchProductSal.jsp' starting page</title>
    <style type="text/css">
    body {
	width:1024px;
	height:auto;
}
    </style>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="themes2/icon.css">
	<link rel="stylesheet" type="text/css" href="themes2/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap1.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min1.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive1.css">
	<link rel="stylesheet" type="text/css" href="css/pace-theme-barber-shop1.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
	<script type="text/javascript" src="js/pace.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<!--<script type="text/javascript" src="js/jquery.table2excel.min.js"></script>
	可以导出excl文档
	
  --></head>
  <body>
  <div style="width: 1000px;height: auto; margin: 5px auto;">
  <form method="post" class="form-horizontal" id="aa">
  	<div style="position: relative; margin-left: 10px;margin-top: 20px">
  		<label for="inputPassword" class="control-label" style="float: left;">操作人名：</label><input type="text"  name="spendName" id="spendName" class="form-control" placeholder="请输入操作人姓名"  style="width: 200px;float: left;"/>
  		<input type="button" value="查看未完成交班" id="btn11"  class="btn" style="margin-left: 35px"/>
  		<div style="clear: both"></div>
  		<div style="margin-top: 20px">
  		<label for="inputPassword" >开始日期：</label><input type="text"  id="begin" name="begin" class="easyui-datebox"  style="width: 200px;" data-options="formatter:myformatter,parser:myparser" />
  		<label for="inputPassword" style="margin-left: 30px">结束日期：</label><input type="text"  id="end" name="end"  class="easyui-datebox"  style="width: 200px;" data-options="formatter:myformatter,parser:myparser"/>
  		<input type="button" value="搜索" id="btn1"  class="btn" style="margin-left: 20px"/>
  		</div>
  	</div>
  	</form>
  	<div style="clear: both"></div>
  	<div style="margin-left: 10px;margin-top: 20px">
	<table class="table table-bordered"  id="dg" style="width:990px;height:500px"
			url=Serchjiaojie
			title="查看交接"
			striped="true"
			pagination="true"
			pageList="[5,10,20,30,40]"
			pageSize="10"
			singleSelect="true" fitColumns="true">
		<thead>
			<tr>
				<th field="jiaoid" align="center" width="166">交接号</th>
				<th field="names" align="center" width="166">交接人</th>
				<th field="biaoshi" align="center" width="166">交接遗留</th>
				<th field="jtime" align="center" width="166">交接时间</th>
				<th field="xiuname" align="center" width="166">完成人姓名</th>
				<th field="xiutime" width="166" align="center">完成时间</th>
			</tr>
		</thead>
	</table>
	</div>
	</div>
	
	<!--<button id="mm">导出按钮</button>
	-->
	<script type="text/javascript">
	$('#dg').datagrid({//显示数据
	view: detailview,
	detailFormatter:function(index,row){
		return '<div style="padding:2px"><table class="ddv"></table></div>';
	},
	onDblClickRow:function(rowIndex,rowDate){
		if(rowDate.biaoshi=='无'){
			alert("交接遗留为无，不需要修改完成");
		}else{
		var spendId=rowDate.jiaoid;
		$.ajax({
  					type:"post",
  					url:'SerchjiaojieInfo2',
    				data:{spendId:spendId},
   					 async:false,//把异步提交关闭，设置为同步提交
      					 });
			layer.open({
  type: 2 //Page层类型
  ,area: ['450px', '350px']
  ,title: '处理遗留'
  ,shade: 0.6 //遮罩透明度
  ,anim: 3 //0-6的动画形式，-1不开启
  ,content: 'view/updatejiaojie.jsp',
  offset: '70px',
  resize:false
});
		}
	},
	onExpandRow: function(index,row){
		var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
		ddv.datagrid({
			url:'SerchjiaojieInfo?spendId='+row.jiaoid,
			fitColumns:true,
			singleSelect:true,
			rownumbers:true,
			loadMsg:'',
			height:'auto',
			columns:[[
				{field:'beizhu',title:'交接备注',width:100},
			]],
			onResize:function(){
				$('#dg').datagrid('fixDetailRowHeight',index);//明细的显示
			},
			onLoadSuccess:function(){
				setTimeout(function(){
					$('#dg').datagrid('fixDetailRowHeight',index);
				},0);
			}
		});
		$('#dg').datagrid('fixDetailRowHeight',index);
	}
});



	$("#btn1").click(function(){//条件搜索
			var spendName=$("#spendName").val();
			var begin=$('#begin').textbox('getValue');
			var end=$('#end').textbox('getValue');;//附加条件进行数据加载
			var grid = $('#dg');
			var options = grid.datagrid('getPager').data("pagination").options;
			var page = options.pageNumber;//当前页数  
		 	var rows = options.pageSize;//每页的记录数（行数）  
				if(begin>end&&end!=""){
				$.messager.alert('警告','开始日期不能大于结束日期');//设置开始的日期不鞥大于结束日期
				return;
			}
			$("#dg").datagrid('load',{spendName:spendName,begin:begin,end:end,page:page,rows:rows});
			});
			
			
		$("#btn11").click(function(){//条件搜索
			var spendName=$("#spendName").val();
			var begin=$('#begin').textbox('getValue');
			var end=$('#end').textbox('getValue');;//附加条件进行数据加载
			var pan="wei";
			var grid = $('#dg');
			var options = grid.datagrid('getPager').data("pagination").options;
			var page = options.pageNumber;//当前页数  
		 	var rows = options.pageSize;//每页的记录数（行数）  
				if(begin>end&&end!=""){
				$.messager.alert('警告','开始日期不能大于结束日期');//设置开始的日期不鞥大于结束日期
				return;
			}
			$("#dg").datagrid('load',{spendName:spendName,begin:begin,end:end,page:page,rows:rows,pan:pan});
			});
		
		
   		function myformatter(date){//修改时间格式
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		function myparser(s){//修改时间格式
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0],10);
			var m = parseInt(ss[1],10);
			var d = parseInt(ss[2],10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
				return new Date(y,m-1,d);
			} else {
				return new Date();
			}
		}
	</script>
  </body>
</html>
