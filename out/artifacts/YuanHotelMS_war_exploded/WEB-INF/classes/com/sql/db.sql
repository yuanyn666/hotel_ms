---酒店管理系统
--13角色(管理员。。。)
create table MyRole
(
roleId  number primary key,--角色编号主键
roleName	Varchar2(25) not null,--员工职称
roleDesc	Varchar2(30),--降续
roleFlag	Varchar2(50)--角色标志
);
create sequence seq_a
start with 1
increment by 1;
--创建序列
--15用户[Users]
create table Users
(
userId number primary key,--用户编号
userPwd	Varchar2(16) not null,--密码
names	Varchar2(25),--用户真实名字
userFla	Varchar2(25),--用户标志
phone varchar(25),--联系电话
address varchar2(50),--
userSex	varchar2(2) constraint check1	Check(userSex in ('男','女')),
state number,
usersRoleId	number references MyRole(roleId)--外键（角色主键)
);
create sequence seq_bb
start with 1
increment by 1;
--16权限表[Right]
create table RightCode
(
rightCodeId number primary key,--权限编号
rightUrl	Varchar2(50),--权限网址
rightTip	Varchar2(50),--权限标题
ringhtText	Varchar2(50)--权限文本
);

--14角色权限的连接表
create table MyRoleRightCode
(
roleId	number references MyRole(roleId),--外键（角色主键）
rightCodeId number references RightCode(rightCodeId)--外键（权限编号
);
--1房间类型表
create table RoomType
(
roomTypeId	number primary key,--主键
roomType varchar(50)	Not null,--（套房，普通客房）	类型名
roomPrice	number(8,2)	Not null,--	房价
money	number(8,2),--根据房间类型收押金	押金
bookMoney	number(8,2),--根据房间类型收预定金	预定金额
roomMark	Varchar2(100)--房间说明
);
create sequence seq_c
start with 1
increment by 1;
--2房间状态表[RoomState]
create table RoomState
(
roomStateId number primary key,--主键
roomState	Varchar2(25) not null-- 空房，空脏房，维修房，预定房）	房间状态
);
--3房间信息表  [RoomInfo]
create table RoomInfo
(
roomId number primary key,--房间号
roomTypeId	number references RoomType(roomTypeId),--房间类型编号（外键）
floor	number,--所在楼层
roomStateId	Number references RoomState(roomStateId),--外键(房间状态表)
roomPhone	Varchar2(15),--房间电话
roomBuild number,--楼栋
stateTime number--状态计时
);
--25商品基本信息表（ProductInfo）
create table ProductInfo
(
productId	varchar2(25) primary key,--商品编码
productName varchar2(25) not null,--商品名称
productAddress varchar2(50) not null,--商品产地------------------删除保质期--列
buyPrice number(8,2) not null,--进货价格
retailoPrice number(8,2) not null,--销售价格
productSort varchar2(25) not null,--商品类别
state number,--删除状态
ProductUction varchar2(50)--商品说明
);
--4客户类型表  [customerType]
create table CustomerType
(
customerTypeId  number primary key,
cTypeName	Varchar2(15)	Not null,--	?散客，团客，会员	类型名
discount	Number--		折扣
);
--5会员基本资料表[SuperCustomer]

create table SuperCustomer
(
spId  varchar2(25) primary key,--会员号------------------number改为varchar2（25）
spName	Varchar2(25) not null,--姓名
spSex	varchar2(2) constraint check2	Check(spSex in ('男','女')),--(男/女)		性别??
spAddress	Varchar2(50),--地址
spPhone	Varchar2(15),--电话
spCardType	Varchar2(10),--(身份证。。。)	证件类型
spCardId	Varchar2(25),--证件号
balance varchar2(20),--余额------------------新增
integration varchar2(20),--当前积分------------------新增
state number,--删除状态-------------新增
mark	Varchar2(100)--		备注
);

--6预订信息表[ReserveInfo]?        ???????

