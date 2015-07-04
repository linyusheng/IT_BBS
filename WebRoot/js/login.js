// JavaScript Document
$(function(){
	textBlur('#userName');
	textBlur('#password');
	textFocus('#userName');
	textFocus('#password');
	$('#loginForm').submit(function(e) {
		var isSubmit;//定义全局变量，用于ajax成功后的返回值
		var userName = $('#userName').val();
		var password = $('#password').val();
		if(userName == ''){
			errorTextStyle('#userName');
			errorTip('#userName',"用户名不能为空！");
			return false;
		}
		if(password == ''){
			errorTextStyle('#password');
			errorTip('#password',"密码不能为空！");
			return false;
		}
		$.ajax({
			url:'loginValidate',
			async: false,
			data:{userName:userName,password:password},
			cache : false,
			dataType : "text",
			success : function(data){
				//若用户名和密码正确
				if(data == "true"){
					isSubmit = true;
				}
				//若用户名和密码不正确
				if(data == "false"){
					alert("登录名或密码错误，请重新登录!");
					isSubmit = false;
				}
			}
		});
		return isSubmit;
    });
	//回车提交表单
	document.onkeydown=function(event){
		  e = event ? event :(window.event ? window.event : null);
		  if(e.keyCode==13){
			  $('#loginForm').submit();
		  }
	}
	
})
//文本框鼠标失去焦点
function textBlur(selector){
	$(selector).blur(function(e) {
		if($(selector).val() == ""){
			if(selector == '#userName'){
				errorTextStyle(selector);
				errorTip(selector,"用户名不能为空！");
				return;
			}
			if(selector == '#password'){
				errorTextStyle(selector);
				errorTip(selector,"密码不能为空！");
				return;
			}
		}
    });
}
//文本框鼠标得到焦点
function textFocus(selector){
	$(selector).focus(function(e) {
		normalTextStyle(selector);
		$(selector).qtip('destroy');
    });
}
//错误文本框样式
function errorTextStyle(selector){
	$(selector).css({'border':'1px solid #FF0000','background':'#FFB9B9'});
}
//正常文本框样式
function normalTextStyle(selector){
	$(selector).css({'border':'1px solid #999','background':'none'});
}
//错误提示
function errorTip(selector,str){
	$(selector).qtip({
		content:str,
		style:{padding:5,background:'#FFB9B9',textAlign: 'center',
				border: {radius: 1,color: '#FF0000'}
		},
		position: {
			 target: 'mouse',
			 adjust: { x: 5, y: 5 }
		 }
	});
}