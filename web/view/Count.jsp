<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Count.jsp' starting page</title>
     <style>
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
  </head>
  
  <body>
  		<div style="margin-top: 20px;">
  		<label for="inputPassword" style="margin-left: 10px">开始日期：</label>
  		<input type="text"  id="begin" name="begin" class="easyui-datebox"  style="width: 200px;" data-options="formatter:myformatter,parser:myparser" />
  		<label for="inputPassword" style="margin-left: 30px">结束日期：</label>
  		<input type="text"  id="end" name="end"  class="easyui-datebox"  style="width: 200px;" data-options="formatter:myformatter,parser:myparser"/>
  		<input type="button" id="btn1" value="获取数据" class='ichartjs_btn' onmouseover="this.style.color='#2f99ff'" onmouseout="this.style.color='#0b2946'" style="margin-left: 20px"/>
  		</div>
	<div id='canvasDiv' style="margin-left: 10px;margin-top: 50px"></div>
			<div class='ichartjs_info'>
				<div class='ichartjs_details' style="margin-left: 10px">
				<div class="page">说明</div>
				<div class="showcase">
				<p class="danceWord-s3">
					这是一个折线图，反应了酒店商品的卖出图示，使人一目了然，快速掌握商品的消费趋向。
				</p>
				<p class="danceWord-s3">
					First:日期都不填写，默认查看全部。
				</p>
				<p class="danceWord-s3">
					Second:如果只填写开始日期，结束日期默认为当天时间。
				</p>
				<p class="danceWord-s3">
					third:如果只填写结束日期，开始日期默认为2016-01-01。
				</p>
				<p class="danceWord-s3">
					fourth:当然结束日期不能小于开始日期。
				</p>
			</div>
				</div>
			</div>
</body>
 <script type="text/javascript">;
 			$(function(){
 			ss();//页面加载完成的时候调用
 			});
 		
			$("#btn1").click(function(){
			ss();//点击的时候调用
			});
			
			
			function ss(){
		var product = new Array();
		var num=new Array();
		var begin=$('#begin').textbox('getValue');
		var end=$('#end').textbox('getValue');//附加条件进行数据加载
		if(begin.length!=0&&end.length!=0&&end<begin){
			alert("结束日期不能小于开始日期");
			return;
		}
		$.post("ProductReporting",{begin:begin,end:end},function(data){
		if(data!=''){
			for(var i=0;i<data.length;i++){

				product.push(data[i].productname);
			  num.push(data[i].productNum);
			}
			}else{
			product.push('没有商品');
			product.push('换个时间试试');
			num.push(2);
			num.push(2);
			}
			tuxing(num,product);//在异步的里面的调用封装的方法就是防止页面的加载错过异步的数据。
			});
			}
			
			function tuxing(num,product){
		
							var data2 = [
				        	{
				        		name : '商品',
				        		value:num,
				        		color:'#1f7e92',
				        		line_width:3
				        	}
				       ];
				var chart = new iChart.Area2D({
						render : 'canvasDiv',
						data: data2,
						title : '酒店商品出售情况',
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
		$("#end").blur(function(){
			alert("aa");
		});
		</script>
</html>