create table ReserveInfo
(
reserveId varchar2(25) primary key,--主键,字符串
customerName	Varchar2(25) not null,--客户名称
customerPhone	Varchar2(15),--客户电话
roomTypeId	number references RoomType(roomTypeId),--房间类型编号
roomId	number references RoomInfo(roomId),--房间号
endTime	Varchar2(30),--预抵时间
keepTime	number,--保留时间
reserveTime	Varchar2(25),--预定时间
remark	Varchar2(100),--	?	备注
bookMoney	number,--房间类型表	预定已交金额（外键）直接获取到的值
customerTypeId number references CustomerType(customerTypeId),---新增
state number,--删除标识------------------新增
totalMoney number--总金额------------------新增
);

--7入住信息表[LiveInfo]
create table LiveInfo
(
liveId varchar2(25) primary key,--
roomId	number references RoomInfo(roomId),--房间号
liveMoney	number(8,2),--入住金额
customerTypeId  number references CustomerType(customerTypeId),--	客户类型（外键）
customerName	Varchar2(25),--客户名称(/获取得到)
customerSex	varchar2(2) constraint check3	Check(customerSex in ('男','女')),	--	?	客户性别
cardType	Varchar2(25),--	证件类型
cardId	Varchar2(25),--证件号码
phone	Varchar2(15),--联系电话
address	Varchar2(50),--地址
liveNum	number,--入住人数
liveTime	Varchar2(25),--入住日期
liveDays	number,--入住天数
payType	Varchar2(25),--付款方式
userIdnumber references Users(userId),--操作人（外键）
state number,--删除标识------------------新增
mark	Varchar2(25)--备注
);
--8客人消费主表[Spend]
create table Spend
(
spendId varchar2(25) primary key,
liveId varchar2(25) references LiveInfo(liveId),--
userId	number references Users(userId),--操作人（外键）
mark	Varchar2(50),--备注
spendTime	Varchar2(25)--消费时间
);

--9客人消费明细表[SpendInfo]
create table SpendInfo
(
spendInfoId varchar2(25) primary key,
spendId varchar2(25) references Spend(spendId),--外键（客人消费主表）
GcodeId varchar2(25),--外键（仓库信息一览表）商品id
Gcodnum	number,--商品数量
spendMoney	number(8,2),--金额
spendTime	Varchar2(25)--时间
);
--10客人损坏主表[CustomerBreak]
create table CustomerBreak
(
breakId varchar2(25) primary key,
roomId	varchar2(25) references LiveInfo(liveId),--房间号
userId	number references Users(userId),--操作人（外键）
remark	Varchar2(50),--备注
breakTime	Varchar2(25)--消费时间
);

