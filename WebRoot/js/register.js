// JavaScript Document
var isExistUserName = false;
$(function(){
	textBlur('#userName');
	textBlur('#password');
	textBlur('#confirmPassword');
	textFocus('#userName');
	textFocus('#password');
	textFocus('#confirmPassword');
	clickCheckbox('#checkbox');
	AjaxRegister('#userName');
	/*
	*1.输入框值不能为空,单选按钮选中
	*2.用户名唯一
	*3.两次密码输入正确
	*/
	$('#registerForm').submit(function(e) {
		var userName = $('#userName').val();
		var password = $('#password').val();
		var confirmPassword = $('#confirmPassword').val();
		var checkbox = $('#checkbox').attr('checked');
		
		if(userName == '' || password == '' || confirmPassword =='' || checkbox == false){
			if(userName == ''){
				errorTextStyle('#userName');
				errorTip('#userName','请填写值.');
			}
			if(password == ''){
				errorTextStyle('#password');
				errorTip('#password','请填写值.');
			}
			if(confirmPassword == ''){
				errorTextStyle('#confirmPassword');
				errorTip('#confirmPassword','请填写值.');
			}
			if(checkbox == false){
				$('#checkboxTip').css('display','block');
			}
			return false;
		}
		if(userName.length<3){
			errorTextStyle('#userName');
			errorTip('#userName','用户名不能小于3位.');
			return false;
		}
		if(password.length<6){
			errorTextStyle('#password');
			errorTip('#password','密码不能小于6位.');
			return false;
		}
		if(password != confirmPassword){
			return false;
		}
		return isExistUserName;
    });
	//回车提交表单
	document.onkeydown=function(event){
		  e = event ? event :(window.event ? window.event : null);
		  if(e.keyCode==13){
			  $('#registerForm').submit();
		  }
	}
})
//文本框鼠标失去焦点
function textBlur(selector){
	$(selector).blur(function(e) {
		if($(selector).val() == "" || $(selector).val() == null){
			errorTextStyle(selector);
			errorTip(selector,'请填写值.');
			return;
		}
		if(selector == '#userName' && $(selector).val().length<3){
			errorTextStyle(selector);
			errorTip(selector,'用户名不能小于3位.');
			return false;
		}
		if(selector == '#password' && $(selector).val().length<6){
			errorTextStyle(selector);
			errorTip(selector,'密码不能小于6位.');
			return;
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
function errorTip(selector,errorInfo){
	$(selector).qtip({
		content:errorInfo,
		style:{padding:5,background:'#FFB9B9',textAlign: 'center',
				border: {radius: 1,color: '#FF0000'}
		},
		position: {
			 target: 'mouse',
			 adjust: { x: 5, y: 5 }
		 }
	});
}
//点击单选框事件
function clickCheckbox(selector){
	$(selector).click(function(e) {
        if($(selector).attr('checked')){
			$('#checkboxTip').css('display','none');
		}
    });
}
//ajax验证用户名唯一性
function AjaxRegister(textId){
	$(textId).blur(function(){
		var userName = $(textId).val();
		if(userName == "" || userName == null){
			
		}else{
			$.ajax({
				url:'isHaveUser',
				data:{userName:encodeURI(userName)},
				cache : false,
				dataType : 'text',
				success : function(data){
					//若用户名已存在
					if(data == "true"){
						errorTextStyle(textId);
						errorTip(textId,"此用户名已存在！");
						isExistUserName = false;
					}
					//用户名不存在
					if(data == "false"){
						isExistUserName = true;
					}
				}
			});
		}
	});
}