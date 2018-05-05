<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
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
  </head>
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
  		<div style="float: left">单号查询：<input type="text" style="width: 140px;" id="spanid"/>
  		<span style="margin-left: 20px;"> 状态查询：</span><select id="start" name="start"style="width: 155px;">
  					<option value="全部" selected="selected">全部</option>
  					<option value="未付款">未付款</option>
  					<option value="已付款">已付款</option>
  				</select> 
  		<input type="button" value="搜索" id="btn1"  class="btn" style="margin-left: 30px; width: 80px; height: 30px;"/>
  		</div>
  		<!-- 
  		<span style="margin-left: 50px; border: 1px solid red; width: 300px; height: 90px; display: block; float: left">
  		<p style="font-size: 14px; font-weight: bold; margin-left: 110px;" >使用小贴士</p>
  		<span style="color: red;margin-left: 20px;">①单击+号可以查看订单商品与数量</span><br/>
  		<span style="color: red;margin-left: 20px;">②双击订单信息可查看订单详情进行完善付款</span><br/>
  		</span>
  		 -->
  	</div>
  	</form>
  	<div style="clear: both"></div>
  	<div style="margin-left: 80px;margin-top: 10px">
	<table id="dg" style="width:700px;height:300px"
			url=FindPurPay
			pagination="true" sortName="payId" sortOrder="desc"
			title="查看付款订单"
			singleSelect="true" fitColumns="true">
		<thead>
			<tr>
				<th field="payId" align="center" width="166">付款单号</th>
				<th field="orderid" align="center" width="166">采购单号</th>
				<th field="payTime" widths="166" align="center">生成日期</th>
				<th field="payMoney" widths="166" align="center">付款金额</th>
				<th field="names" widths="166" align="center">申请人</th>
				<th field="namec" widths="166" align="center">共同申请人</th>
				<th field="checkState" widths="166" align="center">状态</th>
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
   ,resize: false
  ,area: ['700px', '650px']
  ,title: '付款订单详情页面'
  ,shade: 0.6 //遮罩透明度
  ,anim: 4 //0-6的动画形式，-1不开启
  ,content: 'listPayDetail?id='+rowData.payId,
  offset: '70px',
  cancel: function(){ 
  parent.location.reload();
}
});
		},
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