--11客人损坏明细表[BreakDetai]
create table BreakDetai
(
detaId varchar2(25) primary key,
breakId varchar2(25) references CustomerBreak(breakId),--外键（客人损坏主表[）
breakName	Varchar2(50),--			损坏物品名称
fineMoney	number(8,2)--			罚款
);
--12结算表[checkout]
create table Checkout
(
checkId varchar2(25) primary key,
liveId varchar2(25) references LiveInfo(liveId),--外键	入住单号（入住表）
realDays	number(3),--实住天数
userId	number references Users(userId),--操作人（外键）
money	number(9,2),--（计算获得）?	金额
remark	Varchar2(50),--备注
checkTime	Varchar2(25)--消费时间
);
--17报表[CardTable]
create table CardTable 
(
cardId varchar2(25) primary key,
cardName	Varchar2(25)	Not null,--	报表名称
userId	number references Users(userId),--操作人（外键）
spid	varchar2(25) references SuperCustomer(spId),--报表编号(外键于会员信息表)
mark	Varchar2(50)--			报表说明
);
--18消费商品总结[SpendProdut]
create table SpendProdut
(
spendId  varchar2(25) primary key,
userId	number references Users(userId),--操作人（外键）
productId	varchar2(25) references ProductInfo(productId),--商品id(外键)
productNum	number,--				消费的数量
productMoney number(8,2),--消费金额
spendDate	Varchar2(25)--				时间
);
--表27仓库(各大仓库)信息表(DepotInfo)	
create table DepotInfo
(
depotId varchar2(25) primary key,
depotName varchar2(25) not null,--仓库名称
depotNum	Number(6)--库存数量
);
--表28库存商品信息一览表（DepotProduct）
create table DepotProduct
(
depotPId varchar2(25) primary key,
productId	varchar2(25) references ProductInfo(productId),--商品id(外键)商品名称
productType	Varchar2(25),--类别
depotNum	number,--库存数量
totalMoney	Varchar2(25),--总金额
depotId varchar2(25) references DepotInfo(depotId),--存放仓库
depotPrice	number(8,2),--入库计划单价
outDepotPrice	number(8,2),--出库计划单价
jainMoney	number(8,2),--计划盈利金额
minDepotNum	number,--警戒最小库存
maxDepotNum	number--	警戒最大库存
);

--表21采购计划单（PurchasePlan）	
create table PurchasePlan
(
  planId varchar2(20) primary key,--采购计划单号
  planDate varchar2(50),--计划单生成日期
  userId number references Users(userId),--操作人
  state varchar(10) not null,--订单状态
  mark varchar2(50)--说明
);
--采购计划明细
create table PurchasePlanDetail
(
planId varchar2(20)references PurchasePlan(planId),
productId varchar2(20) references productInfo(productId),--商品
productName varchar2(20) not null,
productSum number not null,--商品需求数量
buyPrice number not null
);
--表22采购订单表(PurchaseOrder)
create table PurchaseOrder
(
  orderId varchar2(20) primary key,--采购订单编号
  planId varchar2(20) references PurchasePlan(planId),--计划采购订单单号
  userIdC number references Users(userId),--采购人
  orderDate varchar2(50),--订单生成日期
  MoneyType varchar2(20),--支付类型
  address varchar2(60),--交货地点
  totalMoney number(8,2) not null,--订单总金额
  mark varchar2(50),--说明
  state varchar2(10),--订单状态
  userIdS number references Users(userId)--操作人-审核人
);
--采购订单明细
create table PurchaseOrderDetail
(
orderId varchar2(20)references PurchaseOrder(orderId),
productId varchar2(20) references productInfo(productId),--商品
productName varchar2(20) not null,
productSum number not null,--商品需求数量
buyPrice number not null
);
--24采购付款主文件（PurchasePay）	
--采购付款主表
create table PurchasePay
(
payId varchar2(25) primary key,--付款编号
payTime varchar(50) not null,--付款时间
payMoney number(8,2) not null,--付款金额
payStyle varchar(25) not null,--付款类型
userId number references Users(userId),--操作人(主负责人)
userIdS number references Users(userId),--操作人-审核人
checkState	Varchar2(25),--审核状态
purchasPayOthers varchar(50)--付款说明
);
--25采购付款明细文件（PurchasePayDetail）
create table PurchasePayDetail
(
payDetaId varchar2(25) primary key,--单号
payId varchar2(25) references PurchasePay(payId),--外码(采购付款主文件)
orderId varchar2(25) references PurchaseOrder(orderId)--原始订单号
);
--入库
create table stiorage
(
stiorageId varchar2(20) primary key,--入库单号
userId number references Users(userId),--操作人(主负责人)
tioragerTime varchar(50) not null,--时间
depotId varchar2(10) references DepotInfo(depotId),--所在库存
userIds number references Users(userId),--操作人(主负责人)
orderId varchar2(20) references PurchaseOrder(orderId),--原始订单号
remarks varchar2(50)
);
--入库明细
create table StiorageDetail
(
StiorageId varchar2(20)references stiorage(stiorageId),--明细单号
StiorageSum number not null,--数量
productId varchar2(20) references ProductInfo(productId)--商品id(外键)商品名称
);

--26退货单(Return)
create table ReturnProduct
(
returnId Varchar2(20) primary key,--号
returnDate Varchar2(20),--退货日期
returnStyle varchar(20) not null,--付款类型
userId number references Users(userId),--退货人
userIdS number references Users(userId),--操作人-审核人
mark varchar2(50)--备注
);
create table ReturnProductDetail
(
returnId Varchar2(20) references ReturnProduct(returnId),
productId varchar2(20) references ProductInfo(productId),--供应商名称
returnNum number not null,--商品数量
price number(8,2) not null,--进货价格
totalMoney number(8,2),--金额（商品数量*商品进价)
returnMoney number(8,2)--退货金额
);

