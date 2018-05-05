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
    
    <title>添加房间</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
	<style>
.tw{
width:500px; 
height:50px;
margin-top:0px;
margin-left:200px;
border: 1px solid gray;
overflow: auto;
}
#t{
width:100px;
}
#s{
width:5px;
height:5px;
color:red;
}
#reset{
margin-left: 320px;
}
	</style>
	  <script type="text/javascript">
	  function change(){
	  var t1=$("#t1").val();
	  var t2=$("#t2").val();
	  $.post('findMaxRoomId',{roomBuild:t1,floor:t2},function(data){
	  //房间号
	  $("#t3").val(data);
	  //电话获取房间号的值
 		$("#t4").val(data);
	  });
	  }
  </script>
  </head>
  <body>   
   <form action="insertRoom" method="post" onsubmit="return myCheck()">
   <c:forEach items="${list}" var="r">
   <input type="hidden" value="${r.roomId}" class="rId"/>
   </c:forEach>
    <table class="table table-striped table-hover tw">
    <tr><td colspan="2" style="text-align: center;">添加房间
     <a href="showRoomInfo" id="reset" class="btn btn-primary">取消添加</a></td></tr>
    <tr>
    <td>楼栋<span id="s">*</span></td>
    <td><select id="t1" name="roomBuild" class="form-control" onchange="change()">
    <option value="1">1</option><option value="2">2</option>
    </select></td></tr>
    <tr>
    <td>楼层<span id="s">*</span></td>
    <td><select id="t2" name="floor" class="form-control" onchange="change()">
     <option value="1">1</option><option value="2">2</option>
      <option value="3">3</option><option value="4">4</option>
       <option value="5">5</option><option value="6">6</option>
        <option value="7">7</option><option value="8">8</option>
    </select></td>
    </tr>
    <tr>
    <td>房间号<span id="s">*</span></td><td>
    <input type="text" id="t3" name="roomId" class="form-control"  readonly="readonly"/></td>
    </tr>
    <tr>
    <td>房类</td><td><select name="roomTypeId" class="form-control">
    <c:forEach items="${rtlist}" var="rt">
    <option value="${rt.roomTypeId}">${rt.roomType}</option>
    </c:forEach></select></td>
    </tr>
    <tr>
    <td>房态</td><td>
    <input type="hidden" name="roomStateId" value="1"/>
    <input type="text" value="空净房" readonly="readonly" class="form-control"/></td>
    </tr>
    <tr>
    <td>电话<span id="s">*</span></td><td>
    <input type="text" id="t4" name="roomPhone" class="form-control" readonly="readonly"/>
    <!-- 标识 --><input type="hidden"  name="stateTime" value="1"/></td>
    </tr>
    <tr>
     <td colspan="2" style="text-align: center;">
     <input type="submit" value="确定" class="btn btn-primary"/>
         &nbsp;&nbsp;&nbsp;&nbsp;
     <input type="submit" value="重置" class="btn btn-primary"/></td>
     </tr>
    </table> 
    </form>
  </body>
<script type="text/javascript">
function myCheck(){

var s=true;
if($("#t3").val()==0){
alert("您还未选择要添加房间的楼栋楼层");
s=false;
}
return s;
}

</script>
</html>
