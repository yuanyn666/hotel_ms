<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询会员信息</title>
    
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
	<script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
<style>
a{
text-decoration: none;
color: black;
}
.tw{
border: 1px solid gray;
width:100%; 
height:50px;
text-align:center;
overflow: auto;
}
.ta{
width:100%; 
height:50px;
text-align:center;
margin-top:0px;
overflow: auto;
}
#all{
width:100%; 
height:100%; 
}
#showSp{
width:100%; 
height:350px;
margin-top:0px;
overflow: auto;
}
#select{
margin-right: 220px;
}
#add{
margin-left: 220px;
}
</style>

  </head>
  
  <body>
  <div id="all">
  <form action="findBySpId" method="post">
  <table class="table table-striped table-hover ta">
  <tr>
     <td colspan="11">会员卡号:<input type="text" name="spId" />
     <input type="submit" id="select" value="模糊查询" class="btn btn-primary"/>
     <a href="getSpId" id="add" class="btn btn-primary">添加会员</a>
     </td>
     </tr>
  </table>
    </form>
    <div id="showSp">
<table class="table table-striped table-hover tw">
   <tr>
   <td>会员卡号</td><td>姓名</td><td>性别</td><td>地址</td><td>电话</td><td>证件类型</td>
   <td>证件号</td><td>余额</td><td>积分</td><td>备注</td> <td>编辑会员</td>
  
   </tr>
   <c:forEach items="${slist}" var="s">
   <tr>
   <td>${s.spId}</td>
   <td>${s.spName}</td>
   <td>${s.spSex}</td>
   <td>${s.spAddress}</td>
   <td>${s.spPhone}</td>
   <td>${s.spCardType}</td>
   <td>${s.spCardId}</td>
   <td>${s.balance}</td>
   <td>${s.integration}</td>
   <td>${s.mark}</td>
   <td>
   <a href="findForInsert?spId=${s.spId}" class="btn btn-primary">充值</a>
   <a href="findBySuperId?spId=${s.spId}" class="btn btn-primary">修改</a>
   <a href="deleteSuper?spId=${s.spId}" class="btn btn-primary" onclick='return confirm("您忍心删除吗？");'>删除</a></td>
   </tr>
   </c:forEach>
    <c:if test="${not empty sp}">
   <c:forEach items="${sp}" var="s">
   <tr>
   <td>${s.spId}</td>
   <td>${s.spName}</td>
   <td>${s.spSex}</td>
   <td>${s.spAddress}</td>
   <td>${s.spPhone}</td>
   <td>${s.spCardType}</td>
   <td>${s.spCardId}</td>
   <td>${s.balance}</td>
   <td>${s.integration}</td>
   <td>${s.mark}</td>
   <td>
   <a href="findForInsert?spId=${s.spId}" class="btn btn-primary">充值</a>
   <a href="findBySuperId?spId=${s.spId}" class="btn btn-primary">修改</a>
   <a href="deleteSuper?spId=${s.spId}" class="btn btn-primary" onclick='return confirm("您忍心删除吗？");'>删除</a>
   </td>
   </tr>
   </c:forEach>
   </c:if>
   </table>
   </div>
   </div>
  </body>
</html>