--29商品盘点[CheckProduct]
create table CheckProduct
(
checkProId	varchar2(25) primary key,
userId number references Users(userId),--操作人
userIdS number references Users(userId),--操作人-审核人
depotPId varchar2(25) references DepotProduct(depotPId),--外键	库存商品信息一览表
payId varchar2(25) references PurchasePay(payId),--采购付款主文件	外键
returnId	Varchar2(25) references ReturnProduct(returnId),--外键 	退货单
totalMoney number(8,2)--总金额	采购成本价-（商品数量*商品仓库剩余数量*进价）
);
--19盘点[ProductBill]
create table ProductBill
(
billId	varchar2(25) primary key,
userId number references Users(userId),--操作人
jainMoney number,--前台的盈利减去根据商品id求出求出消费的数量再求出进价相乘	
datatime varchar2(100)
);

--损坏
create table Bad(
badId number primary key,
badName varchar2(25),
money number
);
create sequence Bad_id
start with 1
increment by 1;


--交接班管理
create table jaojie(
jiaoid varchar2(25),--交接班id,
userId number references Users(userId),--操作人
beizhu varchar2(200),
jtime varchar2(25),
biaoshi varchar2(10),
xiuname varchar2(25),
xiutime varchar(25)
);






--权限录入

insert into rightcode values(1,'showRoomIST','系统','主页面');
insert into rightcode values(2,'UsersAll','系统','员工管理');
insert into rightcode values(3,'showRoomInfo','系统','房间设置');
insert into rightcode values(21,'showSuper','系统','会员管理');

insert into rightcode values(25,'','系统','交接班');
insert into rightcode values(26,'view/selectJiaojie.jsp','系统','交接班查询 ');
--损坏设置
insert into rightcode values(9,'view/Bad.jsp','系统','损坏设置');
insert into rightcode values(4,'view/SerchProductSal.jsp','财务管理','客人消费');
insert into rightcode values(5,'view/SerchBreak.jsp','财务管理','损坏管理');


insert into rightcode values(6,'view/Profit.jsp','财务管理','营业管理');

insert into rightcode values(7,'findAllReserve','客房中心','客人预订');
insert into rightcode values(8,'view/LiveinfoZhu.jsp','客房中心','在住客人');
insert into rightcode values(24,'view/CheckoutCha.jsp','客房中心','退房查询');

insert into rightcode values(10,'findAllP','商品管理','商品查询');
insert into rightcode values(11,'','商品管理','采购计划单');
insert into rightcode values(12,'view/FindPurchasePlan.jsp','商品管理','采购计划查询');
insert into rightcode values(13,'view/FindPurchaseOrder.jsp','商品管理','采购单查询');
insert into rightcode values(23,'view/FindPurchasePay.jsp','商品管理','付款单查询');
insert into rightcode values(14,'view/FindStiorages.jsp','商品管理','商品入库');

insert into rightcode values(22,'findAllD','库存管理','仓库查询');
insert into rightcode values(15,'findAllDepotProduct','库存管理','商品库存一览');
insert into rightcode values(16,'view/Count.jsp','库存管理','商品销售趋向');
insert into rightcode values(17,'view/FindsReturnProduct.jsp','库存管理','库存退货查询');

insert into rightcode values(18,'','帮助中心','版本信息');
insert into rightcode values(19,'view/daohang.jsp','帮助中心','新手导航');
insert into rightcode values(20,'','帮助中心','软件升级');

--职务
insert into myrole values(seq_a.nextval,'经理','降续','经理');
insert into myrole values(seq_a.nextval,'前台','降续','前台');
insert into myrole values(seq_a.nextval,'库存管理','降续','库存管理');
--用户
insert into users values(seq_bb.nextval,'123456','朕','Boss','15993277573','河南','男',1,2);
insert into users values(seq_bb.nextval,'123456','娃子','了','15805056060','河南','女',1,3);
insert into users values(seq_bb.nextval,'123456','贱','了','15805056063','河南','女',1,2);
insert into users values(seq_bb.nextval,'123456','胖子','的','15805056062','河南','男',1,2);
insert into users values(seq_bb.nextval,'123456','师姐','的','15805056061','河南','男',1,3);


