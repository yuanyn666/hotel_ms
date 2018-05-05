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
    
    <title>My JSP 'show.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"></link>
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css"></link>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css"></link>
	<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
#all{border: 0px solid red; width: 100%; height: 100%;}
#left{border: 0px solid black; width: 600px; height: 550px;float: left; text-align: justify; display: block;
 background-color: #DDECF8; margin-left: 100px;margin-top:0px;}
#fang{border: 0px solid black; width: 580px; height: 550px; display: none; position: absolute; background-color: #DDECF8;z-index:5; margin-left: 160px;margin-top: 20px;}
#tab{margin-top: 20px;}
.btnh{width: 160px; display: inline;}
#zheng{ margin-left: 80px;}
#leftOne{ border: 0px solid blue; width: 500; height: 600px; float: left; margin-left: 50px; margin-top: 20px;}
#list{width: 100px; height: 300px;  position: relative;float: left;  margin-top: 150px;margin-left: 50px;}
.tw{width:600px; height:50px;margin:50px auto;overflow: auto;}
#z1{display:none;width:100%;height: 100%;opacity:0.5;background-color:#CCC;position: absolute;z-index:1;}
#right{width: 100px; height: 300px;margin-left: 10px;float: right;margin-top: 100px;}
#reset{margin-left: 100px;}
	</style>

  </head>
  
  <body>
   <div id="all">

   <div id="z1"></div>
   <div id="leftOne">
		<div id="left">
		
		<c:forEach items="${room}" var="r">
		<input type="hidden" value="${r.roomType.roomType}" id="room"/>
		<input value="${r.roomType.roomPrice}" id="fangMoney" type="hidden"/>
		</c:forEach>
            <c:forEach items="${list}" var="f">
            <input type="hidden" value="${f.roomId}" id="d1"/>
            <table class="table table-hover tw">
             <caption><h4>入住人信息</h4></caption>
            <tr><td>入住编号：</td><td><input type="text" name="liveId" value="${f.liveId}" class="form-control btnh" readonly="readonly"></td>
            <td>客户类型:</td><td>
            <input type="hidden" name="customerTypeId1" value="${f.customerTypeId}">
            <input type="text" name="customerTypeId1" value="${f.customerType.cTypeName}" class="form-control btnh"  readonly="readonly"></td>
           </tr>
   			 <tr><td>客户名称:</td><td><input type="text" name="customerName" value="${f.customerName}" id="name" class="form-control btnh"  readonly="readonly"></td><td>客户性别:</td><td><input type="text" value="${f.customerSex}" id="nv" name="customerSex" class="form-control btnh"  readonly="readonly"/></td></tr>
   			 <tr><td>证件类型:</td><td><input type="text" name="cardType" value="${f.cardType}" readonly="readonly" id="zhen"  class="form-control btnh" ></td><td>证件号码:</td><td><input type="text" name="cardId" value="${f.cardId}" class="form-control btnh"  readonly="readonly"></td></tr>
   			 <tr><td>联系电话:</td><td><input type="text" name="phone" value="${f.phone}" class="form-control btnh"  readonly="readonly"></td><td>地址:</td><td><input type="text" name="address" value="${f.address}" class="form-control btnh"  readonly="readonly"></td></tr>
   			 <tr><td>入住人数:</td><td><input type="text" name="liveNum" value="${f.liveNum}" class="form-control btnh"  readonly="readonly"></td><td>入住日期:</td><td><input type="text" name="liveTime" value="${f.liveTime}" id="day" class="form-control btnh"  readonly="readonly"></td></tr>
   			 <tr><td>入住天数:</td><td><input type="text" name="liveDays" value="${f.liveDays}" id="num" class="form-control btnh" readonly="readonly" ></td><td>付款方式:</td><td><input type="text" name="payType" id="jin" value="${f.payType}" class="form-control btnh"  readonly="readonly"></td></tr>
   			 <tr><td>操作人:</td><td>
   			 <input type="hidden" name="userIdnumber" value="${f.userIdnumber}">
   			 <input type="text" name="customerTypeId1" value="${f.users.names}" class="form-control btnh"  readonly="readonly">
   			 </td><td>总额：</td><td><input type="text" name="liveMoney" value="${f.liveMoney}" class="form-control btnh"  id="zong" readonly="readonly"></td></tr>
   			<tr><td>备注:</td><td colspan="3"><input type="text" name="mark" value="${f.mark}" class="form-control btnh"  readonly="readonly"></td></tr>
            </table>
   		    </c:forEach>
      </div>
      <div id="list">
       <a href="javascript:open(this)" class="btn btn-default">续交房费</a>
       <br/>
       <br/>
       <c:forEach items="${list}" var="f1">
       <a href="findByRoomId?roomId=${f1.roomId}" class="btn btn-default">更换房间</a>
       </c:forEach>
       <br/>
       <br/>
        <c:forEach items="${list}" var="f2">
       <a href="Selectt?liveId=${f2.liveId}" class="btn btn-default">客人消费</a>
       </c:forEach>
       <br/>
       <br/>
       
       <c:forEach items="${list}" var="f3">
      <a href="Break?roomId=${f3.liveId}" class="btn btn-default">客人损坏</a>
       </c:forEach>
        <br/>
       <br/>
       
         <c:forEach items="${list}" var="f1">
       <a href="tui?roomId=${f1.roomId}" class="btn btn-default">退&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;房</a>
       </c:forEach>
       </div>
      </div>
     
     

    <div id="fang">
    <a style="text-decoration: none; position: absolute; top: 0px; right: 0px;" href="javascript:guan(this)">关闭</a>
    <table id="tab">
    <tr><td>房号：</td><td><input type="text"  id="d" class="form-control btnh"  readonly="readonly"/></td></tr>
    <tr><td>姓名：</td><td><input type="text"  id="name1" class="form-control btnh"  readonly="readonly"/></td></tr>
    <tr><td>房类：</td><td><input type="text"  id="room1" class="form-control btnh" readonly="readonly"/></td></tr>
    <tr><td>订房日期：</td><td><input type="text"  id="day1" class="form-control btnh" readonly="readonly"/></td></tr>
    <tr><td>入住天数：</td><td><input type="text"  id="num1" class="form-control btnh" readonly="readonly"/></td></tr>
    </table>
     <hr>
		<form action="insertXu" method="post" onsubmit="return check()">
		<c:forEach items="${room}" var="s">
		<input type="hidden" value="${s.roomId}" name="roomId" id="roomId"/>
		</c:forEach>
     <p>续住天数：<input type="text" size="4" name="liveDays" id="days"  onchange="chang()"  class="form-control btnh" /></p>
     <p>续住金额：<input type="text" name="liveMoney"  id="liveXu" class="form-control btnh"  readonly="readonly"/></p>
     支付方式：<select name="payType" style="width: 180px;">
   			<option>现金支付</option>
   			<option>支付宝支付</option>
   			<option>微信支付</option>
   			</select>
   			<hr>
   			<input type="submit" value="确认续费" id="btn"><input type="reset"  id="reset" value="重置内容">
   		</form>
   		
    </div>
    
   </div>


  </body>
  <script type="text/javascript">
 $(function(){
  var z=$("#zhen").val();
  var n=$("#nv").val();
  var j=$("#jin").val();
 if(z==0){
 var jie="身份证";
 $("#zhen").val(jie);
 }if(n==0){
 var nv="女";
 $("#nv").val(nv);
 }if(j==0){
 var jin="现金";
 $("#jin").val(jin);
 }
  })
  
  function open(str){

 $("#d").val($("#d1").val())
 $("#d2").val($("#d1").val())
 $("#name1").val($("#name").val())
 $("#room1").val($("#room").val())
 $("#day1").val($("#day").val())
 $("#days").val($("#num").val())
 $("#num1").val($("#num").val())
 //默认一天时价格
 	var a=$("#fangMoney").val();
  var b=$("#days").val();
  var xu=a*b
  $("#liveXu").val(xu)
 
	 $("#fang").css("display","block");
	 $("#z1").css("display","block");
	}
	function guan(str){
	$("#fang").css("display","none");
	$("#z1").css("display","none");
	}
	
	function chang(){
	var a=$("#fangMoney").val();
  var b=$("#days").val();
  var xu=a*b
  $("#liveXu").val(xu)
	}
	//续住天数不能小于1
	function check(){
	 var d=$("#days").val();
      if(d<0){
     alert("续住日期不可以小于1");
     var a="";
     $("#days").val(a);
     $("#liveXu").val(a);
     return false;
 }else if($("#days").val()==""){
 alert("请填写续住天数！");
 return false;
 }
	}
	
	
  </script>
</html>
