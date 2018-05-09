<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新手导航</title>
    <style>
	.news-demo {
  background: #fff;
  padding: 0px;
}

.news-demo h1 {
  text-align: center;
  font-family: Arial, sans-serif;
  color: #777;
  margin-bottom: 20px;
}

.news-demo .p {
  text-align: center;
  font-family: Arial, sans-serif;
  font-size: 22px;
  margin-top: 20px;
}

.news-demo .p ~ p {
  margin-top: 0;
}

.news-demo .p a {
  text-decoration: underline;
}

.news-demo .p a:hover {
  color: red;
}
	</style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="themes2/icon.css">
	<link rel="stylesheet" type="text/css" href="themes2/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap1.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap1.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive1.css">
	<link rel="stylesheet" type="text/css" href="css/pace-theme-barber-shop1.css">
	<link rel="stylesheet" type="text/css" href="css/xcConfirm.css">
	<link rel="stylesheet" type="text/css" href="css/vertical.news.slider.css?v=1.0">	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/pace.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script><!-- 模态弹窗 -->
  <script type="text/javascript" src="js/mymouse.js" id="mymouse"></script>
  <script type="text/javascript" src="js/vertical.news.slider.min.js" id="mymouse"></script>
  </head>
  
  <body class="news-demo">

  <h1>新手导航</h1>

  <div class="news-holder cf">

    <ul class="news-headlines">
      <li class="selected">FAQ疑难问题</li>
      <li>登录系统</li>
      <li>进入到主页面</li>
      <li>客人入住？</li>
      <li>查询在住客人？</li>
      <li>续房缴费？</li>
      <li>更换房间？</li>
      <li>修改房态？</li>
      <li>结账退房？</li>
      <li>查询退房记录？</li>
      <li>客人消费？</li>
      <li>客人消费查询？</li>
      <li>客人损坏？</li>
      <li>房间设置？</li>
      <li>损坏设置？</li>
      <li>损坏记录查询？</li>
      <li>营业管理？</li>
      <li>会员管理？</li>
      <li>商品销售趋向？</li>
      
      <li>商品采购？</li>
      <li>商品付款？</li>
      <li>商品信息？</li>
      <li>仓库商品信息和退货？</li>
      <!-- li.highlight gets inserted here -->
    </ul>

    <div class="news-preview">

      <div class="news-content top-content">
      <p><a href="javascript:kk()">FAQ疑难问题</a></p>
        <p>同福酒店管理系统FAQ疑难问题</p>
      </div><!-- .news-content -->

      <div class="news-content top-content">
      <p><a href="javascript:kk()">登录系统</a></p>
        <img src="images/01.png">
        <p>A hundred red bicycles were stolen from under our noses yesterday, and nobody knows what went wrong.</p>
      </div><!-- .news-content -->

      <div class="news-content">
      <p><a href="javascript:kk()">进入到主页面</a></p>
        <img src="images/02.PNG">
        <p>Ears on dogs can be a tricky thing. Find out more about this amazing story and why these dogs are a nuisance.</p>
      </div><!-- .news-content -->


      <div class="news-content">
      <p><a href="javascript:kk()">客人入住</a></p>
        <img src="images/03.PNG">
        <p>客户入住需要填写入住单：客户姓名、联系电话、证件号都是必填项</p>
       <p>如果客人是会员要选择会员是谁</p>
       <p>不同客户有不同折扣</p>
       <p>其总额是包括房价，押金，以及折扣和天数所得</p>
      </div><!-- .news-content -->
      
      <div class="news-content">
       <p><a href="javascript:kk()">查询在住客人</a></p>
        <img src="images/20.PNG">
        <p>如果酒店需要查找某位客人在住房间，可进行模糊查询得到其住房信息</p>
       
      </div><!-- .news-content -->
      
      <div class="news-content">
      <p><a href="javascript:kk()">续房缴费</a></p>
        <img src="images/16.PNG">
        <p>即客人需要继续入住房间，</p>
       <p>填写续房天数获得需要交的房费</p>
      </div><!-- .news-content -->
      
       <div class="news-content">
      <p><a href="javascript:kk()">更换房间</a></p>
        <img src="images/17.PNG">
        <p>如果客人需要更换房间，根据房间类型选择房间，</p>
       <p>会有新房价和需要交纳的新房费。</p>
      </div><!-- .news-content -->
      
      <div class="news-content">
      <p><a href="javascript:kk()">修改房态</a></p>
        <img src="images/19.PNG">
        <p>客人入住过后需要打扫房间然后将脏房修改为净房，</p>
       <p>如果房间有损坏需要修改房间状态为维修房，房间修好后再改为净房。</p>
      </div><!-- .news-content -->
      
         <div class="news-content">
      <p><a href="javascript:kk()">退房</a></p>
        <img src="images/18.PNG">
        <p>根据入住日期和离店日期算出实际天数，</p>
        <p>如果客人在住天数大于入住天数会有应补缴费用，</p>
       <p>如果在住天数小于入住天数应有退换费用，</p>
       <p>还有退换客人押金。</p>
      </div><!-- .news-content -->
      
         <div class="news-content">
      <p><a href="javascript:kk()">查询退房记录</a></p>
        <img src="images/21.PNG">
        <p>如果经理需要查询历史记录可在退房记录中查询，也可进行统计月收入。</p>
      </div><!-- .news-content -->


      <div class="news-content">
      <p><a href="javascript:kk()">客人消费</a></p>
        <img src="images/04.PNG">
        <p>1：点击下拉框会显示所有的商品信息。</p>
        <p>2：在下拉框的里面输入商品的名字，会系统会进行模糊查询。</p>
        <p>3：当然当商品过多的时候，下面的分页就起到了作用，分页可以选择每页要显示的数据，显示商品的总数量，这些功能都是让用户更为快捷的找到商品。</p>
        <p>5：
        		①消费单号后台根据时间拼接自动生成。
				②：客户名字，就是入住人的姓名。
				③：操作人为当前系统的登录人。
				④：点击商品信息的下拉框，里面有商品信息（图二），点击其中的一条，修改数量，点击添加到下面的表格里。当然商品还是可以继续添加的，之执行同样的操作（里面加的判断：商品的数量不能小于1、商品卖出的数量不能大于库存的数量、点击添加消费的时候，表格里至少会有一条数据的存在。）
				⑤：商品添加完成后，点击添加消费
        </p>
        <p><a href="javascript:kk()">点击查看历史消费</a></p>
        <img src="images/06.PNG">
        <p>1：这是一个记录查询的页面。</p>
        <p>2：页面里面放置了一个tab切换窗口（当前入住单号的历史消费、历史全部的消费查询）。</p>
        <p>3：点击不同的tab可以进行切换查看。</p>
      </div><!-- .news-content -->
      
      
		 <div class="news-content">
      <p><a href="javascript:kk()">客人消费查询</a></p>
        <img src="images/07.PNG">
        <p>1：显示的是查看全部的入住查询</p>
        <p>2：里面的所有的查询条件都是方便用户对数据进行检索。</p>
        <p>3：点击小图标（+）号，可以查看消费单号里面的细节。</p>
      </div><!-- .news-content -->
      
      
      <div class="news-content">
      <p><a href="javascript:kk()">客人损坏</a></p>
        <img src="images/05.PNG">
        <p>1：损坏单号后台根据时间拼接自动生成。</p>
        <p>2：客户名字，就是入住人的姓名。</p>
        <p>3：操作人为当前系统的登录人。</p>
        <p>4：点击损坏物品的下拉框，里面有损坏物品的信息（图二），点击其中的一条，点击添加到下面的表格里。当然损坏物品还是可以继续添加的，之执行同样的操作（里面加的判断： 点击添加消费的时候，表格里至少会有一条数据的存在。）</p>
        <p>5：损坏物品添加完成后，点击添加记录</p>
      </div><!-- .news-content -->
      
      <div class="news-content">
      <p><a href="javascript:kk()">房间设置</a></p>
      <img src="images/14.PNG"/>
      <p>1：图片显示所有的房间信息，也可以选择房间类型查询</p>
      <p>2：点击查看房类可查询房类点击，添加房间可添加房间</p>
      <p>3：点击修改按钮可以修改房间信息</p>
      <p>4：点击删除按钮给出提示是否确定删除</p>
      </div><!-- .news-content -->
      
      <div class="news-content">
      <p><a href="javascript:kk()">损坏设置</a></p>
        <img src="images/08.PNG">
        <p>1：表格里面会事先显示所有的可能会损坏的物品</p>
		<p>2：进行设置的时候必须先点击你想进行的操作（添加，修改，删除）</p>	
        <p>3：添加：点击添加后，会清空下面文本框的值，然后在里面输入要添加的损坏物品，索赔金额，最后点击进行操作按钮。</p>
        <p>4：修改：点击修改的时候必须先有选中行，然后点击修改，下面的文本框会显示原来的数据，然后在源数据的基础之上进行修改，最后点击进行修改按钮</p>
        <p>5：删除：点击删除的时候必须先有选中行，然后点击删除，会弹出一个对话框，点击确定为删除，点击取消为取消</p>
      </div><!-- .news-content -->
      
      
      <div class="news-content">
      <p><a href="javascript:kk()">损坏记录查询</a></p>
        <img src="images/09.PNG">
        <p>1：里面的所有的查询条件都是方便用户对数据进行检索</p>
		<p>2：点击小图标（+）号，可以查看损坏单号里面的细节（可查看图四）。</p>	
      </div><!-- .news-content -->
      
      
      <div class="news-content">
      <p><a href="javascript:kk()">营业管理</a></p>
        <img src="images/10.PNG">
        <p>1：这是一个折线图，反应了酒店盈利的图示，更好的反映酒店的运营状况。</p>
		<p>2：日期都不填写，默认查看当前月的盈利额。</p>	
		<p>3：如果只填写开始日期，结束日期默认为月底。</p>
		<p>4: 如果只填写结束日期，开始日期默认为上月月底。</p>	
		<p>	5: 当然结束日期不能小于开始日期。</p>
 		<p><a href="javascript:kk()">点击盈利表格细化</a></p>
		<img src="images/11.PNG">
		<p><a href="javascript:kk()">双击任意一条数据</a></p>
		<img src="images/12.PNG">
		<p>1：显示当天的财务细节</p>	
		<p>2：盈利=（（商品的售价*数量）-（商品的进价*数量