--经理权限
insert into myrolerightcode values(1,1);
insert into myrolerightcode values(1,2);
insert into myrolerightcode values(1,3);
insert into myrolerightcode values(1,4);
insert into myrolerightcode values(1,5);
insert into myrolerightcode values(1,6);
insert into myrolerightcode values(1,7);
insert into myrolerightcode values(1,8);
insert into myrolerightcode values(1,9);
insert into myrolerightcode values(1,10);
insert into myrolerightcode values(1,11);
insert into myrolerightcode values(1,12);
insert into myrolerightcode values(1,13);
insert into myrolerightcode values(1,14);
insert into myrolerightcode values(1,15);
insert into myrolerightcode values(1,16);
insert into myrolerightcode values(1,17);
insert into myrolerightcode values(1,18);
insert into myrolerightcode values(1,19);
insert into myrolerightcode values(1,20);
insert into myrolerightcode values(1,21);
insert into myrolerightcode values(1,22);
insert into myrolerightcode values(1,23);
insert into myrolerightcode values(1,24);
insert into myrolerightcode values(1,25);
insert into myrolerightcode values(1,26);
--前台
insert into myrolerightcode values(2,1);
insert into myrolerightcode values(2,21);
insert into myrolerightcode values(2,7);
insert into myrolerightcode values(2,8);
insert into myrolerightcode values(2,18);
insert into myrolerightcode values(2,19);
insert into myrolerightcode values(2,20);
insert into myrolerightcode values(2,24);
--仓库管理
insert into myrolerightcode values(3,10);
insert into myrolerightcode values(3,11);
insert into myrolerightcode values(3,12);
insert into myrolerightcode values(3,13);
insert into myrolerightcode values(3,14);
insert into myrolerightcode values(3,15);
insert into myrolerightcode values(3,16);
insert into myrolerightcode values(3,17);
insert into myrolerightcode values(3,18);
insert into myrolerightcode values(3,19);
insert into myrolerightcode values(3,20);
insert into myrolerightcode values(3,23);






insert into RoomType values(seq_c.nextval,'标准单人间',120,20,60,'整洁舒适');
insert into RoomType values(seq_c.nextval,'标准双人间',150,30,70,'整洁舒适');
insert into RoomType values(seq_c.nextval,'标准套房',160,50,80,'整洁舒适');
insert into RoomType values(seq_c.nextval,'商务套房',280,80,180,'品味高端');
insert into RoomType values(seq_c.nextval,'豪华套房',420,120,200,'豪华大气');
insert into RoomType values(seq_c.nextval,'总统套房',580,180,300,'奢华尊贵');
insert into RoomType values(seq_c.nextval,'经济套房',380,150,300,'经济实惠');

insert into RoomState
select 1,'空净房' from dual union
select 2,'预定房' from dual union
select 3,'已住房' from dual union
select 4,'维修房' from dual union
select 5,'空脏房' from dual ;


insert into RoomInfo
select 1101,2,1,1,'1101',1,1 from dual union
select 1102,2,1,1,'1102',1,1 from dual union
select 1103,3,1,1,'1103',1,1 from dual union
select 1104,4,1,1,'1104',1,1 from dual union
select 1105,5,1,1,'1105',1,1 from dual union
select 1106,6,1,1,'1106',1,1 from dual union
select 1107,2,1,1,'1107',1,1 from dual union
select 1108,2,1,1,'1108',1,1 from dual;
insert into RoomInfo
select 2101,2,1,1,'1101',2,1 from dual union
select 2102,2,1,1,'1102',2,1 from dual union
select 2103,3,1,1,'1103',2,1 from dual union
select 2104,4,1,1,'1104',2,1 from dual union
select 2105,5,1,1,'1105',2,1 from dual union
select 2106,6,1,1,'1106',2,1 from dual union
select 2107,2,1,1,'1107',2,1 from dual union
select 2108,2,1,1,'1108',2,1 from dual;
insert into RoomInfo
select 1201,5,2,1,'1201',1,1 from dual union
select 1202,5,2,1,'1202',1,1 from dual union
select 1203,5,2,1,'1203',1,1 from dual union
select 1204,6,2,1,'1204',1,1 from dual union
select 1205,7,2,1,'1205',1,1 from dual union
select 1206,7,2,1,'1206',1,1 from dual union
select 1207,3,2,1,'1207',1,1 from dual union
select 1208,4,2,1,'1208',1,1 from dual;
insert into RoomInfo
select 1301,5,3,1,'1301',1,1 from dual union
select 1302,3,3,1,'1302',1,1 from dual union
select 1303,5,3,1,'1303',1,1 from dual union
select 1304,5,3,1,'1304',1,1 from dual union
select 1305,7,3,1,'1305',1,1 from dual union
select 1306,7,3,1,'1306',1,1 from dual union
select 1307,6,3,1,'1307',1,1 from dual union
select 1308,6,3,1,'1308',1,1 from dual;
insert into RoomInfo
select 1401,5,4,1,'1301',1,1 from dual union
select 1402,3,4,1,'1302',1,1 from dual union
select 1403,5,4,1,'1303',1,1 from dual union
select 1404,5,4,1,'1304',1,1 from dual union
select 1405,7,4,1,'1305',1,1 from dual union
select 1406,7,4,1,'1306',1,1 from dual union
select 1407,6,4,1,'1307',1,1 from dual union
select 1408,6,4,1,'1308',1,1 from dual;
  

