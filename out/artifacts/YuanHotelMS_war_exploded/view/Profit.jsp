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
	width:auto;
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
		<script type="text/javascript" src="layer/layer.js"></script><!-- 模态弹窗 -->
	 <body>
	 
	 <ul id="myTab" class="nav nav-tabs">
	<li class="active">
		<a href="#home" data-toggle="tab">
			 盈利折线图
		</a>
	</li>
	<li><a href="#ios" data-toggle="tab" id="ert">盈利表格细化</a></li>
	
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="home">
	<div style="margin-top: 20px;">
  		<label for="inputPassword" style="margin-left: 10px">开始日期：</label><input type="text"  id="begin" name="begin" class="easyui-datebox"  style="width: 200px;" data-options="formatter:myformatter,parser:myparser" />
  		<label for="inputPassword" style="margin-left: 30px">结束日期：</label><input type="text"  id="end" name="end"  class="easyui-datebox"  style="width: 200px;" data-options="formatter:myformatter,parser:myparser"/>
  		<input type="button" id="btn1" value="获取数据" class='ichartjs_btn' onmouseover="this.style.color='#2f99ff'" onmouseout="this.style.color='#0b2946'" style="margin-left: 20px"/>
  		</div>
	<div id='canvasDiv' style="margin-left: 10px;margin-top: 50px"></div>
			<div class='ichartjs_info'>
				<div class='ichartjs_details' style="margin-left: 10px">
				<div class="page">说明</div>
				<div class="showcase">
				<p class="danceWord-s8">
					这是一个折线图，反应了酒店盈利的图示，更好的反映酒店的运营状况。
				</p>
				<p class="danceWord-s8">
					First:日期都不填写，默认查看当前月的盈利额。
				</p>
				<p class="danceWord-s8">
					Second:如果只填写开始日期，结束日期默认为月底。
				</p>
				<p class="danceWord-s8">
					third:如果只填写结束日期，开始日期默认为上月月底。
				</p>
				<p class="danceWord-s8">
					fourth:当然结束日期不能小于开始日期。
				</p>
			</div>
				</div>
			</div>
	</div>
	<div class="tab-pane fade" id="ios">
		<div style="margin-top: 20px;">
  		<label for="inputPassword" style="margin-left: 10px">开始日期：</label><input type="text"  id="begin2" name="begin2" class="easyui-datebox"  style="width: 200px;" data-options="formatter:myformatter,parser:myparser" />
  		<label for="inputPassword" style="margin-left: 130px">结束日期：</label><input type="text"  id="end2" name="end2"  class="easyui-datebox"  style="width: 200px;" data-options="formatter:myformatter,parser:myparser"/>
  		<input type="button" id="btn2" value="获取数据" class='ichartjs_btn' onmouseover="this.style.color='#2f99ff'" onmouseout="this.style.color='#0b2946'" style="margin-left: 20px"/>
  		</div>
		
	<div style="margin-left:10px;margin-top: 10px">
    <table id="tt2" class="easyui-datagrid" style="width:1000px;height:350px;"
			url="SelectProductBill3"
			title="盈利"
			singleSelect="true"
			rownumbers="true"
			pagination="true"
			pageList="[1,5,10,20,30,40]"
			>
		<thead>
			<tr>
				<th field="jainMoney" width="460">盈利金额</th>
				<th field="datatime" width="460">日期</th>
			</tr>
		</thead>
	</table>
	</div>
	</div>
</div>
</body>
 <script type="text/javascript">;
 	$(function(){
 		
 		mm();//页面加载
 		
 	});
 	
 	$("#btn1").click(function(){
 		mm();//点击按钮的时候
 	});
 	
 		function mm(){
 		var product = new Array();//保存获取的日期
		var num=new Array();//保存获取的盈利
		var aaa=new Array();//保存分割的日期
		var begin=$('#begin').textbox('getValue');
		var end=$('#end').textbox('getValue');//附加条件进行数据加载
		if(begin.length!=0&&end.length!=0&&end<begin){
			alert("结束日期不能小于开始日期");
			return;
		}
		$.post("SelectProductBill2",{begin:begin,end:end},function(data){
		if(data!=''){
		
			for(var i=0;i<data.length;i++){
				aaa=data[i].datatime.split('-');
				product.push(aaa[2]);//只取日期
				num.push(data[i].jainMoney);
			}
			}else{
			product.push('没有数据');
			product.push('换个时间试试');
			num.push(2);
			num.push(2);
			}
			tuxing(num,product);
			});
 		}
			function tuxing(num,product){
				var data2 = [
				        	{
				        		name : '盈利',
				        		value:num,
				        		color:'#1f7e92',
				        		line_width:3
				        	}
				       ];
				var chart = new iChart.Area2D({
						render : 'canvasDiv',
						data: data2,
						title : '酒店盈利情况',
						width : 1000,
						height : 400,
						shadow:true,
						shadow_color : '#edf8fa',
						shadow_blur : 8,
						shadow_offsetx :0,
						shadow_offsety : 0,
						background_color:'#edf8fa',
						animation : true,//开启过渡动画
						animation_duration:1600,//1600ms完成动画
						coordinate:{height:'90%',background_color:'#edf8fa'},
						sub_option:{
							hollow_inside:true,//设置一个点的亮色在外环的效果
							point_size:10
						},
						labels:product
					});
				chart.draw();
			}
				
			
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
		
		$("#btn2").click(function(){
		var begin2=$('#begin2').textbox('getValue');
		var end2=$('#end2').textbox('getValue');//附加条件进行数据加载
		if(begin2.length!=0&&end2.length!=0&&end2<begin){
			alert("结束日期不能小于开始日期");
			return;
		}
			var grid = $('#tt2');
			var options = grid.datagrid('getPager').data("pagination").options;
			var page = options.pageNumber;//当前页数  
		 	var rows = options.pageSize;//每页的记录数（行数）  
		$("#tt2").datagrid('load',{begin2:begin2,end2:end2,page:page,rows:rows});
		});
		
		function jiazai(){
			var begin2=$('#begin2').textbox('getValue');
			var end2=$('#end2').textbox('getValue');//附加条件进行数据加载
			var grid = $('#tt2');
			var options = grid.datagrid('getPager').data("pagination").options;
			var page = options.pageNumber;//当前页数  
		 	var rows = options.pageSize;//每页的记录数（行数）  
		$("#tt2").datagrid('load',{begin2:begin2,end2:end2,page:page,rows:rows}
			/*onDblClickRow:function(rowIndex,rowDate){
				alert("aa");
			}*/
		);
		}
		 $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		 	jiazai();//点击的时候加载第二个页面
		 }); 
		 
		 $('#tt2').datagrid({
		 onDblClickRow:function(rowIndex,rowDate){
		 	var time=rowDate.datatime;
		 	$.ajax({
  					type:"post",
  					url:'soutime',
    				data:{time:time},
   					 async:false,//把异步提交关闭，设置为同步提交
      					 });
      			layer.open({
  type: 2 //Page层类型
  ,area: ['1000px', '800px']
  ,title: '详情查看'
  ,shade: 0.6 //遮罩透明度
  ,anim: 3 //0-6的动画形式，-1不开启
  ,content: 'view/searchYingXiang.jsp',
  offset: 'lt'
});
				}
				});
		</script>
</html>
