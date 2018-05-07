<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AddProductSal.jsp' starting page</title>
    <style>
body {
	color: #fff;
	background-image: url(img/bg2.jpg);
	background-size: cover;
	background-position: 50% 0;
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
	<link rel="stylesheet" type="text/css" href="css/pace-theme-barber-shop1.css"><!--进度条
	-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min1.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
	<script type="text/javascript" src="js/pace.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script><!-- 模态弹窗 -->
	<script type="text/javascript" src=js/jquery.ripples.js></script><!-- 水波背景 -->
  </head>
  <body style="width: 1300px; height: auto">
  <!--
  <input id="cg" style="width:150px"/>
  -->
  <input type="button" id="btns" value="查看历史的消费" style="margin-left: 10px" class="btn btn-success"/>
  <div id="win" style="margin: 0px">
  
  </div>
  
  <form action="InsertSpend" method="post" class="form-horizontal" onsubmit="return check()">
  <!--把布局树立显示-->
	<div style="position: relative; margin-left: 10px;margin-top: 20px">
  <label for="inputPassword" class="control-label" style="float: left;">消费单号：</label>
  
  <input type="text" value="${Spned}" readonly="readonly" name="Spnedid" class="form-control" style="width: 185px;float: left;"/>
  
  <label for="inputPassword" class="control-label" style="float: left;margin-left: 100px">客户姓名：</label>
  <input type="text" value="${name}" readonly="readonly" name="Spnedid" class="form-control" style="width: 100px;float: left;"/>
  
  <label class="control-label" style="float: left;margin-left: 120px" value="${myNames}">操作人：</label><input type="hidden" name="userId" value="${myUsers.userId }"/>
  
  <input type="text" value="${myNames }" readonly="readonly" name="name" class="form-control" style="width: 100px;float: left;"/>
  <input type="hidden" value="${liveid}" name="liveid" name="liveid" />
  </div>
  <div style="clear: both"></div>
  
  <div style="margin-left: 10px;margin-top: 50px">
  <select id="SelectProduct" class="easyui-combogrid" style="width:200px" data-options="
					panelWidth: 900,
					panelHeight:300,
					idField: 'productId',
					textField: 'productName',
					url: 'SelectProduct',
					method: 'post',
					pagination:true,
					pageList:[1,5,10,20,30,40],
					columns: [[
						{field:'productId',title:'商品编号',width:130},
						{field:'productName',title:'商品名字',width:130},
						{field:'productType',title:'商品类型',width:130,align:'right'},
						{field:'outDepotPrice',title:'商品售价/单品',width:130,align:'right'},
						{field:'depotNum',title:'商品的库存',width:130,align:'right'},
					]],
					fitColumns: true,
					label: '商品信息：',
					labelPosition: 'top'
				">
			</select>
			<label style="margin-left: 150px">数量：</label><input type="number" value="1" name="sum" id="sum" min="1" class="form-control" style="width: 200px;display: inline">
			<input type="button" value="添加" id="btn1" class="btn" style="margin-left: 83px"/>
			<hr/>
			</div>
  	
  <div class="form-group" style="margin-left: 10px;width: 900px;margin-top: 20px">
    <label for="name">备注：</label>
    <textarea class="form-control" rows="2"  name="mark" maxlength="50" placeholder="最大值为50"></textarea>
  </div>
  <hr/>			
			<div style="margin-left: 10px; width: 900px;margin-top: 50px" >
			<table id="product" border="1" class="table table-hover" >
				<tr><th>编号</th><th>商品名称</th><th>商品数量</th><th>商品售价</th><th>商品总价</th><th>操作</th></tr>
			</table>
			<input type="submit" value="添加消费" id="sub" class="btn btn-success" style="margin-left: 820px"/>
			
			</div>
			</form>
			
  </body>
  <script type="text/javascript">
  	/*$('#win').window({
          	width:1100,
            height:600,
            closed:true,
            modal:true
        });
        
		  $('#win').window('refresh', 'view/SelectProductSal2.jsp');
  
  		$("#btns").click(function(){
  			$('#win').window('open');
  		});*/
  	$(document).ready(function() {//水波纹特效
	try {
		$('body').ripples({
			resolution: 512,
			dropRadius: 20, //px
			perturbance: 0.04,
		});
	}
	catch (e) {
		$('.error').show().text(e);
	}
	$('.disable').show().on('click', function() {
		$('body, main').ripples('destroy');
		$(this).hide();
	});
});
  
  			 
  		$(function(){//先让他页面加载的时候显示
  			var grid = $('#SelectProduct');  
			var options = grid.datagrid('getPager').data("pagination").options;
			var page = options.pageNumber;//当前页数  
		 	var rows = options.pageSize;//每页的记录数（行数)
  			$("#SelectProduct").datagrid('load',{page:page,rows:rows});
  			});
			
			
			
  			
  			$('#SelectProduct').combogrid({//当下拉框的值发生改变的时候就去重新的加载数据
        	keyHandler: {
           query: function(q) { 
           $('#SelectProduct').combogrid("grid").datagrid("reload",{q:q});
           $('#SelectProduct').combogrid("setValue", q);  
                     }  
              } 
    });

  /*$("#cg").combogrid({
  					panelWidth: 610,
					idField: 'productId',
					textField: 'productName',
					url: 'SelectProduct',
					method: 'post',
					columns: [[
						{field:'productId',title:'商品编号',width:120},
						{field:'productName',title:'商品名字',width:120},
						{field:'productType',title:'商品类型',width:120,align:'right'},
						{field:'outDepotPrice',title:'商品售价',width:120,align:'right'},
						{field:'depotNum',title:'商品的库存',width:120,align:'right'},
					]]
					});
  */
  $("#sub").attr("disabled",true);//在没有选择商品的时候把按钮给禁用
  var w=0;
  var sum=0;
  $("#btn1").click(function(){//点击添加的时候
  var q=0;//这两个变量是用来判断是不是添加了商品
  	var v=$('#SelectProduct').combogrid('getValue');//获取组合框中选中项的值
    		if(v.length==0) {
    			$.messager.alert('警告','请选择商品');    
    			return;
    			}
    		var grid=$('#SelectProduct'). combogrid('grid');//获取组合框中的grid表格
    		var row=grid.datagrid('getSelected');//获取表格中的选中行
    		var aa=$("#sum").val();
    		var bb=row.depotNum;//获取商品的库存
    		if(aa.length==0){
    			$.messager.alert('警告','请添加数量，数量不能为空');    
    			return;
    		}
    		if(aa>bb){
    			$.messager.alert('警告','卖出的数量不能大于库存剩余');    
    			return;
    		}
    		if(aa<=0){
    			$.messager.alert('警告','数量必须大于等于1');    
    			return;
    		}
    		$("#product").append(
    		"<tr>"+
    		"<td class='col-lg-2'><input type='text' readonly='readonly' value='"+row.productId+"' name='productId' class='form-control '/></td>"+
    		"<td class='col-lg-2'><input type='text' readonly='readonly' value='"+row.productName+"' name='productName' class='form-control'/></td>"+
    		"<td class='col-lg-2'><input type='text' readonly='readonly' value='"+$("#sum").val()+"' name='sum' class='form-control'/></td>"+
    		"<td class='col-lg-2'><input type='text' readonly='readonly' value='"+row.outDepotPrice+"' name='outDepotPrice' class='form-control'/></td>"+
    		"<td class='col-lg-2'><input type='text' readonly='readonly' value='"+row.outDepotPrice*$("#sum").val()+"' name='zj' class='form-control'/></td>"+
    		"<td class='col-lg-1'><a href='javascript:aa()'  Onclick='$(this).parent().parent().remove()' class='btn btn-default'>删除</a></td>"+
    		"</tr>"
    		);
    		q++;
    		w+=q;//添加商品成功一回就把按钮给变成可用
    		if(w>=1){
    		$("#sub").attr("disabled",false);
    		}
 });
	/*$(".btn").click(function(){
		alert("aa");
	});*/
	
	function aa(){//商品删除完时，按钮再次变为不可用
		/*var p=$(this).parent().prev().children().val();
	alert(p);*/
 	w--;
 	if(w<=0){
 	$("#sub").attr("disabled",true);
 	}
 }
 
 $('#dg').datagrid({//查看历史记录
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
				$('#dg').datagrid('fixDetailRowHeight',index);//显示明细
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

function check(){
	var con;
	con=confirm("确定添加消费吗?"); //确认是不是要提交
	if(con==true){
	var index = layer.load(2, {time: 2*1000}); //又换了种风格，并且设定最长等待10秒 
		return true;
	}else{
		return false;
	}
}

$("#btns").click(function(){
	layer.open({
  type: 2 //Page层类型
  ,area: ['1000px', '800px']
  ,title: '消费历史查询页面'
  ,shade: 0.6 //遮罩透明度
  ,anim: 3 //0-6的动画形式，-1不开启
  ,content: 'view/SelectProductSal2.jsp',
  offset: 'lt'
});
});

  </script>
</html>