--给商品信息表录入数据
--给商品信息表录入数据
insert into ProductInfo values('SP2017-09144538','加多宝','新乡',2,5,'饮品',0,'怕上火就喝加多宝');
insert into ProductInfo values('SP2017-09144539','王老吉','新乡',2,5,'饮品',0,'怕上火就喝王老吉');
insert into ProductInfo values('SP2017-09144540','毛巾','新乡',2,5,'日化用品',0,'哈哈哈哈');
insert into ProductInfo values('SP2017-09144541','软中华','新乡',30,50,'名烟',0,'吸烟有害健康');
insert into ProductInfo values('SP2017-09144542','牙刷','新乡',1,3,'日化用品',0,'一日三次刷牙有益健康');
insert into ProductInfo values('SP2017-09144543','澡巾','新乡',2,5,'日化用品',0,'北方人必备神器');
insert into ProductInfo values('SP2017-09144544','香皂','新乡',5,10,'日化用品',0,'不用说都懂');
insert into ProductInfo values('SP2017-09144545','方便面','新乡',1,2,'零食',0,'无聊看电影必备');
insert into ProductInfo values('SP2017-09144546','火腿','新乡',1,2,'零食',0,'无聊看电影必备');
insert into ProductInfo values('SP2017-09144547','南瓜子','新乡',5,10,'零食',0,'无聊看电影必备');
insert into ProductInfo values('SP2017-09144548','乐事薯片','新乡',5,10,'零食',0,'无聊看电影必备');
insert into ProductInfo values('SP2017-09144549','可口可乐','新乡',2,5,'零食',0,'无聊看电影必备');
insert into ProductInfo values('SP2017-09144550','喜之郎果冻','新乡',5,10,'零食',0,'无聊看电影必备');
insert into ProductInfo values('SP2017-09144551','开心果','新乡',10,20,'零食',0,'无聊看电影必备');
insert into ProductInfo values('SP2017-09144552','鱿鱼丝','新乡',10,20,'零食',0,'无聊看电影必备');
insert into ProductInfo values('SP2017-09144553','金六福老五星','新乡',150,200,'名酒',0,'亲朋好友聚会');
insert into ProductInfo values('SP2017-09144554','水井坊','新乡',300,350,'名酒',0,'亲朋好友聚会');
insert into ProductInfo values('SP2017-09144555','茅台','新乡',300,400,'名酒',0,'亲朋好友聚会');
insert into ProductInfo values('SP2017-09144556','洋河蓝色经典','新乡',100,150,'名酒',0,'亲朋好友聚会');
insert into ProductInfo values('SP2017-09144557','牛栏山百年陈酿','新乡',80,150,'名酒',0,'亲朋好友聚会');
insert into ProductInfo values('SP2017-09144558','GOME酒酿','新乡',800,1200,'名酒',0,'亲朋好友聚会');

insert into customerType
select 1,'散客',1 from dual union
select 2,'团客',0.8 from dual union
select 3,'会员',0.7 from dual ;

