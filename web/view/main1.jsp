<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();//获取当前的系统路径(得到项目名)
//request.getScheme()返回协议名称(默认是http)  request.getServerName()返回你浏览器的主机名称 
//request.getServerPort() 获取服务器端口号
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


 <!DOCTYPE html>
<html>
<head>
	
    <base href="<%=basePath%>">
    
    <title>显示信息</title>
    
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
		<script type="text/javascript" src="layer/layer.js"></script><!-- 模态弹窗 -->
  </head>
  <style>
  .btnh{height:50px;}
   .btnh1{height:30px;
   margin-top: -12px;
   }
  .btnh2{height:70px;
  	width:100px;
  	margin:4px; }
  
  .btnh3{height:70px;
  	width:300px;
  	}
  	
#left2{ width: 150px;
 	 height:450px;
 	border: 0px red solid;
	padding-left: 20px;
	padding-right: 60px;
  }
  #left2>span{ float:left;
  	margin: 10px;
  	margin-bottom:0px;
  	margin-right: 4px;
  }
  #left2>span>span{ font-size:12px;}
  
  #left3{
  border: 0px yellow solid;
  }
  .bor{border:  1px green solid;}
	#dh{
	width: 100%;
	height: 50px;
	border:  0px blue solid;
  	display: block;
}
  .p1{width: 16%;
  height:630px;
  	float: left;
  	display: block;
  	border:  1px green dotted;
  }
   .p2{width: 60%;
  	float: left;
  	display: block;
  	 	border:  1px red dotted;
  	}
   .p3{width: 23%;
  	 height:630px;
  	float: left;
  	display: block;
  	border:  1px green dotted;
  	}
  #shua{
  margin-left:20px;
  margin-bottom: 20px;
  }
  #zhuxiao{
  	margin-right:20px;
   margin-bottom: 20px;
  }
  #p22{
  margin-bottom:10px; 
  }
  .tpJian{
  margin:5px;
 
  }
  
 /*霍闪闪*/ 
#pos{
position: relative;
}
#z1{
display:none;
width:100%;
height: 100%;
opacity:0.5;
background-color:#CCC;
position: absolute;
z-index:1;
}
#d2{
display:none;
width:800px;
height: 820px;
border:1px solid #000;
border-radius:5px;
position: absolute;
z-index:5;
margin-left:100px ;
background-color: white;
}

#context{
width: 100%;
height: 20px;
position: absolute;
}
#xiang{
width: 700px;
height: 600px;
}
#People{
width: 30px;
margin-left: 10px;
margin-right: 10px;
}
#daty{
width: 30px;
margin-left: 10px;
margin-right: 10px;
}
#middon{
width: 700px;
height: 200px;
margin-top:-100px;
display: none;
overflow: auto;
}
#suo{
border: 1px solid #CCC;
float: left;
}
#jie{
margin-right:10px;
float: right;
padding-top:30%;
}

.h1{
padding-right: 200px;
font-size: 35px;
}
.h2{
font-size: 30px;
}
	.tw{
width:700px; 
height:50px;
margin:0px auto;
overflow: auto;
}
#close{
background-color:#CCC;
border-radius:5px; 
widte:50px; 
heght:50px; 
position: absolute; 
right: 0px; 
top:0px;
}
#z2{
display:none;
width:100%;
height: 100%;
opacity:0.5;
background-color:#CCC;
position: absolute;
margin-top:0px;
z-index:2;
}
#hui{position: absolute;
 border: 1px solid black; 
 width: 700px; height: 300px;
 display: none;z-index:6;
 margin-top: 0px;
 background-color: white; 
 margin-left: 0px;
 overflow: auto;
 }

  </style>
  <body>
  
  <div id="z1"></div><%--
  
   <div id="dh">
顶部操作
</div>
   --%><!-- 朕 -->

<div class="container-fluid">
	<div class="row">
		<div class="p1">
		<div id="left2" >
<span><br>房态统计</span>
<span><button type="button" class="btn btn-primary" id="b1" onclick="chec(this)">全&nbsp;&nbsp;&nbsp;部</button>
<input type="hidden" name="num" value="0"/><span >（${num }间）</span></span>

