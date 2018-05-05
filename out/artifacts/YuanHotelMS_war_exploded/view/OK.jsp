<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'OK1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/style3.css">
  </head>
  <body>
  <h1>操作成功！</h1>
     <div class="eevee">
  <div class="body">
    <div class="head">
      <div class="ears">
        <div class="ear">
          <div class="lobe"></div>
        </div>
        <div class="ear">
          <div class="lobe"></div>
        </div>
      </div>
      <div class="face">
        <div class="eyes">
          <div class="eye">
            <div class="eyelid"></div>
          </div>
          <div class="eye">
            <div class="eyelid"></div>
          </div>
        </div>
        <div class="nose"></div>
        <div class="mouth"></div>
      </div>
    </div>
    <div class="chest">
      <div class="fur">
        <div class="patch"></div>
      </div>
      <div class="fur">
        <div class="patch"></div>
      </div>
      <div class="fur">
        <div class="patch"></div>
      </div>
    </div>
    <div class="legs">
      <div class="leg">
        <div class="inner-leg"></div>
      </div>
      <div class="leg">
        <div class="inner-leg"></div>
      </div>
      <div class="leg">
        <div class="inner-leg"></div>
      </div>
      <div class="leg">
        <div class="inner-leg"></div>
      </div>
    </div>
    <div class="tail">
      <div class="tail">
        <div class="tail">
          <div class="tail">
            <div class="tail">
              <div class="tail -end"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>