insert into supercustomer
select 'S20170521091224','乔峰','男','沈阳','18898786548','身份证','410223198905064522','200','2',1,'常客' from dual union
select 'S20170601091533','林毅','男','郑州','13529659652','身份证','410223199006061432','500','5',1,'常客' from dual union
select 'S20170601092021','何洁','女','上海','13619886816','身份证','410223199211213321','300','3',1,'常客' from dual union
select 'S20170601094035','孙怡','女','重庆','13629586855','身份证','410223199005091143','600','6',1,'常客' from dual union
select 'S20170602082054','郑涛','男','深圳','13619326456','身份证','410223198707080977','800','8',1,'常客' from dual union
select 'S20170602092532','秦雨','女','台北','13626481716','身份证','410223198909120086','200','2',1,'常客' from dual union
select 'S20170602104037','宁远','男','北京','13646785839','身份证','410223199402153260','900','9',1,'常客' from dual union
select 'S20170603113045','舒畅','女','济南','13634786481','身份证','410223199008041430','400','4',1,'常客' from dual union
select 'S20170604083531','刘丹','女','广州','18639866609','身份证','410223199208121852','800','8',1,'常客' from dual union
select 'S20170604100437','宋杨','女','杭州','18735766671','身份证','410223198808049906','700','7',1,'常客' from dual union
select 'S20170604113252','许哲','男','成都','13567857709','身份证','410223198909057690','900','9',1,'常客' from dual;


insert into DepotInfo values(1,'东',0);
insert into DepotInfo values(2,'南',0);

insert into DepotProduct values('kc201711111111','SP2017-09144538','饮品',1000,2000,1,2,5,3,5,50000);
insert into DepotProduct values('kc201711111112','SP2017-09144539','饮品',1000,2000,1,2,5,3,5,50000);
insert into DepotProduct values('kc201711111113','SP2017-09144540','日化用品',1000,2000,2,2,5,3,5,50000);
insert into DepotProduct values('kc201711111114','SP2017-09144541','名烟',1000,30000,2,30,50,20,5,50000);
insert into DepotProduct values('kc201711111115','SP2017-09144542','日化用品',1000,1000,2,1,3,2,5,50000);
insert into DepotProduct values('kc201711111116','SP2017-09144543','日化用品',1000,2000,2,2,5,3,5,50000);
insert into DepotProduct values('kc201711111117','SP2017-09144544','日化用品',1000,5000,2,5,10,5,5,50000);
insert into DepotProduct values('kc201711111118','SP2017-09144545','零食',1000,1000,2,1,2,1,5,50000);
insert into DepotProduct values('kc201711111119','SP2017-09144546','零食',1000,1000,2,1,2,1,5,50000);
insert into DepotProduct values('kc201711111120','SP2017-09144547','零食',1000,5000,2,5,10,5,5,50000);
insert into DepotProduct values('kc201711111121','SP2017-09144548','零食',1000,5000,2,5,10,5,5,50000);
insert into DepotProduct values('kc201711111122','SP2017-09144549','零食',1000,2000,2,2,5,3,5,50000);
insert into DepotProduct values('kc201711111123','SP2017-09144550','零食',1000,5000,2,5,10,5,5,50000);
insert into DepotProduct values('kc201711111124','SP2017-09144551','零食',1000,10000,2,10,20,10,5,50000);
insert into DepotProduct values('kc201711111125','SP2017-09144552','零食',1000,10000,2,10,20,10,5,50000);
insert into DepotProduct values('kc201711111126','SP2017-09144553','名酒',1000,150000,2,150,200,50,5,50000);
insert into DepotProduct values('kc201711111127','SP2017-09144554','名酒',1000,300000,2,300,350,50,5,50000);
insert into DepotProduct values('kc201711111128','SP2017-09144555','名酒',1000,300000,2,300,400,100,5,50000);
insert into DepotProduct values('kc201711111129','SP2017-09144556','名酒',1000,100000,2,100,150,50,5,50000);
insert into DepotProduct values('kc201711111130','SP2017-09144557','名酒',1000,80000,2,80,150,70,5,50000);
insert into DepotProduct values('kc201711111131','SP2017-09144558','名酒',1000,800000,2,800,1200,400,5,50000);


insert into bad values(bad_Id.nextval,'毛巾',20);
insert into bad values(bad_Id.nextval,'床单',50);
insert into bad values(bad_Id.nextval,'玻璃',100);









