
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
  //密码
  function myCkeckPwd(st){
  var pwd=/^[a-zA-Z]\w{5,17}$/;//以字母开头，长度在6~18之间，只能包含字母、数字和下划线
  var t1=$(st).val();
  if(!pwd.test(t1)){
   str=false;
  alert("密码需字母开头，长度在6~18之间，只能包含字母、数字和下划线");
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
   function check(){
    var name=/^[\u4e00-\u9fa5]{0,}$/; //中文
     var phone=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
     var pwd=/^[a-zA-Z]\w{5,17}$/;//以字母开头，长度在6~18之间，只能包含字母、数字和下划线
   if($("#usersRoleId").val()==0){
   alert("请选择职位");
   str=false;
   }else if($("#t1").val()==""||!name.test($("#t1").val())){
 alert("用户名不为空，切只能为中文");
 str=false;
 }else if($("#t2").val()==""||!pwd.test($("#t2").val())){
   alert("密码需字母开头，长度在6~18之间，只能包含字母、数字和下划线。不为空");
  str=false;
 }else if($("#t3").val()==""||!phone.test($("#t3").val())){
  alert("手机号不为空或格式不正确");
  str=false;
 }
  return str; 
   }
   
 
	
	
