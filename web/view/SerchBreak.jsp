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
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<!--<script type="text/javascript" src="js/jquery.table2excel.min.js"></script>
	可以导出excl文档
	
  --></head>
  <body>
  <div style="width: 1000px;height: auto; margin: 5px auto;">
  <form method="post" class="form-horizontal" id="aa">
  	<div style="position: relative; margin-left: 10px;margin-top: 20px">
  		<label for="inputPassword" class="control-label" style="float: left;">损坏单号：</label><input type="text"  name="spendId" id="spendId" class="form-control" placeholder="输入消费单号"  style="width: 200px;float: left;"/>
  		<label for="inputPassword" class="control-label" style="float: left;margin-left: 30px">入住单号：</label><input type="text"  name="liveId" id="liveId" class="form-control" placeholder="请输入入住单号"  style="width: 200px;float: left;"/>
  		<label for="inputPassword" class="control-label" style="float: left;margin-left: 30px">客人姓名：</label><input type="text"  name="spendName" id="spendName" class="form-control" placeholder="请输入客人姓名"  style="width: 200px;float: left;"/>
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
			url=SerchBreak
			title="查看损坏账单"
			striped="true"
			pagination="true"
			pageList="[5,10,20,30,40]"
			pageSize="10"
			singleSelect="true" fitColumns="true">
		<thead>
			<tr>
				<th field="breakId" align="center" width="166">损坏单号</th>
				<th field="roomId" align="center" width="166">入住单号</th>
				<th field="remark" align="center" width="166">备注</th>
				<th field="breakTime" align="center" width="166">时间</th>
				<th field="customername" align="center" width="166">姓名</th>
				<th field="names" width="166" align="center">操作人</th>
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
	onExpandRow: function(index,row){
		var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
		ddv.datagrid({
			url:'SerchBreakInfo?spendId='+row.breakId,
			fitColumns:true,
			singleSelect:true,
			rownumbers:true,
			loadMsg:'',
			height:'auto',
			columns:[[
				{field:'breakName',title:'损坏名称',width:100},
				{field:'fineMoney',title:'赔付款',width:100},
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
			var grid = $('#dg');
			var options = grid.datagrid('getPager').data("pagination").options;
			var page = options.pageNumber;//当前页数  
		 	var rows = options.pageSize;//每页的记录数（行数）  
				if(begin>end&&end!=""){
				$.messager.alert('警告','开始日期不能大于结束日期');//设置开始的日期不鞥大于结束日期
				return;
			}
			$("#dg").datagrid('load',{spendId:spendId,liveId:liveId,spendName:spendName,begin:begin,end:end,page:page,rows:rows});
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
		//导出excl文档
		/*$(function(){
        $("body").on("click","button",function(){
            exportExcel();
        });
        function exportExcel(){
            $(".table").table2excel({
                exclude: ".noExl",//不导出的表格数据选择器，不导出的数据加class加上 noExl就可以了
                name: "Excel Document Name",
                filename: "myFileName",
                fileext: ".xls",
                exclude_img: true,
                exclude_links: true,
                exclude_inputs: true
            });
        }
    })
		*/
	</script>
  </body>
</html>