<span><button type="button" class="btn btn-success" onclick="chec(this)">空&nbsp;&nbsp;&nbsp;房</button>
<input type="hidden" name="num1" value="1"/><span>（${num1 }间）</span></span>

<span><button type="button" class="btn btn-default" onclick="chec(this)">预订房</button>
<input type="hidden" name="num2" value="2"/><span>（${num2 }间）</span></span>

<span><button type="button" class="btn btn-info" onclick="chec(this)">已住房</button>
<input type="hidden" name="num3" value="3"/><span id="sp">（${num3 }间）</span></span>

<span><button type="button" class="btn btn-warning" onclick="chec(this)">空脏房</button>
<input type="hidden" name="num5" value="5"/><span>（${num5 }间）</span></span>

<span><button type="button" class="btn btn-danger" onclick="chec(this)">维修房</button>
<input type="hidden" name="num4" value="4"/><span id="sp">（${num4 }间）</span></span>

</div>

<div id="shua">
<a href="showRoomIST" class="btn btn-default">刷新</a>
</div>
</div>
		
		<div id="pos">
		<!-- 弹窗 -->
		<div id="d2">
   <div id="close">
   <a style="text-decoration: none;" href="javascript:close(this)">关闭</a>
   </div>
   <span style="position: absolute; left: 0px;top: 0px">客户登记</span><br/><br/>
   		<div id="context">
   			房间号：<span class="h1"></span>房间价格：<span class="h2"></span> <input id="h3" value=""  type="hidden"/><input type="hidden" value="" id="type2">
   		</div><br><br/>
   		
   		<form action="insert" method="post" onsubmit="return checkYan(this)">
   		<div id="suo">
   			<div id="xiang">
   			<input type="hidden" name="roomId" id="h1" readonly="readonly">
   			<table  class=" table tw" >
   			<tr><td>入住编号：</td><td><input type="text" name="liveId" value="${df}" class="form-control btnh" placeholder="入住编号"  readonly="readonly"></td><td>入住押金：</td><td><input type="text"  class="ru" readonly="readonly" class="form-control btnh" ></td></tr>
   			<tr><td>入住日期:</td><td><input type="text" name="liveTime" id="liveTime" class="form-control btnh" value="${time}" readonly="readonly"></td>
   			<td>客户类型：</td><td><select name="customerTypeId" id="custo" onchange="change(this)">
   			<c:forEach items="${custo}" var="c">
   			<option value="${c.customerTypeId}">${c.cTypeName}</option>
   			</c:forEach></select></td></tr>
   			<tr><td>客户名称:<span style="color: red">*</span></td>
   			<td><input type="text" name="customerName" id="name" class="form-control btnh" placeholder="请输入姓名" onchange="myCheckName(this)" ></td>
   			<td>折扣：</td><td>
   			<input type="text" id="dis" name="disCount" value="1" readonly="readonly"></td></tr>
   			<tr><td>证件类型:：</td><td><select name="cardType">
   			<option>身份证</option>
   			<option>港澳台证</option>
   			<option>华侨证</option>
   			</select></td><td>证件号码:<span style="color: red">*</span></td>
   			<td><input type="text" name="cardId" id="jian" class="form-control btnh"  placeholder="请输入证件" onchange="myCkeckJian(this)"></td></tr>
   			<tr><td>联系电话:<span style="color: red">*</span></td>
   			<td><input type="text" name="phone" id="dian" class="form-control btnh" placeholder="请输入电话" onchange="myCheckPhone(this)"  ></td>
   			<td>地址:</td><td><input type="text" name="address" class="form-control btnh"  placeholder="请输入地址" ></td></tr>
   			<tr><td>入住人数:</td><td><input type="button" value="-" size="2" class="btnh1" onclick="people(this)"><input type="text" name="liveNum"  value="1" readonly="readonly"  id="People"><input type="button" value="+" size="2" class="btnh1"  id="jia" onclick="people(this)"></td>
   			<td>付款方式:</td><td><select name="payType">
   			<option>现金支付</option>
   			<option>支付宝支付</option>
   			<option>微信支付</option>
   			</select></td></tr>
   			<tr><td>入住天数:</td><td><input type="button" value="-" size="2" class="btnh1" onclick="changeAll(this)">
   			<input type="text" name="liveDays" value="1" id="daty" size="2" readonly="readonly"><input type="button" value="+" class="btnh1" size="2" onclick="changeAll(this)"></td>
   			<td>总额：</td><td><input type="text"  id="money" name="liveMoney"class="form-control" readonly="readonly"></td></tr>
   			<tr><td>客户性别:</td><td><select name="customerSex">
   			<option>男</option><option>女</option>
   			</select></td>
   			<td>操作人:</td><td><input type="hidden" name="userIdnumber" value="${myUsers.userId }">
   			<input type="text" name="userIdnumber1" readonly="readonly" value="${myNames }">
   			</td></tr>
   			<tr><td>备注:</td><td colspan="4">
   			<textarea rows="2" cols="100" name="mark" class="form-control " placeholder="备注" ></textarea>
   			<input type="hidden" name="state" value="1"><input type="hidden" name="roomId" id="h2"></td></tr>
   			</table>
   			</div><br/>
   			<br/>
   			<div id="middon">
   			<table border="1" width="600px">
   			<tr>
   			<td></td><td>房间号</td><td>房间类型</td><td>房间价格</td><td>房间状态</td><td>押金</td><td>总额</td>
   			</tr>
   			<c:forEach items="${room}" var="m">
   			<tr>
   			<td><input type="checkbox" value="${m.roomId},${m.roomType.roomPrice+m.roomType.money}"  class="check"  name="roomId1"/></td>
   			<td class="check2" >${m.roomId}</td><td>${m.roomType.roomType}</td><td class="moneyFang">${m.roomType.roomPrice}</td><td>${m.roomstate.roomState}</td><td class="moneyYa">${m.roomType.money}</td><td class="totalMoney">${m.roomType.roomPrice+m.roomType.money}</td>
   			</tr>
   			</c:forEach>
   			</table>		
   			
   		</div>
   	  </div>
   	  <div id="z2"></div>
   	  <div id="jie">
   	  	<input type="submit" value="保存" id="btn"  class="btn btn-default"><br/><br/>
   	  	<input type="reset" value="取消" class="btn btn-default">
   	  	</div>
   	  	</form>
   	  	</div>
		
		
		<div class="p2">
	<div id="p21">
		<div id="left3" >
