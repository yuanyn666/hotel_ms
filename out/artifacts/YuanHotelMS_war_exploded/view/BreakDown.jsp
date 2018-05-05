<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BreakDown.jsp' starting page</title>
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
	<link rel="stylesheet" type="text/css" href="themes2/icon.css">
	<link rel="stylesheet" type="text/css" href="themes2/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap1.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min1.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive1.css">
	<link rel="stylesheet" type="text/css" href="css/pace-theme-barber-shop1.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min1.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
	<script type="text/javascript" src="js/pace.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script><!-- 模态弹窗 -->
	<script type="text/javascript" src=js/jquery.ripples.js></script><!-- 水波背景 -->
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<style type="text/css">
	
	</style>
  </head>
  <body style="width: 1300px; height: auto">
  <input type="button" id="btns" value="查看历史的损坏" style="margin-left: 80px" class="btn btn-success"/>
  <div id="win" style="margin: 0px">
  
  </div>
  
 
  <form action="InsertBreak" method="post" class="form-horizontal" onsubmit="return check()">
    <div style="position: relative; margin-left: 80px;margin-top: 20px">
  		<label for="inputPassword" class="control-label" style="float: left;">损坏单号：</label><input type="text" value="${Spned}" readonly="readonly" name="Spnedid" class="form-control" style="width: 185px;float: left;"/><label for="inputPassword" class="control-label" style="float: left;margin-left: 80px">客人姓名：</label><input type="text" value="${name}" readonly="readonly" name="name" class="form-control" style="width: 100px;float: left;"/><input type="hidden" value="${liveid}" name="liveid" name="liveid" />
  		<label for="inputPassword" class="control-label" style="float: left;margin-left: 120px">操作人：</label><input type="text" value="${myNames}" readonly="readonly" class="form-control" style="width: 100px;float: left;"/><input type="hidden" name="userId" value="${myUsers.userId }"/>
  	</div>
  	<div style="clear: both"></div>
  	
  	<div style="margin-left: 80px;margin-top: 50px">
  <select id="SelectProduct" class="easyui-combogrid" style="width:200px" data-options="
					panelWidth: 900,
					panelHeight:300,
					idField: 'badId',
					textField: 'badName',
					url: 'SelectBad2',
					method: 'post',
					pagination:true,
					pageList:[1,5,10,20,30,40],
					columns: [[
						{field:'badId',title:'标示',width:130},
						{field:'badName',title:'名称',width:130},
						{field:'money',title:'价格',width:130,align:'right'},
					]],
					fitColumns: true,
					label: '损坏的物品：',
					labelPosition: 'top'
				">
			</select>
			<input type="button" value="添加" id="btn1" class="btn" style="margin-left: 130px"/>
	</div>
  	
  	<div class="form-group" style="margin-left: 80px;width: 900px;margin-top: 20px">
    	<label for="name">备注：</label>
    <textarea class="form-control" rows="3"  name="mark"  id="vv"  maxlength="50" placeholder="最大值为50"></textarea>
    <div id="result"></div>
    <hr/>
  	</div>
  	<div style="margin-left: 80px; width: 900px;margin-top: 50px" >
			<table id="product" border="1" class="table table-hover" >
				<tr><th>损坏物品</th><th>物品价值</th><th>操作</th></tr>
			</table>
			<input type="submit" value="添加记录" id="sub" class="btn btn-success" style="margin-left: 820px"/>
			</div>
  </form>
  
  </body>
  <script type="text/javascript">
  
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
  
  
  		$("#btns").click(function(){
	layer.open({
  type: 2 //Page层类型
  ,area: ['1000px', '800px']
  ,title: '消费历史查询页面'
  ,shade: 0.6 //遮罩透明度
  ,anim: 3 //0-6的动画形式，-1不开启
  ,content: 'view/SelectBreak2.jsp',
  offset: 'lt'
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
  
  $("#Spnedid2").blur(function(){
  var a=$("#Spnedid2").val();
  if(!isNaN(a)) {
	}else {
	alert("请按要求输入数字");
	$("#Spnedid2").val("");
	}//判断里面价格里面输入的是不是数字
	});
	
	
$("#sub").attr("disabled",true);//在没有选择商品的时候把按钮给禁用
  var w=0;
  $("#btn1").click(function(){
  var q=0;//这两个变量是用来判断是不是添加了商品
    		var v=$('#SelectProduct').combogrid('getValue');//获取组合框中选中项的值
    		if(v.length==0) {
    			$.messager.alert('警告','请选择损坏的物品');    
    			return;
    			}
    		var grid=$('#SelectProduct'). combogrid('grid');//获取组合框中的grid表格
    		var row=grid.datagrid('getSelected');//获取表格中的选中行
    		$("#product").append(
    		"<tr>"+
    		"<td class='col-lg-2'><input type='text' readonly='readonly' value='"+row.badName+"' name='productId' class='form-control '/></td>"+
    		"<td class='col-lg-2'><input type='text' readonly='readonly' value='"+row.money+"' name='productName' class='form-control'/></td>"+
    		"<td class='col-lg-1'><a href='javascript:aa()'  Onclick='$(this).parent().parent().remove()' class='btn btn-default'>删除</a></td>"+
    		"</tr>"
    		);
    		q++;
    		w+=q;//添加商品成功一回就把按钮给变成可用
    		if(w>=1){
    		$("#sub").attr("disabled",false);
    		}
 });
 function aa(){//商品删除完时，按钮再次变为不可用
 	w--;
 	if(w<=0){
 	$("#sub").attr("disabled",true);
 	}
 }
 
 function check(){
	var con;
	con=confirm("确定添加记录吗?"); //确认是不是要提交
	if(con==true){
	var index = layer.load(2, {time: 2*1000}); //又换了种风格，并且设定最长等待2秒
		return true;
	}else{
		return false;
	}
}
 
 
  </script>
</html>
