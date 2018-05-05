<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'LiveInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"></link>
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css"></link>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css"></link>
	<link rel="stylesheet" type="text/css" href="themess/black/easyui.css">
	<link rel="stylesheet" type="text/css" href="themess/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="themess/icon.css"> 
	  <script type="text/javascript" src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/datagrid-detailview.js"></script>
<style type="text/css">
#t{display: none;}
#money{display: none;}
#moneyS{display: none;}
.quan{border: 1px solid gray; width: 900px; height: 690px; float: left;margin-left: 100px;}
#top{ width: 900px; height: 200px; overflow: auto;}
#left{ width: 600px; height: 500px;float: left;}
#right{ width: 300px; height: 500px;margin-left: 600px;}
.btnh{width: 200px; display: inline;}
#suan{margin-left: 1020px;margin-top:-400px;}
</style>
  </head>
  
  <body>
  
  <c:forEach items="${room}" var="r">
  <span id="t">${r.roomType.roomType}</span><span id="money">${r.roomType.money}</span><span id="moneyS">${r.roomType.roomPrice}</span>
  </c:forEach>
 <div id="all">
 
 <form action="jie" method="post">
 <c:forEach items="${list}" var="s">
 <input type="hidden" value="${s.roomId}" name="roomId"/>
 </c:forEach>
 
 <div id="all2">
 <div class="quan">
 	<div id="top">
 	<h4>结账房间</h4>
  <table border="1" width="1000px">
  <tr>
  <td>入住编号</td><td>房号</td><td>住客姓名</td><td>房类</td><td>总额</td><td>抵店日期</td><td>天数</td><td>预收款</td>
  </tr>
    <c:forEach items="${list}" var="s">
    <tr>
    <td id="live">${s.liveId}</td><td>${s.roomId}</td><td>${s.customerName}</td><td id="t2"></td><td id="jie">${s.liveMoney}</td><td id="di">${s.liveTime}</td><td id="num">${s.liveDays}</td><td id="money2"></td>
    </tr>
    </c:forEach>
    </table>
    </div>
    	<div id="left">
    	<h4>消费清单</h4>
    		<table id="dg" style="width:580px;height:450px"
			url="SerchProductSaHis"
		 	sortName="spendName" sortOrder="desc"
			title="查看历史消费"
			singleSelect="true" fitColumns="true">
		<thead>
			<tr>
				<th field="spendId" align="center" width="190">消费单号</th>
				<th field="spendTime" align="center" width="170">消费时间</th>
				<th field="customerName" align="center" width="170">消费所用姓名</th>
				<th field="names" width="170" align="center">操作人</th>
			</tr>
		</thead>
	</table>
    	</div>
    	
    	<div id="right">
    	<h4>合计信息</h4>
    	<table>
    	<tr><td>结算编号：</td><td><input type="text" value="${df}"  name="checkId" class="form-control btnh" readonly="readonly"></td></tr>
    	<tr><td>入住单号：</td><td><input type="text" id="dan"  name="liveId" class="form-control btnh"  readonly="readonly"></td></tr>
    	<tr><td>实住天数：</td><td><input type="text" id="num2"  name="realDays" class="form-control btnh"  readonly="readonly"></td></tr>
    	<tr><td>已收款：</td><td><input type="text" class="form-control btnh" id="jie2" readonly="readonly" ></td></tr>
    	<tr><td>定金：</td><td><input type="text"  name="keepTime" class="form-control btnh" id="shou"  readonly="readonly"></td></tr>
    	<tr><td>客人未付：</td><td><input type="text" id="z"  class="form-control btnh"  readonly="readonly"></td></tr>
    	<tr><td>需退还：</td><td><input type="text" id="huan"  class="form-control btnh"  readonly="readonly"></td></tr>
    	<tr><td>应收款：</td><td><input type="text" id="zhi"  name="money" class="form-control btnh"  readonly="readonly"></td></tr>
    	<tr><td>离店日期：</td><td><input type="text" name="checkTime" id="li" class="form-control btnh"  readonly="readonly" value="${dfe}"></td></tr>
    	<tr><td>操作人：</td><td>
    	<input type="text" value="${myNames}" readonly="readonly">
    	<input type="hidden" name="userId" value="${myUsers.userId }">
    	</td></tr>
    	</table>
    	</div>
      </div>
      <div style="clear: both"></div>
      <div id="suan">
            <input type="submit" value="结算" class="btn btn-default"><br><br/>
            <input type="reset" value="取消" class="btn btn-default">
      </div>
  </div>
  </form>
  </div>
  </body>
  <script type="text/javascript">
  $(function(){
  
  var strDate1=$("#di").html();
  var strDate2=$("#li").val();
  strDate1=strDate1.replace(/-/g,"/"); 
  strDate2=strDate2.replace(/-/g,"/"); 
  var date1 = Date.parse(strDate1); 
  var date2 = Date.parse(strDate2); 
   $("#num2").val(Math.ceil((date2-date1)/(24*60*60*1000)));
     //实际天数
     var num=$("#num2").val();
     //天数
    var shi=$("#num").html();
    //相差天数
    var cha=num-shi;
    //实际天数小于天数
    var cha2=shi-num;
   //一天房价
   var moneyS=$("#moneyS").html();
   var zongMoneyS=moneyS*cha2;
   var zongMoneyS2=moneyS*cha
  // alert(zongMoneyS);
  
  var a=$("#jie").html();
    var b=$("#money").html();
    $("#zhi").val(a-b);
 
  if(num>shi){
    //房价
   $("#z").val(zongMoneyS2);
   var h2=$("#z").val();
      //实收
     $("#zhi").val(h2*1+moneyS*1)
  
  }if(num<shi){
    var a=$("#jie").html();
    $("#huan").val(zongMoneyS);
    var h=$("#huan").val();
    //预收款
   var b=$("#money").html();
    //实收
     $("#zhi").val(a-h-b)
  }
   
  
  $("#t2").html($("#t").html())
  $("#money2").html($("#money").html())
  $("#jie2").val($("#jie").html())
   $("#shou").val($("#money").html())
   $("#dan").val($("#live").html())
 
 
/*   //还需支付
   var zhi=a*1-b*1
  $("#zhi").val(zhi)
   
   //找零
   var z=$("#ke").val();*/
  var ling=z*1-zhi*1
  $("#ling").val(ling);
  })
  function change(){
   //房价
   var a=$("#jie").html();
   //预收款
   var b=$("#money").html();
   //还需支付
   var zhi=a*1-b*1
  $("#zhi").val(zhi)
   
   //找零
   var z=$("#ke").val();
  var ling=z*1-zhi*1
  $("#ling").val(ling);
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

  </script>
</html>