<c:forEach items="${info}" var="nf">
<c:choose>
   <c:when test="${nf.roomstate.roomStateId==1}"><button type="button" class="btn btn-success btnh2" onclick="add(this)">${nf.roomId }<br/>${nf.roomType.roomType }<br/>${nf.roomstate.roomState } </button>
   <input type="hidden" name="roomId" value="${nf.roomId}"><input type="hidden" name="roomPrice" value="${nf.roomType.roomPrice}">
   <input type="hidden" name="money" value="${nf.roomType.money}"><input type="hidden" name="roomState1" value="${nf.roomstate.roomStateId}"></c:when>  
    <c:when test="${nf.roomstate.roomStateId==2}"><button type="button" class="btn btn-default btnh2" onclick="add(this)">${nf.roomId }<br/>${nf.roomType.roomType } <br/>${nf.roomstate.roomState } </button>
    	<input type="hidden" name="roomId" value="${nf.roomId}"><input type="hidden" name="roomPrice" value="${nf.roomType.roomPrice}">
   		<input type="hidden" name="money" value="${nf.roomType.money}"><input type="hidden" name="roomState1" value="${nf.roomstate.roomStateId}"></c:when>  
    <c:when test="${nf.roomstate.roomStateId==3}"><button type="button" class="btn btn-info btnh2" onclick="add(this)">${nf.roomId }<br/>${nf.roomType.roomType } <br/>${nf.roomstate.roomState } </button>
     	<input type="hidden" name="roomId" value="${nf.roomId}"><input type="hidden" name="roomPrice" value="${nf.roomType.roomPrice}">
   		<input type="hidden" name="money" value="${nf.roomType.money}"> <input type="hidden" name="roomState1" value="${nf.roomstate.roomStateId}"></c:when>
     <c:when test="${nf.roomstate.roomStateId==4}"><button type="button" class="btn btn-danger btnh2" onclick="add(this)">${nf.roomId }<br/>${nf.roomType.roomType } <br/>${nf.roomstate.roomState } </button>
     	<input type="hidden" name="roomId" value="${nf.roomId}"><input type="hidden" name="roomPrice" value="${nf.roomType.roomPrice}">
   		<input type="hidden" name="money" value="${nf.roomType.money}"><input type="hidden" name="roomState1" value="${nf.roomstate.roomStateId}"></c:when>
    <c:when test="${nf.roomstate.roomStateId==5}"><button type="button" class="btn btn-warning btnh2" onclick="add(this)">${nf.roomId }<br/>${nf.roomType.roomType } <br/>${nf.roomstate.roomState } </button>
    	<input type="hidden" name="roomId" value="${nf.roomId}"><input type="hidden" name="roomPrice" value="${nf.roomType.roomPrice}">
   		<input type="hidden" name="money" value="${nf.roomType.money}"><input type="hidden" name="roomState1" value="${nf.roomstate.roomStateId}"></c:when> 
   </c:choose>
