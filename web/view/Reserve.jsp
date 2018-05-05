<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>同福酒店</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script  src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<style type="text/css">
	#show{
	display:block;
	margin:0px auto;
	}
	 .btnh2{
  	width:130px;
  	margin-left:8px;
  	margin-bottom:5px;
  	float: left;
  	 }
  	#sp{font-size: 14px;}
  
	</style>
  </head>
  
  <body>
    <div><h2>同福酒店欢迎您来预订！</h2></div>
    <div>
  	<!--    ${rt.roomTypeId}    -->
  	<h3>房间种类：<span id="sp">(请先点击您想要入住的房间类型)</span></h3>
    <c:forEach items="${rtype}" var="rt">
    <div id="show">
    <button type="button" class="btn btn-success btnh2" onclick="chec(this)">${rt.roomType}<br/>房间价格：${rt.roomPrice}<br/>预订押金:${rt.bookMoney}</button>
    <input type="hidden" name="roomTypeId1"  value="${rt.roomTypeId}"/><input type="hidden" name="roomPrice1" value="${rt.roomPrice}"/>
    <input type="hidden" name="bookMoney1" value="${rt.bookMoney}"/>
    </div>
    </c:forEach>
    </div>
    
    <div id="all">  
  <form action="reserveBook1" method="post" onsubmit="return mycheck()">
  
   			 <table width="500" class="table table-hover tw">
   			<tr>
   			<td>预定编号</td><td><input type="text" name="reserveId" value="${df}" class="form-control btnh" placeholder="预住编号"  readonly="readonly"></td> 
   			<td>预定时间</td><td><input type="text" name="reserveTime" value="${time}" class="form-control btnh" readonly="readonly"></td>			
   			</tr>
   			<tr><td>选择房间号</td><td>
   			<select name="roomId" id="roomId">	</select>
   			<input type="hidden" id="roomTypeId" value="" name="roomTypeId"/></td>
   			<td>客户类型：</td><td>
   			<select name="customerTypeId" id="customerTypeId">
   			<c:forEach items="${ctype}" var="ct">
   			<option value="${ct.customerTypeId}">${ct.cTypeName}</option>
   			</c:forEach>
   			</select></td></tr>
   			<tr><td>客户名称<span style="color: red">*</span></td>
   			<td><input type="text" id="name" name="customerName" class="form-control btnh" placeholder="客户名称" onchange="myCheckName(this)">
   			
   			</td> 
   			<td>客户电话<span style="color: red">*</span></td>
   			<td><input type="text" name="customerPhone" class="form-control btnh" placeholder="客户电话"  id="hua"  onchange="myCheckPhone(this)"></td>	
   			</tr>
   			<tr>
   			<td>预定金额</td><td><input type="text"  id="bookMoney" class="form-control btnh" name="bookMoney" readonly="readonly"></td>
   			
   			<td>总金额</td><td><input type="text" id="totalMoney" class="form-control btnh" name="totalMoney" readonly="readonly">
   			<input type="hidden" value="1" name="state">
   			</td>
   			</tr>
   			<tr>
   			<td>预抵时间<span style="color: red">*</span></td><td><input type="text"  name="endTime" class="easyui-datebox" id="shi"></td>
   			<td>备注</td><td><input type="text" name="remark" class="form-control btnh" placeholder="备注" >
   			<input type="hidden"  name="keepTime" class="form-control btnh" placeholder="保留时间" value="3"  readonly="readonly">
   			</td></tr>
   			<tr><td colspan="2" style="text-align: center;"><input type="submit" value="保存" class="btn btn-default"></td>
   			<td colspan="2" > <input type="reset" value="取消" class="btn btn-default"></td></tr>
   			</table>
   		
   </form>
   </div>
    
  </body>
  <script type="text/javascript">
  function chec(str){
  //获取房间类型 
  var roomTypeId=$(str).next().val();
  
  $("#roomTypeId").val(roomTypeId);
  //获取房间价格
  var roomPrice=$(str).next().next().val();
  //获取押金
  var bookMoney=$(str).next().next().next().val();
 //显示房间类型的押金
 $("#bookMoney").val(bookMoney); 
//总金额
$("#totalMoney").val(roomPrice*1+bookMoney*1);
//更据房间类别获取房间编号;
$("#roomId").empty();//移除当中的元素
  $.post("findRoomInfoReserve",{roomtypeId:roomTypeId},function(data){
  	for(i=0;i<data.length;i++){
					$("#roomId").append("<option value='"+data[i].roomId+"'>"+data[i].roomId+"</option>");
			}
  });
  }
  
  
  
  
  var str=true;
  //匹配名称
  function myCheckName(st){
  var name=/^[\u4e00-\u9fa5]{0,}$/; //中文
  var t1=$(st).val();
  if(!name.test(t1)){//test()表示是否存在，匹配到满足正则表达式的，条件表达式中表示true
  str=false;
  alert("用户名不为空，切只能为中文");
  }else{
  str=true;
  }
  };
   //电话
   function myCheckPhone(st){
   var phone=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
   var t1=$(st).val();
  if(!phone.test(t1)){
   str=false;
  alert("您输入的手机号格式不正确");
  }else{
  str=true;
  }
 }
   function mycheck(){
    var name=/^[\u4e00-\u9fa5]{0,}$/; //中文
     var phone=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/; 
   if($("#roomId").val()==null){
   alert("请先选择房间类型");
   str=false;
   }else if($("#name").val()==""||!name.test($("#name").val())){
 alert("用户名不为空，切只能为中文");
 str=false;
 }else if($("#hua").val()==""||!phone.test($("#hua").val())){
  alert("手机号不为空或格式不正确");
  str=false;
 }
  return str; 
   }
   
  
  
  
  </script>
</html>
