<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findSale.jsp' starting page</title>
    
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
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
 	
 	<script type="text/javascript" src="layer/layer.js"></script>
 	</head>
  <body>
  <div>
  <form method="post" class="form-horizontal" id="aa">
  	<div style="width:600px; font-size: 15px; margin-left: 80px;margin-top: 20px">
  		<p>开始日期：<input type="text"  id="begin" name="begin" class="easyui-datebox"  style="width: 200px;" data-options="formatter:myformatter,parser:myparser" /></p>
  		<p>结束日期：<input type="text"  id="end" name="end"  class="easyui-datebox"  style="width: 200px;" data-options="formatter:myformatter,parser:myparser"/>
  		<input value="搜索" id="btn1"  class="btn btn-default" style="margin-left: 50px;width: 80px;"/></p>
  		</div>
  	</form>
  	<div style="clear: both"></div>
  	<div style="margin-left: 80px;margin-top: 20px">
	<table id="dg" style="width:600px;height:300px"
			url=FindReturnsProduct
			pagination="true" sortName="returnId" sortOrder="desc"
			title="查看退货订单"
			singleSelect="true" fitColumns="true">
		<thead>
			<tr>
				<th field="returnId" align="center" width="166">退货单号</th>
				<th field="returnDate" widths="166" align="center">退货时间</th>
				<th field="returnStyle" widths="166" align="center">退款类型</th>
				<th field="userId" widths="166" align="center">退款人</th>
				<th field="userIdS" widths="166" align="center">共同退款人</th>
				<th field="mark" widths="166" align="center">退款说明</th>
			</tr>
		</thead>
	</table>
	</div>
	</div>
	<script type="text/javascript">
	$('#dg').datagrid({//显示数据
	view: detailview,
	detailFormatter:function(index,row){
		return '<div style="padding:2px"><table class="ddv"></table></div>';
	},
		
		
	onExpandRow: function(index,row){
		var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
		ddv.datagrid({
			url:'FindReturnsProductDetail?id='+row.returnId,
			fitColumns:true,
			singleSelect:true,
			rownumbers:true,
			loadMsg:'',
			height:'auto',
			columns:[[
				{field:'productId',title:'商品ID',width:100,sortable:true},
				{field:'price',title:'商品单价',width:100,sortable:true},
				{field:'returnNum',title:'退货数量',width:100,sortable:true},
				{field:'totalMoney',title:'应退金额',width:100,sortable:true},
				{field:'returnMoney',title:'实退金额',width:100,sortable:true},
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
			var spendId=$("#spendId").val();
			var liveId=$("#liveId").val();
			var spendName=$("#spendName").val();
			var begin=$('#begin').textbox('getValue');
			var end=$('#end').textbox('getValue');;//附加条件进行数据加载
				if(begin>end&&end!=""){
				$.messager.alert('警告','开始日期不能大于结束日期');//设置开始的日期不鞥大于结束日期
				return;
			}
			$("#dg").datagrid('load',{spendId:spendId,liveId:liveId,spendName:spendName,begin:begin,end:end});
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