</c:forEach>
<br>
</div>

</div>
	<div id="p22">
	<table>
	<caption><h4>各房间类别价格</h4></caption>
	<tr><c:forEach items="${listRoomType}" var="listRoomType1">
<td><button type="button"class="btn btn-default btn-lg tpJian" disabled="disabled">
${listRoomType1.roomType}:${listRoomType1.roomPrice}元/间
</button></td>

</c:forEach></tr>
	
	</table>
	
		
</div>
<div id="hui">
		<table class="table table-striped table-hover tw">
   <tr>
   <td></td><td>会员卡号</td><td>姓名</td><td>性别</td><td>地址</td><td>电话</td><td>证件类型</td>
   <td>证件号</td><td>余额</td><td>积分</td>
  
   </tr>
   <c:forEach items="${slist}" var="s" varStatus="z">
   <tr>
   <td><input type="radio" name="rad" class="sl"/></td>
   <td>${s.spId}</td>
   <td class="spname${z.count}">${s.spName}</td>
   <td class="spsex${z.count}">${s.spSex}</td>
   <td class="spaddress${z.count}">${s.spAddress}</td>
   <td class="spphone${z.count}">${s.spPhone}</td>
   <td class="spcardtype${z.count}">${s.spCardType}</td>
   <td class="spcardid${z.count}">${s.spCardId}</td>
   <td>${s.balance}</td>
   <td>${s.integration}</td>
   </tr>
   </c:forEach>
   </table>
   <span style="margin-left: 500px"><a href="javascript:hui(this)" class="btn btn-primary">确定</a></span>
		</div>
		</div>
		</div>
		
		
		<div id="aa" class="p3" >
		<div>
		<table border="1"  class="table table-striped table-hover">
		<thead><tr><th colspan="3"><h4>在住人信息(入住${lel}人)</h4></th></tr></thead>
		<tr><td>在住房号</td><td>入住时间</td><td>入住天数</td></tr>
		<c:forEach items="${liveinfo}" var="liveinfo">
		<tr><td>${liveinfo.roomId}</td><td>${liveinfo.liveTime}</td><td>${liveinfo.liveDays}</td></tr>
		</c:forEach>
		</table>
		</div>
		<div id="zhuxiao">
		<a href="javascript:" class="btn btn-default" onclick="myLogin()">注销登录</a>
	</div>
		</div>
		
	</div>
	
</div>


<!-- 朕 -->







<script>





