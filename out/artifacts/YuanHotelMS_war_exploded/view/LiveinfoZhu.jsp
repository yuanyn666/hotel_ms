<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'LiveinfoZhu.jsp' starting page</title>
    
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
    <link rel="stylesheet" type="text/css" href="css/pace-theme-barber-shop1.css">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
	<script type="text/javascript" src="js/pace.js"></script>
	<style type="text/css">
	#tw{
border: 1px solid black;
width:1000px; 
height:600px;
text-align:center;
font-size: 12px;
}
#m{ height: 30px;}

	</style>

  </head>
  
  <body>
  <form method="post" >
    <table class="table table-striped table-hover ">
  <tr>
  <td colspan="11">客户姓名：<input type="text" name="customerName" id="m">
  <input type="button" class="btn btn-default" value="模糊查询" id="btn1"/><br/><br>
  </td>
      </tr>
  </table>
  </form>
 
  <table class="table table-bordered"  id="tw"
  			url=live
			title="查看入住信息"
			striped="true"
			pagination="true"
			pageList="[1,10,20,30,40]"
			pageSize="10"
			singleSelect="true" fitColumns="true">
			<thead>
			<tr>


				<th field="liveId" align="center">入住编号</th>
				<th field="customerName" align="center">客户名称</th>
				<th field="cTypeName" align="center">客户类型</th>
				<th field="customerSex" align="center">客户性别</th>
				<th field="cardType" align="center">证件类型</th>
				<th field="cardId" align="center">证件号码</th>
				<th field="phone" align="center">联系电话</th>
				<th field="address" align="center">地址</th>
				<th field="liveNum" align="center">入住人数</th>
				<th field="liveTime" align="center">入住日期</th>
				<th field="liveDays" align="center">入住天数</th>
				<th field="names" align="center">操作人</th>
				<th field="liveMoney" align="center">总额</th>
			</tr>
		</thead>
  </table>
   <script type="text/javascript">
   	$('#tw').datagrid({//显示数据
	view: detailview,
	detailFormatter:function(index,row){
		return '<div style="padding:2px"><table class="ddv"></table></div>';
	},
	onExpandRow: function(index,row){
		$('#tw').datagrid('fixDetailRowHeight',index);
	}
});

	$("#btn1").click(function(){//条件搜索
			
			var spendName=$("#m").val();
			var grid = $('#tw');
			var options = grid.datagrid('getPager').data("pagination").options;
			var page = options.pageNumber;//当前页数  
		 	var rows = options.pageSize;//每页的记录数（行数）  
			$("#tw").datagrid('load',{spendName:spendName,page:page,rows:rows});
			});
		
   </script>
  </body>
</html>
