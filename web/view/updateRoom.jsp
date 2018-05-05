<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改房间信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<style>
.tw{
width:500px; 
height:50px;
margin-top:0px;
margin-left:200px;
border: 1px solid gray;
overflow: auto;
}
#reset{
margin-left: 320px;
}
</style>
<script type="text/javascript">
function check(){
var t1=$("#t1").val();
if(t1==0){
alert("电话不可以为空");
return false;
}
}
</script>
  </head>
  
  <body>
  <form action="updateRoom" method="post" onsubmit="return check()">
    <table  class="table table-striped table-hover tw">
     <tr><td colspan="2" style="text-align: center;">修改房间
      <a href="showRoomInfo" id="reset" class="btn btn-primary">取消修改</a></td></tr>
    <tr><td>房间号</td><td>
    <input type="text" name="roomId" value="${room.roomId}" readonly="readonly" class="form-control"/></td></tr>
    <tr><td>房类</td><td><select name="roomTypeId" class="form-control">
    <c:forEach items="${rtlist}" var="rt">
    <option value="${rt.roomTypeId}">${rt.roomType}</option>
    </c:forEach></select></td></tr>
    <tr><td>楼栋</td><td>
    <input type="text" name="roomBuild" value="${room.roomBuild}" readonly="readonly" class="form-control"/></td></tr>
    <tr><td>楼层</td>
    <td><input type="text" name="floor" value="${room.floor}" readonly="readonly" class="form-control"/></td></tr>
    <tr><td>房态</td><td><select name="roomStateId" class="form-control">
    <c:forEach items="${rslist}" var="rs" varStatus="r">
    <option value="${rs.roomStateId}" class="roomstate">${rs.roomState}</option>
    </c:forEach></select>
    </td></tr>
    <tr><td>电话</td><td><input type="text" id="t1" name="roomPhone" value="${room.roomPhone}" class="form-control" onchange="if(/\D/.test(this.value)){alert('电话只能输入数字');this.value='';}"/></td></tr>
    <tr>
     <td colspan="2" style="text-align: center;">
     <input type="submit" value="确定" class="btn btn-primary"/>
         &nbsp;&nbsp;&nbsp;&nbsp;
     <input type="reset" value="重置" class="btn btn-primary"/></td>
     </tr>
    </table> 
    </form>
  </body>
  <script type="text/javascript">
  $(".roomstate").each(function(){
  var a=$(this).html();
  if(a=='预定房'){
  $(this).remove();
  }if(a=='已住房'){
  $(this).remove();
  }
  })
  </script>
</html>
