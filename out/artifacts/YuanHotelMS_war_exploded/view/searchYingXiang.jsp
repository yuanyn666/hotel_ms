<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Profit.jsp' starting page</title>
      <style type="text/css">
    body {
	width:900px;
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
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
		<link rel="stylesheet" type="text/css" href="themes2/icon.css">
		<link rel="stylesheet" type="text/css" href="themes2/bootstrap/easyui.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap1.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min1.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive1.css">
		<link rel="stylesheet" href="css/demo1.css" type="text/css"/>
		<link rel="stylesheet" type="text/css" href="css/pace-theme-barber-shop1.css">
		<link rel="stylesheet" type="text/css" href="css/d.css">
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/datagrid-detailview.js"></script>
		<script type="text/javascript" src="js/ichart.1.2.min.js"></script>
		<script type="text/javascript" src="js/pace.js"></script>
		<script type="text/javascript" src="js/d.js"></script><!-- 让字体动态显示 -->
	 <body>
	 <ul id="myTab" class="nav nav-tabs">
	<li class="active"><a href="#home" data-toggle="tab">客人消费</a></li>
	<li id="ss2"><a href="#ios" data-toggle="tab">客人退房</a></li>
	<li id="ss"><a href="#opa" data-toggle="tab">采购退货</a></li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="home">
		<table id="dg" style="width:990px;height:500px"
			url=SerchProductying
			 sortName="spendName" sortOrder="desc"
			title="客人消费"
			pagination="true"
			pageList="[1,5,10,20,30,40]"
			pageSize="10"
			singleSelect="true" fitColumns="true">
		<thead>
			<tr>
				<th field="spendId" align="center" width="166">消费单号</th>
				<th field="liveId" align="center" width="166">入住单号</th>
				<th field="mark" align="center" width="166">备注</th>
				<th field="spendTime" align="center" width="166">消费时间</th>
				<th field="customerName" align="center" width="166">消费所用姓名</th>
				<th field="names" width="166" align="center">操作人</th>
			</tr>
		</thead>
	</table>
	</div>
	
	<div class="tab-pane fade" id="ios">
		<table id="tuijie" style="width:990px;height:500px"
			url=selectjie
			title="客人退房"
			pagination="true"
			pageList="[1,5,10,20,30,40]"
			pageSize="10"
			singleSelect="true" fitColumns="true">
		<thead>
			<tr>
				<th field="checkId" align="center" width="190">结算单号</th>
				<th field="liveId" align="center" width="190">入住单号</th>
				<th field="realDays" align="center" width="190">实住天数</th>
				<th field="money" align="center" width="190">付款金额</th>
				<th field="checkTime" align="center" width="190">时间</th>
			</tr>
		</thead>
	</table>
	</div>
	
	<div class="tab-pane fade" id="opa">
		<table id="protui" style="width:990px;height:500px"
			url=selecttui
			title="采购退货"
			pagination="true"
			pageList="[1,5,10,20,30,40]"
			pageSize="10"
			singleSelect="true" fitColumns="true">
		<thead>
			<tr>
				<th field="returnId" align="center" width="210">退货单号</th>
				<th field="returnDate" align="center" width="210">日期</th>
				<th field="returnStyle" align="center" width="210">付款类型</th>
				<th field="mark" align="center" width="210">备注</th>
			</tr>
		</thead>
	</table>
	</div>
</body>
 		<script type="text/javascript">;
 		var npp=0;//用来判断是不是重新加载单个页面
 		var npp2=0;
 			$('#dg').datagrid({//显示数据客人消费
	view: detailview,
	detailFormatter:function(index,row){
		return '<div style="padding:2px"><table class="ddv"></table></div>';
	},
	onExpandRow: function(index,row){
		var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
		ddv.datagrid({
			url:'SerchProductSalInfo?spendId='+row.spendId,
			fitColumns:true,
			singleSelect:true,
			rownumbers:true,
			loadMsg:'',
			height:'auto',
			columns:[[
				{field:'productname',title:'商品的名称',width:100},
				{field:'gcodnum',title:'商品的数量',width:100},
				{field:'spendMoney',title:'付款数',width:100},
				{field:'spendTime',title:'时间',width:100}
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
 	
 	function aadf(){//显示结账
 		$('#tuijie').datagrid({//显示数据
	view: detailview,
	detailFormatter:function(index,row){
		return '<div style="padding:2px"><table class="ddv"></table></div>';
	},
	onExpandRow: function(index,row){
		var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
		ddv.datagrid({
			url:'selectjieinfo?liveId='+row.liveId,
			fitColumns:true,
			singleSelect:true,
			rownumbers:true,
			loadMsg:'',
			height:'auto',
			columns:[[
				{field:'liveId',title:'入住单号',width:80},
				{field:'roomId',title:'房间号',width:80},
				{field:'customerName',title:'客人姓名',width:80},
				{field:'phone',title:'联系电话',width:80},
				{field:'liveTime',title:'入住日期',width:80},
				{field:'liveDays',title:'入住天数',width:80}
			]],
			onResize:function(){
				$('#tuijie').datagrid('fixDetailRowHeight',index);//明细的显示
			},
			onLoadSuccess:function(){
				setTimeout(function(){
					$('#tuijie').datagrid('fixDetailRowHeight',index);
				},0);
			}
		});
		$('#tuijie').datagrid('fixDetailRowHeight',index);
	}
});
 	}

function aadf2(){//显示退货
$('#protui').datagrid({//显示数据
	view: detailview,
	detailFormatter:function(index,row){
		return '<div style="padding:2px"><table class="ddv"></table></div>';
	},
	onExpandRow: function(index,row){
		var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
		ddv.datagrid({
			url:'selecttuiming?returnId='+row.returnId,
			fitColumns:true,
			singleSelect:true,
			rownumbers:true,
			loadMsg:'',
			height:'auto',
			columns:[[
				{field:'returnId',title:'退货商品',width:100},
				{field:'returnNum',title:'退货数量',width:100},
				{field:'price',title:'进货价',width:100},
				{field:'totalMoney',title:'应退金额',width:100},
				{field:'returnMoney',title:'实退金额',width:100}
			]],
			onResize:function(){
				$('#protui').datagrid('fixDetailRowHeight',index);//明细的显示
			},
			onLoadSuccess:function(){
				setTimeout(function(){
					$('#protui').datagrid('fixDetailRowHeight',index);
				},0);
			}
		});
		$('#dg').datagrid('fixDetailRowHeight',index);
	}
});
}

$("#ss2").click(function(){//点击tab的时候加载数据
 $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
 if(npp==0){
 	aadf();
 }
 npp-=1;
});
}); 
$("#ss").click(function(){//点击tab的时候加载数据
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
 if(npp2==0){
 	aadf2();
 }
 npp2-=1;
}); 
});
		</script>
</html>