//房间单击查询显示事件
function chec(str){
var roomSid=$(str).next().val();//获取当前按钮的下一个元素的值
$.post("mmm",{roomStateid:roomSid},function(data){
		
			
		if(roomSid==0){//显示全部
			$("#left3").empty();//清除div中的元素	
		for(d in data){
		if(data[d].roomstate.roomStateId==1){
		$("#left3").append("<button type='button' class='btn btn-success btnh2' onclick='add(this)'>"+data[d].roomId+"<br/>"+data[d].roomType.roomType+" <br/>"+data[d].roomstate.roomState+"</button>"+
		"<input type='hidden' name='roomId' value='"+data[d].roomId+"'>"+
		"<input type='hidden' name='roomPrice' value='"+data[d].roomType.roomPrice+"'>"+
		"<input type='hidden' name='money' value='"+data[d].roomType.money+"'>"+
		"<input type='hidden' name='roomState1' value='"+data[d].roomstate.roomStateId+"'>");
		}
		if(data[d].roomstate.roomStateId==2){
		$("#left3").append("<button type='button' class='btn btn-default btnh2' onclick='add(this)'>"+data[d].roomId+"<br/>"+data[d].roomType.roomType+" <br/>"+data[d].roomstate.roomState+"</button>"+
		"<input type='hidden' name='roomId' value='"+data[d].roomId+"'>"+
		"<input type='hidden' name='roomPrice' value='"+data[d].roomType.roomPrice+"'>"+
		"<input type='hidden' name='money' value='"+data[d].roomType.money+"'>"+
		"<input type='hidden' name='roomState1' value='"+data[d].roomstate.roomStateId+"'>");
		}
		if(data[d].roomstate.roomStateId==3){
		$("#left3").append("<button type='button' class='btn btn-info btnh2' onclick='add(this)'>"+data[d].roomId+"<br/>"+data[d].roomType.roomType+" <br/>"+data[d].roomstate.roomState+"</button>"+
		"<input type='hidden' name='roomId' value='"+data[d].roomId+"'>"+
		"<input type='hidden' name='roomPrice' value='"+data[d].roomType.roomPrice+"'>"+
		"<input type='hidden' name='money' value='"+data[d].roomType.money+"'>"+
		"<input type='hidden' name='roomState1' value='"+data[d].roomstate.roomStateId+"'>");
		
		}
		if(data[d].roomstate.roomStateId==4){		
		$("#left3").append("<button type='button' class='btn btn-danger btnh2' onclick='add(this)'>"+data[d].roomId+"<br/>"+data[d].roomType.roomType+" <br/>"+data[d].roomstate.roomState+"</button>"+
		"<input type='hidden' name='roomId' value='"+data[d].roomId+"'>"+
		"<input type='hidden' name='roomPrice' value='"+data[d].roomType.roomPrice+"'>"+
		"<input type='hidden' name='money' value='"+data[d].roomType.money+"'>"+
		"<input type='hidden' name='roomState1' value='"+data[d].roomstate.roomStateId+"'>");
		
		}
		if(data[d].roomstate.roomStateId==5){		
		$("#left3").append("<button type='button' class='btn btn-warning btnh2' onclick='add(this)'>"+data[d].roomId+"<br/>"+data[d].roomType.roomType+" <br/>"+data[d].roomstate.roomState+"</button>"+
		"<input type='hidden' name='roomId' value='"+data[d].roomId+"'>"+
		"<input type='hidden' name='roomPrice' value='"+data[d].roomType.roomPrice+"'>"+
		"<input type='hidden' name='money' value='"+data[d].roomType.money+"'>"+
		"<input type='hidden' name='roomState1' value='"+data[d].roomstate.roomStateId+"'>");
		}
		}	
		}
			
		if(roomSid==1){
				if(data.length==0){
			alert("暂无空房间");
			}else{
				$("#left3").empty();//清除div中的元素	
		for(d in data){//遍历添加查询出的内容  空房间
		$("#left3").append("<button type='button' class='btn btn-success btnh2' onclick='add(this)'>"+data[d].roomId+"<br/>"+data[d].roomType.roomType+" <br/>"+data[d].roomstate.roomState+"</button>"+
		"<input type='hidden' name='roomId' value='"+data[d].roomId+"'>"+
		"<input type='hidden' name='roomPrice' value='"+data[d].roomType.roomPrice+"'>"+
		"<input type='hidden' name='money' value='"+data[d].roomType.money+"'>"+
		"<input type='hidden' name='roomState1' value='"+data[d].roomstate.roomStateId+"'>");
		}			}
		}
		
		if(roomSid==2){
				if(data.length==0){
			alert("暂无预定房");
			}else{
				$("#left3").empty();//清除div中的元素	
				for(d in data){//遍历添加查询出的内容 预定房
		$("#left3").append("<button type='button' class='btn btn-default btnh2' onclick='add(this)'>"+data[d].roomId+"<br/>"+data[d].roomType.roomType+" <br/>"+data[d].roomstate.roomState+"</button>"+
		"<input type='hidden' name='roomId' value='"+data[d].roomId+"'>"+
		"<input type='hidden' name='roomPrice' value='"+data[d].roomType.roomPrice+"'>"+
		"<input type='hidden' name='money' value='"+data[d].roomType.money+"'>"+
		"<input type='hidden' name='roomState1' value='"+data[d].roomstate.roomStateId+"'>");	
		}		}
		}
		if(roomSid==3){
				if(data.length==0){
			alert("暂无已住房");
			}else{
				$("#left3").empty();//清除div中的元素	
		for(d in data){//遍历添加查询出的内容 已住房
		$("#left3").append("<button type='button' class='btn btn-info btnh2' onclick='add(this)'>"+data[d].roomId+"<br/>"+data[d].roomType.roomType+" <br/>"+data[d].roomstate.roomState+"</button>"+
		"<input type='hidden' name='roomId' value='"+data[d].roomId+"'>"+
		"<input type='hidden' name='roomPrice' value='"+data[d].roomType.roomPrice+"'>"+
		"<input type='hidden' name='money' value='"+data[d].roomType.money+"'>"+
		"<input type='hidden' name='roomState1' value='"+data[d].roomstate.roomStateId+"'>");
		}		}	
		}
		if(roomSid==4){
				if(data.length==0){
			alert("暂无维修房");
			}else{
				$("#left3").empty();//清除div中的元素	
		for(d in data){//遍历添加查询出的内容 维修房
		$("#left3").append("<button type='button' class='btn btn-danger btnh2' onclick='add(this)'>"+data[d].roomId+"<br/>"+data[d].roomType.roomType+" <br/>"+data[d].roomstate.roomState+"</button>"+
		"<input type='hidden' name='roomId' value='"+data[d].roomId+"'>"+
		"<input type='hidden' name='roomPrice' value='"+data[d].roomType.roomPrice+"'>"+
		"<input type='hidden' name='money' value='"+data[d].roomType.money+"'>"+
		"<input type='hidden' name='roomState1' value='"+data[d].roomstate.roomStateId+"'>");
		}		}	
		}
		if(roomSid==5){
				if(data.length==0){
			alert("暂无空脏房");
			}else{
				$("#left3").empty();//清除div中的元素	
		for(d in data){//遍历添加查询出的内容 空脏房
		$("#left3").append("<button type='button' class='btn btn-warning btnh2' onclick='add(this)'>"+data[d].roomId+"<br/>"+data[d].roomType.roomType+" <br/>"+data[d].roomstate.roomState+"</button>"+
		"<input type='hidden' name='roomId' value='"+data[d].roomId+"'>"+
		"<input type='hidden' name='roomPrice' value='"+data[d].roomType.roomPrice+"'>"+
		"<input type='hidden' name='money' value='"+data[d].roomType.money+"'>"+
		"<input type='hidden' name='roomState1' value='"+data[d].roomstate.roomStateId+"'>");
		}	}
		}
		
});
}

