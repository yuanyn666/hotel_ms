<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>预定入住</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script  src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<style>
.btnh1{height:30px;
   margin-top: -12px;
   }
   #People,#daty{
   width: 40px;
   }  
   .tw{
width:650px; 
height:50px;
margin-top:20px;
margin-left:200px;
border: 1px solid gray;
overflow: auto;
}
#btn,#btn1{
width:100px;
margin-right: 26px;
margin-left: 26px;
}
	</style>
  </head>
  <body>
	<div>
	
		<form action="insert" method="post">	
   			<table class="table table-striped table-hover tw"><tr>
   	<caption><h4>欢迎预定入住${list.roomId}号房间</h4></caption>
   	<tr><td>房价</td><td><input type="text" id="rprice" value="${list.roomtype.roomPrice}" readonly="readonly"/></td>
   	<td>已交预定金额</td><td><input type="text" id="yiJiao" value="${list.bookMoney}" readonly="readonly"/></td></tr>
   	
   	
   	<tr><td>入住编号：</td><td><input type="text" name="liveId" value="${df}" class="form-control btnh" placeholder="入住编号"  readonly="readonly"></td>
   	<td>入住押金：</td><td><input type="text" value="${list.roomtype.money}" id="yajin" readonly="readonly" class="form-control btnh" ></td></tr> 			
   			<tr><td>入住日期:</td><td><input type="text" name="liveTime" id="liveTime" class="form-control" value="${time}" readonly="readonly"></td>
   			
<td>客户类型：</td><td>
		<c:choose>
   			<c:when test="${list.customerType.customerTypeId==1}">
   			<input type="text" name="customerTypeId1" value="散客" readonly="readonly">
   			</c:when>
   			<c:when test="${list.customerType.customerTypeId==2}" >
   			<input type="text" name="customerTypeId1" value="团客" readonly="readonly">
   			</c:when>
   			<c:when test="${list.customerType.customerTypeId==3}">
   			<input type="text" name="customerTypeId1" value="会员" readonly="readonly">
   			</c:when></c:choose>   					
		<input type="hidden" name="customerTypeId" id="custo" value="${list.customerType.customerTypeId}">			
   			</td></tr>			
   			<tr><td>客户名称:<span style="color: red">*</span></td>
   			<td><input type="text" name="customerName" id="name" value="${list.customerName}" class="form-control" readonly="readonly" ></td>
   			<td>折扣：</td><td>
   			<input type="text" id="dis" name="disCount" value="1" readonly="readonly"></td></tr>
   			<tr><td>证件类型:：</td><td><select name="cardType">
   			<option>身份证</option>
   			<option>港澳台证</option>
   			<option>华侨证</option>
   			</select></td>
   			<td>证件号码:<span style="color: red">*</span></td>
   			<td><input type="text" name="cardId" id="jian" class="form-control"  placeholder="请输入证件(1-18位数字)" ></td></tr>
   			<tr><td>联系电话:<span style="color: red">*</span></td>
   			<td><input type="text" name="phone" id="dian" value="${list.customerPhone}"  class="form-control" readonly="readonly"></td>
   			<td>地址:</td><td><input type="text" name="address" class="form-control"  placeholder="请输入地址" ></td></tr>
   			
   			<tr><td>入住人数:</td><td><input type="button" value="-" size="2" class="btnh1" onclick="people(this)">
   			<input type="text" name="liveNum"  value="1" readonly="readonly"  id="People">
   			<input type="button" value="+" size="2" class="btnh1"  id="jia" onclick="people(this)"></td>
   			<td>付款方式:</td><td><select name="payType">
   			<option>现金支付</option>
   			<option>支付宝支付</option>
   			<option>微信支付</option>
   			</select></td></tr>
   			<tr><td>入住天数:</td><td><input type="button" value="-" size="2" class="btnh1" onclick="changeAll(this)">
   			<input type="text" name="liveDays" value="1" id="daty" size="2" readonly="readonly">
   			<input type="button" value="+" class="btnh1" size="2" onclick="changeAll(this)"></td>
   			
   			<td>总额：</td><td><input type="text" id="money" name="liveMoney" value="${list.totalMoney}" class="form-control" readonly="readonly"></td></tr>
   			<tr><td>客户性别:</td><td><select name="customerSex">
   			<option>男</option><option>女</option>
   			</select></td>
   			<td>操作人:</td><td><input type="hidden" name="userIdnumber" value="${myUsers.userId }">
   			<input type="text" name="userIdnumber1" readonly="readonly" value="${myNames }">
   			</td></tr>
   			<tr><td>还需交金额</td><td><input type="text" value="" id="haiXu" readonly="readonly"/></td>
   			<td>备注:</td><td colspan="">
   			<textarea rows="2" cols="100" name="mark" value="${list.remark}" class="form-control" placeholder="备注" ></textarea>
   			<input type="hidden" name="state" value="1"><input type="hidden" name="roomId" value="${list.roomId}" id="h2"></td></tr>
   			
   			<tr><td colspan="4" style="text-align: center;"><input type="submit" value="保存" id="btn"  class="btn btn-default">
   			
   			<a href="showRoomIST" class="btn btn-default">取消入住</a></td></tr>
   			</table>
   			</div>
   	  	</form>
   	  	
   	  	
   	  	</div>

 <script type="text/javascript">
  $(function(){
  var roomPrice=$("#rprice").val();//房间价格
  	var yiJiao=$("#yiJiao").val();//已交金额
 	var myMoney=$("#yajin").val();//押金
 	var haiXu=roomPrice*1+myMoney*1-yiJiao*1;
 	$("#haiXu").val(Math.round(haiXu));
  });
 