））+住房-退货损耗
		</p>
      </div><!-- .news-content -->
      
      <div class="news-content">
      <p><a href="javascript:kk()">会员管理</a></p>
       <img src="images/15.PNG">
       <p>1：上面可以根据会员号模糊查询会员信息</p>
       <p>2：点击添加会员就可以添加一个新的会员</p>
       <p>3：点击充值按钮就可以给会员进行充值</p>
       <p>4：点击修改按钮就可以修改会员的基本资料</p>
       <p>5：点击删除按钮提示是否确定删除会员</p>
      </div><!-- .news-content -->
      
      <div class="news-content">
      <p><a href="javascript:kk()">商品销售趋向</a></p>
        <img src="images/13.PNG">
        <p>1：这是一个折线图，反应了酒店商品的卖出图示，使人一目了然，快速掌握商品的消费趋向。</p>
		<p>2：日期都不填写，默认查看全部。</p>	
		<p>3: 如果只填写开始日期，结束日期默认为当天时间。</p>	
		<p>4: 如果只填写结束日期，开始日期默认为2016-01-01。</p>	
		<p>5: 当然结束日期不能小于开始日期。</p>	
      </div><!-- .news-content -->
      
      
      
      <div class="news-content">
      <p><a href="javascript:kk()">商品采购</a></p>
        <img src="images/25.PNG">
        <p>1：首先进行添加采购计划单</p>
       <p>2：查看采购计划单，双击进去进行采购</p>
       <p>3：采购提交完成后查看采购单，单击+号可查看采购的商品及数量</p>
       <p>4：双击进去可以进行修改与付款</p>
      </div><!-- .news-content -->
      
      
      <div class="news-content">
      <p><a href="javascript:kk()">商品付款</a></p>
        <img src="images/24.PNG">
        <p>1：首先点击付款单查询，查询出待付款的单号</p>
       <p>2：点击+号可查看相关的采购单号</p>
       <p>3：双击进去进行付款，可选择付款类型与收货地址</p>
      </div><!-- .news-content -->
      
      
      
      
      <div class="news-content">
      <p><a href="javascript:kk()">商品信息</a></p>
        <img src="images/22.PNG">
        <p>1：显示已上架的商品，可以根据商品关键字进行搜索</p>
       <p>2：如果发现商品信息有误，或者商品有问题，可以进行修改或下架</p>
       <p>3：可以查询已下架的商品，进行修改，确认无误后可以重新上架</p>
      </div><!-- .news-content -->
      
      <div class="news-content">
       <p><a href="javascript:kk()">仓库商品信息和退货</a></p>
        <img src="images/23.PNG">
        <p>1：显示仓库已存在的商品信息，可以根据商品关键字进行搜索</p>
       <p>2：如果发现商品有问题，或者长期销售不出去，可以申请退货</p>
       <p>3：点击添加退货订单，可以申请退货，进去退货页面，选择退货商品信息进行退货</p>
      </div><!-- .news-content -->
      
      
      
    </div><!-- .news-preview -->
  </div><!-- .news-holder -->
  
  
  <script>
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-1965499-1']);
    _gaq.push(['_trackPageview']);

    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
    
  </script>
</body>
</html>