//注销登录
function myLogin(){
$.post("zhuXiao",function(data){
if(data=="true"){
window.parent.location="login.jsp";
}else{
alert("注销失败");
}
});

}


//////////
//点击入住
function add(str){
 //房间号
var myroomId=$(str).next().val();
$(".check2").each(function(){
var ch=$(this).html();
if(ch==myroomId){
$(this).parent().remove();
}
});


//房间价格
var roomPrice=$(str).next().next().val();
//押金
var myMoney=$(str).next().next().next().val();
//获取房间状态
var myRoomState=$(str).next().next().next().next().val();

if(myRoomState==1){
//显示房间号和房间价格,房间押金
 $("#h1").val(myroomId);
  $(".h1").html(myroomId);
  $(".h2").html(roomPrice);
  $(".ru").val(myMoney);
  //总金额
  var sum=roomPrice*1+myMoney*1;
  $("#money").val(Math.round(sum));
  //获取入住时间
  $.post("rdate",function(data){
  $("#liveTime").val(data);
  });
  //打开弹窗
  $("#z1").css("display","block");
   $("#d2").css("display","block");
}else if(myRoomState==4){
alert("房间维修中");
}else if(myRoomState==3){//房间已入住
window.location="selec?roomId="+myroomId;
}else if(myRoomState==2){//房间已预订
window.location="bookReserve?roomId="+myroomId;
}else if(myRoomState==5){//空脏房
	$.ajax({
  					type:"post",
  					url:'sess',
    				data:{roomId:myroomId},
   					 async:false,//把异步提交关闭，设置为同步提交
      					 });
 layer.open({
  type: 2 //Page层类型
  ,area: ['550px', '450px']
  ,title: '修改房间状态'
  ,shade: 0.6 //遮罩透明度
  ,anim: 3 //0-6的动画形式，-1不开启
  ,content: 'view/UpdateTai.jsp',
  offset: '70px',
  resize:false,
   cancel: function(){ 
  parent.location.reload();
}
  	});
}
}
  
  //关闭弹窗
 function close(str){
    $("#z1").css("display","none");
   $("#d2").css("display","none");
   
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
var people1=people*1+1;
$("#People").val(people1);
if(people1>2&&people<3){
alert("该房间只能住两人！是否多选其他房间");
$("#middon").css("display","block");
}
}
}
  
  
//入住天数加减
  var o=[];
 var oo=[];
   var yj=[];
  function changeAll(str){
  //获取当前单击按钮的值
   var p=[];
  var s=$(str).val();
  //获取客户类型
  var custo=$("#custo").val();
  //获取当前天数的值
  	var w=$("#daty").val();
  	var roomPrice=$(".h2").html();
 	var myMoney=$(".ru").val();
  	if(s=="-"){  	
  	if(w<=1){
  	alert("入住天数不能小于1");
  	}else{
 if(w1<=1){
  	$(".totalMoney").each(function(){
  	var s=$(this).html();
	var sd=s*w1;
	p.push(sd);
  	});
}
else{
  	$.each(oo,function(i,d){
  	w1=w*1-1;
  	var a=w1*d;
  	$(".totalMoney:eq("+i+")").html(a*1+yj[i]*1);
  	});
  	 $('input:checkbox[name="roomId1"]:checked').each(function()
   {  
     var fangjianhao=$(this).parent().next().text();  
     var zongjia= $(this).parent().next().next().next().next().next().next().text();
     $(this).val(fangjianhao+","+zongjia);
   }); 
}

  	$.each(p,function(i,d){
  	$(".totalMoney:eq("+i+")").html(d);
  	})
  	w1=w*1-1;
  	$("#daty").val(w1);
  	if(custo==1){
  	var money=roomPrice*w1+myMoney*1;
  	}else if(custo==2){
  	var money=roomPrice*w1*0.8+myMoney*1;
  	}else if(custo==3){
  	var money=roomPrice*w1*0.7+myMoney*1;
  	}
  	$("#money").val(Math.round(money));
  	}  	}else if(s=="+"){
  	var w1=w*1+1;//天数加一
if(w1<=1){
  	$(".totalMoney").each(function(){
  	var s=$(this).html();
	var sd=s*w1;
	p.push(sd);
  	});
}
else{
  	$.each(oo,function(i,d){
  	var a=w1*d;
  $(".totalMoney:eq("+i+")").html(a*1+yj[i]*1);
  	});
  	 $('input:checkbox[name="roomId1"]:checked').each(function()
   {  
     var fangjianhao=$(this).parent().next().text();  
     var zongjia= $(this).parent().next().next().next().next().next().next().text();
     $(this).val(fangjianhao+","+zongjia);
   }); 
}

  	$.each(p,function(i,d){
  	$(".totalMoney:eq("+i+")").html(d);
  	})

  	$("#daty").val(w1);
  	if(custo==1){
  	var money=roomPrice*w1+myMoney*1;
  	var s=$(".totalMoney").html();
  	}else if(custo==2){
  	var money=roomPrice*w1*0.8+myMoney*1;

  	}else if(custo==3){
  	var money=roomPrice*w1*0.7+myMoney*1;
  	}
  	//向上取整
  	var ms=Math.round(money);
  	$("#money").val(ms);
  	}
  }
  $(function(){
  $(".moneyYa").each(function(){
  var y=$(this).html();
  yj.push(y);
  })
   $(".totalMoney").each(function(){
  	var s=$(this).html();
	o.push(s);
  	});
  	for(var i=0;i<yj.length;i++){
  	oo.push((o[i]-yj[i]));
  	}
  	}
  )
  
