<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<link rel="stylesheet" type="text/css" href="themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
 	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
 	<script type="text/javascript" src="layer/layer.js"></script>
  <body>
  <div>
  <form method="post" class="form-horizontal" id="aa">
  	<div style="position: relative; margin-left: 80px;margin-top: 10px">
  		<div style="margin-top: 0px;float: left">
  		<div style="float: left"><label for="inputPassword" style="float: left;margin-top: 5px;" >开始日期：</label>
  		<input type="text"  id="begin" name="begin" class="easyui-datebox"  style="width: 150px;float: left" data-options="formatter:myformatter,parser:myparser" /></div>
  		<div style="float: left"><label for="inputPassword" style="margin-left: 30px;float: left;margin-top: 5px;">结束日期：</label>
  		<input type="text"  id="end" name="end"  class="easyui-datebox"  style="width: 150px;float: left" data-options="formatter:myformatter,parser:myparser"/></div>
  		</div><br/><br/>
  		<div style="float: left">单号查询：<input type="text" style="width: 150px;" id="spanid"/>
  		<span style="margin-left: 25px;"> 状态查询：</span><select id="start" name="start"style="width: 155px;">
  					<option value="全部" selected="selected">全部</option>
  					<option value="未付款">未付款</option>
  					<option value="已付款">已付款</option>
  				</select> 
  		<input type="button" value="搜索" id="btn1"  class="btn" style="margin-left: 30px; width: 80px; height: 30px;"/>
  		</div>
  		
  		
  		<!-- <span style="margin-left: 50px; border: 1px solid red; width: 300px; height: 90px; display: block; float: left">
  		<p style="font-size: 14px; font-weight: bold; margin-left: 110px;" >使用小贴士</p>
  		<span style="color: red;margin-left: 20px;">①单击+号可以查看订单商品与数量</span><br/>
  		<span style="color: red;margin-left: 20px;">②双击订单信息可查看订单详情进行付款</span><br/>
  		</span> -->
  	</div>
  	</form>
  	<div style="clear: both"></div>
  	<div style="margin-left: 80px;margin-top: 10px">
	<table id="dg" style="width:600px;height:300px"
			url=FindPurchaseOrder
			pagination="true" sortName="orderId" sortOrder="desc"
			title="查看采购订单"
			singleSelect="true" fitColumns="true">
		<thead>
			<tr>
				<th field="orderId" align="center" width="166">采购单号</th>
				<th field="planId" widths="166" align="center">计划单号</th>
				<th field="orderDate" widths="166" align="center">申请时间</th>
				<th field="names" widths="166" align="center">采购人</th>
				<th field="namec" widths="166" align="center">共同采购人</th>
				<th field="state" widths="166" align="center">状态</th>
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
	
	onDblClickRow:function(rowIndex, rowData){
		layer.open({
  type: 2 //Page层类型
  ,area: ['700px', '600px']
  ,resize: false
  ,title: '<span style=" font-weight: bold">采购订单</span><span style="margin-left: 30px;"></span>'
  ,shade: 0.6 //遮罩透明度
  ,anim: 4 //0-6的动画形式，-1不开启
  ,content: 'ListOrderDetail?id='+rowData.orderId+'&&st='+rowData.state,
  offset: '70px',
  cancel: function(){ 
  parent.location.reload();
}
});
		},

		
	onExpandRow: function(index,row){
		var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
		ddv.datagrid({
			url:'FindOrderDetail?id='+row.orderId,
			fitColumns:true,
			singleSelect:true,
			rownumbers:true,
			loadMsg:'',
			height:'auto',
			columns:[[
				{field:'productId',title:'商品ID',width:100,sortable:true},
				{field:'productName',title:'商品名称',width:100,sortable:true},
				{field:'buyPrice',title:'商品单价',width:100,sortable:true},
				{field:'productSum',title:'商品数量',width:100,sortable:true},
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
			var start = $("#start").val();
			var spanid=$("#spanid").val();
			var begin=$('#begin').textbox('getValue');
			var end=$('#end').textbox('getValue');;//附加条件进行数据加载
				if(begin>end&&end!=""){
				$.messager.alert('警告','开始日期不能大于结束日期');//设置开始的日期不鞥大于结束日期
				return;
			}
			$("#dg").datagrid('load',{spanid:spanid,start:start,begin:begin,end:end});
			});
			
			
			$("#spanid").keyup(function(){
		var start = $("#start").val();
		var spanid=$("#spanid").val();
		var begin=$('#begin').textbox('getValue');
		var end=$('#end').textbox('getValue');;//附加条件进行数据加载
				if(begin>end&&end!=""){
				$.messager.alert('警告','开始日期不能大于结束日期');//设置开始的日期不鞥大于结束日期
				return;
			}
		$("#dg").datagrid('load',{spanid:spanid,start:start,begin:begin,end:end});
	})
			
		
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
