<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更换房间</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="themess/black/easyui.css">
	<link rel="stylesheet" type="text/css" href="themess/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="themess/icon.css"> 
	  <script type="text/javascript" src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script> 
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="bootstrap.min.js"></script>
	
	<style>
<style>
.tw{
width:700px; 
height:50px;
margin-top:10px;
margin-left:100px;
border: 1px solid gray;
overflow: auto;
}
.bt{
width: 360px;
}
	</style>
	</style>
	
  </head>
  
  <body>
    <form action="updateLive" method="post" onsubmit="return myCheck()">
    <table  class="table table-striped table-hover tw">
    <caption><h4>更换房间</h4></caption>
    <c:forEach items="${listLiveInfo}" var="info">
     <tr>
    <td>原房号</td>
    <td><input type="text" value="${info.roomId}" name="roomId" id="yRoomId" class="form-control" readonly="readonly"/></td>
    <td>已交金额</td>
    <td><input type="text" value="${info.liveMoney}" readonly="readonly" id="oldliveMoney" class="form-control"/></td>
    </tr>
    <c:forEach items="${room}" var="r">
     <tr>
    <td>原房间类型</td>
    
    <td><input type="text" value="${r.roomType.roomType}" readonly="readonly" class="form-control"/></td>
    <td>原房价</td>
    <td><input type="text" value="${r.roomType.roomPrice}" readonly="readonly" class="form-control"/></td>
    </tr>
    </c:forEach>
    </c:forEach>
   
    <tr><td>房间类型</td>
    <td><select name="roomTypeId" id="roomTypeId" onchange="chouseRoomType(this)">
    <option value="0">请选择房间类型</option>
    <c:forEach items="${rtype}" var="rtype">
    <option value="${rtype.roomTypeId}">${rtype.roomType}</option>
    </c:forEach>
    </select></td>
    
    
    <td>新房号</td>
    <td><select name="newRoomId" id="roomId">
    
    </select>
    
    </td>
    </tr>
    <tr>   
    <td>新房价</td>
    <td><input type="text" class="form-control" id="new" readonly="readonly" /></td>
    <td>押金</td>
    <td><input type="text" class="form-control" id="ya" readonly="readonly" /></td>
    </tr>
    <tr><td>补交金额</td><td><input type="text" name="" id="hh" readonly="readonly" />
   </td><td> 总金额</td><td><input type="text" name="newLiveMoney" id="newLiveMoney" readonly="readonly" ></td></tr>
    <tr>
    <td></td>
    <td style="text-align: center;"><input type="submit"  value="确定" class="btn btn-primary bt"/></td>
    
    <td style="text-align: center;">
     <c:forEach items="${listLiveInfo}" var="info">
     <input type="hidden" value="${info.liveDays}"  id="tian" readonly="readonly" />
    <a href="selec?roomId=${info.roomId}" class="btn btn-default">取消换房</a>
    
    </c:forEach> </td>  <td></td> </tr>
    </table>
    </form>
  </body>
  <script type="text/javascript">  
  
  function myCheck(){
  var str=true;
  if($("#roomId").val()==0){
  alert("该房间类型不存在，请换一个房间类型");
  str=false;
  }else if($("#roomTypeId").val()==0){
  alert("请先选择要更换的房间类型");
  str=false;
  }
  return str;
  }
  
  
  function chouseRoomType(str){
 var s=$(str).val();
 //先清除原来下拉框中的值
 $("#roomId").empty();//移除当中的元素
 $.post("IdMoney",{roomtypeId:s},function(data){
  	for(i=0;i<data.length;i++){
					$("#roomId").append("<option value='"+data[i].roomId+"'>"+data[i].roomId+"</option>");
			}
  })
 //根据选择的房间类型 
 $.post("findRtypeById",{roomTypeId:s},function(data){
 var p=data.roomPrice;
 var m=data.money
 var n=$("#oldliveMoney").val();
   //天数
  var tian=$("#tian").val();

  //房价
  $("#new").val(p);
  var n2=$("#new").val()
  //押金
 $("#ya").val(m);
  var a=$("#ya").val();
 //赋值给对应的文本框
  
  $("#hh").val(p*1*tian+m*1-n*1);
  $("#newLiveMoney").val(n2*tian+a*1);
 });
 }
 

 
  
  </script>
</html>
