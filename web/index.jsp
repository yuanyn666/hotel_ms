<%--
  Created by IntelliJ IDEA.
  User: Yuan-King
  Date: 2018/5/3
  Time: 1:45
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <title>$Title$</title>
    <style type="text/css">
      .footer_phone {
        clear: both;
        height: 26px;
        padding: 74px 0px 9px 20px;
        overflow: hidden;
        font-size: 12px;
        color: #535353;
      }
      .footer_area {
        background: url(<%=basePath%>image/ft_logo1.jpg) no-repeat right 8px;
        color: #535353;
        margin-right: 7px;
        font-size: 12px;
        width: 99%;
        height: 100px;
        line-height: 20px;
        text-align: center;
        clear: both;
        bottom: 0px;
      }
    </style>
  </head>
  <body>
  <div class="text" style=" text-align:center;">版本信息</div>
  <div class="footer_area">
    <div class="footer_phone">
      <p><em>服务热线：</em><span>95566</span>（大陆地区）；<span>+86(区号)95566</span> （海外及港澳台地区）    <em class="footer_sp">信用卡热线：</em><span>40066-95566</span>（大陆地区）； <span>+86 10-66085566</span>（海外及港澳台地区）</p>
    </div>
    <p>
      <!--取提示信息栏目前四篇文档-->

      <a href="http://www.bankofchina.com/custserv/cs1/200812/t20081209_135605.html">
        网站地图
      </a><i>|</i>

      <a href="http://www.bankofchina.com/custserv/cs1/200812/t20081209_135606.html">
        版权声明
      </a><i>|</i>

      <a href="http://www.bankofchina.com/custserv/cs1/200812/t20081209_135607.html">
        使用条款
      </a><i>|</i>

      <a href="http://www.bankofchina.com/custserv/cs1/200812/t20081212_257687.html">
        联系我们
      </a><i>|</i>


      京ICP备10052455号 京公网安备110102002036号
    </p>
    <p>Copyright© NING OF THE KING(NOTK) All Rights Reserved. </p>
  </div>
  </body>
</html>
