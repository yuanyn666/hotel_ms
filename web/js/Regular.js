
var str=true;
  //ƥ������
  function myCheckName(st){
  var name=/^[\u4e00-\u9fa5]{0,}$/; //����
  var t1=$(st).val();
  if(!name.test(t1)){//test()��ʾ�Ƿ���ڣ�ƥ�䵽����������ʽ�ģ��������ʽ�б�ʾtrue
  str=false;
  alert("�û�����Ϊ�գ���ֻ��Ϊ����");
  }else{
  str=true;
  }
  };
  //����
  function myCkeckPwd(st){
  var pwd=/^[a-zA-Z]\w{5,17}$/;//����ĸ��ͷ��������6~18֮�䣬ֻ�ܰ�����ĸ�����ֺ��»���
  var t1=$(st).val();
  if(!pwd.test(t1)){
   str=false;
  alert("��������ĸ��ͷ��������6~18֮�䣬ֻ�ܰ�����ĸ�����ֺ��»���");
  }else{
  str=true;
  }
  };
   //�绰
   function myCheckPhone(st){
   var phone=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
   var t1=$(st).val();
  if(!phone.test(t1)){
   str=false;
  alert("��������ֻ��Ÿ�ʽ����ȷ");
  }else{
  str=true;
  }
 }
   function check(){
    var name=/^[\u4e00-\u9fa5]{0,}$/; //����
     var phone=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
     var pwd=/^[a-zA-Z]\w{5,17}$/;//����ĸ��ͷ��������6~18֮�䣬ֻ�ܰ�����ĸ�����ֺ��»���
   if($("#usersRoleId").val()==0){
   alert("��ѡ��ְλ");
   str=false;
   }else if($("#t1").val()==""||!name.test($("#t1").val())){
 alert("�û�����Ϊ�գ���ֻ��Ϊ����");
 str=false;
 }else if($("#t2").val()==""||!pwd.test($("#t2").val())){
   alert("��������ĸ��ͷ��������6~18֮�䣬ֻ�ܰ�����ĸ�����ֺ��»��ߡ���Ϊ��");
  str=false;
 }else if($("#t3").val()==""||!phone.test($("#t3").val())){
  alert("�ֻ��Ų�Ϊ�ջ��ʽ����ȷ");
  str=false;
 }
  return str; 
   }
   
 
	
	