//入住天数加减
  function changeAll(str){
  //获取当前单击按钮的值
  var s=$(str).val();
  //获取客户类型
  var custo=$("#custo").val();
  //获取当前天数的值
  	var w=$("#daty").val();
  	
  	var roomPrice=$("#rprice").val();//房间价格
  	var yiJiao=$("#yiJiao").val();//已交金额
 	var myMoney=$("#yajin").val();//押金
  	if(s=="-"){
  	if(w<=1){
  	alert("入住天数不能小于1");
  	}else{
  	var w1=w*1-1;
  	$("#daty").val(w1);
  	if(custo==1){
  	var money=roomPrice*w1+myMoney*1;
  	var haiXu=roomPrice*w1+myMoney*1-yiJiao*1;
  	}else if(custo==2){
  	var money=roomPrice*w1*0.8+myMoney*1;
  	var haiXu=roomPrice*w1+myMoney*1-yiJiao*1;
  	}else if(custo==3){
  	var money=roomPrice*w1*0.7+myMoney*1;
  	var haiXu=roomPrice*w1+myMoney*1-yiJiao*1;
  	}
  	$("#money").val(Math.round(money));
  	$("#haiXu").val(Math.round(haiXu));
  	}  	
  	}else if(s=="+"){
  	var w1=w*1+1;//天数加一
  	$("#daty").val(w1);
  	if(custo==1){
  	var money=roomPrice*w1+myMoney*1;
  	var haiXu=roomPrice*w1+myMoney*1-yiJiao*1;
  	}else if(custo==2){
  	var money=roomPrice*w1*0.8+myMoney*1;
  	var haiXu=roomPrice*w1+myMoney*1-yiJiao*1;
  	}else if(custo==3){
  	var money=roomPrice*w1*0.7+myMoney*1;
  	var haiXu=roomPrice*w1+myMoney*1-yiJiao*1;
  	}
  	//向上取整
  	var ms=Math.round(money);
  	$("#money").val(ms);
  	$("#haiXu").val(Math.round(haiXu));
  	}
  }
   //添加入住人数
function people(str){
var s=$(str).val();
var people=$("#People").val();
if(s=="-"){
if(people>1){
var people1=people*1-1;
$("#People").val(people1);
}
}else if(s=="+"){
if(people<2){
var people1=people*1+1;
$("#People").val(people1);
}else{
alert("该房间最多入住两人");

}

}
}
  
 
  </script>

  </body>
 
</html>