//房客类型改变事件
 function change(str){
 //客户类型1，2，3
 var curs=$(str).val();
 //获取当前天数的值
  	var w=$("#daty").val();
  	var roomPrice=$(".h2").html();
 	var myMoney=$(".ru").val();
 	//根据客户类型判断行进计算总金额
	if(curs==1){
	var a="";
    $("#name").val(a);
    $("#sex").val(a);
    $("#address").val(a);
    $("#dian").val(a);
    $("#xing").val(a);
    $("#jian").val(a); 
	$("#dis").val(1);
	var money=w*roomPrice+myMoney*1;
	$("#money").val(Math.round(money));
	}else if(curs==2){
	var a="";
    $("#name").val(a);
    $("#sex").val(a);
    $("#address").val(a);
    $("#dian").val(a);
    $("#xing").val(a);
    $("#jian").val(a); 
	$("#dis").val(0.8);
	var money=w*roomPrice*0.8+myMoney*1;
	$("#money").val(Math.round(money));
	}else if(curs==3){
	 $("#z2").css("display","block");
     $("#hui").css("display","block")
	$("#dis").val(0.7);
	var money=w*roomPrice*0.7+myMoney*1;
	$("#money").val(Math.round(money));
	}
}


//关闭会员
function hui(str){
var sl=$('input:radio:checked').val();
if(sl!=null){
var shu=0;
$(".sl").each(function(){
shu+=1;
if($(this).is(":checked")){
var spname=$(".spname"+shu).html();
var spsex=$(".spsex"+shu).html();
var spaddress=$(".spaddress"+shu).html();
var spphone=$(".spphone"+shu).html();
var spcardtype=$(".spcardtype"+shu).html();
var spcardid=$(".spcardid"+shu).html();
$("#name").val(spname);
$("#sex").val(spsex);
$("#address").val(spaddress);
$("#dian").val(spphone);
$("#xing").val(spcardtype);
$("#jian").val(spcardid);
}
})    }else{
alert("您还没有选择会员");
}
  $("#z2").css("display","none");
  $("#hui").css("display","none");
}


//验证部分
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
  //身份证件号
  function myCkeckJian(st){
 var jian=/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;//身份证号(15位、18位数字)，最后一位是校验位，可能为数字或字符X
  var t1=$(st).val();
  if(!jian.test(t1)){
   str=false;
  alert("身份证号(15位、18位数字)，最后一位是校验位，可能为数字或字符X");
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


 function checkYan(){
    var name=/^[\u4e00-\u9fa5]{0,}$/; //中文
     var phone=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
     var jian=/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;//身份证号(15位、18位数字)，最后一位是校验位，可能为数字或字符X
   if($("#usersRoleId").val()==0){
   alert("请选择职位");
   str=false;
   }else if($("#name").val()==""||!name.test($("#name").val())){
 alert("姓名不为空，切只能为中文");
 str=false;
 }else if($("#jian").val()==""||!jian.test($("#jian").val())){
   alert("身份证号(15位、18位数字)，最后一位是校验位，可能为数字或字符X。不为空");
  str=false;
 }else if($("#dian").val()==""||!phone.test($("#dian").val())){
  alert("手机号不为空或格式不正确");
  str=false;
 }
  return str; 
   }
   


</script>
</body>
</html>
