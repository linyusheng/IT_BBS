<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人资料</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include-userCenter.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personalInfo.css"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cityLayout.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.cxcalendar.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/complexify.css"/>
</head>

<body>
<%@ include file="../include/top.jsp"%>
    <%@ include file="header.jsp"%>
    <div class="body">
    	<%@ include file="left.jsp"%>
        <div class="body_right">
            <div class="perInfo_box">
                <ul class="nav">
                    <li class="navs_li on">基本资料</li>
                    <li class="navs_li">关于个人</li>
                    <li class="navs_li">更多资料</li>
                    <li class="navs_li">修改密码</li>
                </ul>
                <div class="line">
                    <span class="s_line">	    		
                        <b></b>
                    </span>
                    <div style="clear: both;">		                
                    </div>
                </div>		
                <div style="clear: both;">
                </div>
        	
	
	<div class="infobox_content">
		<form action="saveInfo" method="post" enctype="multipart/form-data">
		<div class="item_tab" style="display: block;">
        	<s:hidden name="user.userId"/>
        	<s:hidden name="user.userName"/>
        	<s:hidden name="user.password"/>
        	<s:hidden name="user.userType"/>
        	<s:hidden name="user.photo"/>
        	<s:hidden name="user.rank"/>
        	<s:hidden name="user.score"/>
        	<s:hidden name="user.userReadNum"/>
        	<s:hidden name="user.itbeanNum"/>
        	<s:hidden name="user.articleNumber"/>
        	<s:hidden name="user.messageNumber"/>
        	<s:hidden name="user.lastLoginTime"/>
        	<s:hidden name="user.registerTime"/>
        	
       	  	<li>
            	<div class="li_left">
                	<label>账户名：</label>
                </div>
                <div class="li_right">
                	<div class="show_text"><s:property value="user.userName"/></div>
                </div>	
            </li>
          	<li>
            	<div class="li_left">
                	<label>昵称：</label>
                </div>
                <div class="li_right">
                	<input type="text" class="input_text" name="user.nickName" value="<s:property value="user.nickName"/>" maxlength="50" />
                </div>	
            </li>
            <li>
           	  	<div class="li_left">
              		<label>邮箱：</label>
                </div>
                <div class="li_right">
                	<input type="email" class="input_text"  name="user.email" value="<s:property value="user.email"/>" maxlength="20" />
                </div>	
            </li>
            <li>
           	  	<div class="li_left">
              		<label>性别：</label>
                </div>
                <div class="li_right">
                	<s:radio name="user.sex" list="#{'保密':'保密','男':'男','女':'女'}"></s:radio>
                </div>	
            </li>
           
            <li>
            	<div class="li_left">
                	<label>头像：</label>
                </div>
                <div class="li_right">
               	  	<input type="text" class="input_text" id="photoPath" maxlength="255" />
                    <input type="button" onclick="myfile.click();" value="选择" />
                    <input type="file" id="myfile" name="upload"  onchange="photoPath.value=this.value" style="display:none" />
                </div>	
            </li>
          	<div class="div_hr">
            </div>  	
            <li>
           	  	<div class="li_left">
              		<label>来自：</label>
                </div>
                <div class="li_right">
                	<input type="text" class="input_text" name="user.address" value="<s:property value="user.address"/>" id="address" maxlength="20"/>
                	<s:select list="{'北京','上海','广州','深圳','杭州','南京','成都','武汉','西安','大连','青岛','济南','天津','沈阳','苏州','珠海','厦门'}" headerKey="" headerValue="--常用地区--" id="selectAddress"></s:select>
                </div>	
            </li>
            <li>
           	  	<div class="li_left">
              		<label>生日：</label>
                </div>
                <div class="li_right">
                	<input type="text" class="input_text" id="dateSelect" name="user.birthday" value="<s:date name="user.birthday" format="yyyy-MM-dd"/>" data-beginyear="1900" data-endyear="2014"   />
                </div>	
            </li>
            <li>
            	<div class="li_left">
                	<label>QQ：</label>
                </div>
                <div class="li_right">
                	<input type="text" class="input_text" name="user.qq" value="<s:property value="user.qq"/>" maxlength="20" />
                </div>
            </li>
            <div class="black"></div>
            <li>
            	<div class="li_left"></div>
            	<div class="li_right">
                	<input type="submit" id="submit" class="input_button" value="提交修改" />
            	</div>
            </li>
        </div>
        <div class="item_tab" style="display: none;">
        	<li>
            	<div class="li_left">
                	<label>职业：</label>
                </div>
                <div class="li_right">
                	<s:select name="user.position" list="{'CEO/总裁','CTO/CIO/技术总监','部门经理/部门主管','项目经理/项目主管','高级软件架构师','高级软件工程师','需求分析师','咨询师','售前工程师','软件实施顾问','软件工程师','软件测试','技术支持/维护工程师','系统工程师SA','数据库DBA','其他'}" headerKey="" headerValue="--请选择职业--"></s:select>
                </div>
            </li>
            <li>
            	<div class="li_left">
                	<label>行业：</label>
                </div>
                <div class="li_right">
                	<s:select name="user.industry" list="{'金融','电信','互联网','物流','电子政务','旅游','制造','教育','医疗','交通','移动和手机应用','嵌入式','网络游戏','咨询','餐饮零售','欧美外包','日本外包','原厂商','SOHO','其他'}" headerKey="" headerValue="--请选择行业--"></s:select>
                </div>	
            </li>
            <li>
            	<div class="li_left">
                	<label>工作年限：</label>
                </div>
                <div class="li_right">
                	<s:select name="user.workAge" list="{'在读学生','应届毕业生','一年以上','两年以上','三年以上','五年以上','八年以上','十年以上','十五年以上','二十年以上'}" headerKey="" headerValue="--请选择工作年限--"></s:select>
                </div>	
            </li>
            <li>
           	  	<div class="li_left">
              		<label>月收入：</label>
                </div>
                <div class="li_right">
                	<s:select name="user.income" list="{'无收入','2000元以下','2000-3999元','4000-5999元','6000-7999元','8000元以上'}"></s:select>
                </div>
            </li>
            <li>
           	  	<div class="li_left">
              		<label>婚姻状况：</label>
                </div>
                <div class="li_right">
                	<s:radio name="user.maritalStatus" list="#{'保密':'保密','未婚':'未婚','已婚':'已婚'}"></s:radio>
                </div>	
            </li>
            <li>
              <div class="area_div">
                <div class="area_label">
              		<label>个性签名：</label>				
              	</div>
                <div class="area_input">
                	<textarea name="user.signature" class="input_area" id="area_signature" maxlength="255"><s:property value="user.signature"/></textarea>
                	您还可以输入：<span id="signature"></span>&nbsp;字
               </div>	
              </div>
            </li>
            <li>
              <div class="area_div">
                <div class="area_label">
              		<label>自我介绍：</label>				
              	</div>
                <div class="area_input">
                	<textarea name="user.introduction" class="input_area" id="area_introduction" maxlength="255"><s:property value="user.introduction"/></textarea>
               		 您还可以输入：<span id="introduction"></span>&nbsp;字
               </div>	
              </div>
            </li>
            <li>
              <div class="area_div">
                <div class="area_label">
              		<label>爱好：</label>				</div>
                <div class="area_input">
                	<textarea name="user.hobby" class="input_area" id="area_hobby" maxlength="255"><s:property value="user.hobby"/></textarea>
                	您还可以输入：<span id="hobby"></span>&nbsp;字
               </div>	
              </div>
            </li>

            <li>
            	<div class="li_left">
                </div>
            	<div class="li_right">
                	<input type="submit" id="submit" class="input_button" value="提交修改" />
            	</div>
            </li>
        </div>
        </form>
		<div class="item_tab" style="display: none;">
        	<li>
            	<div class="li_left">
                	注册时间：
                </div>
                <div class="li_right">
                	<div class="show_text">
                		<s:date name="user.registerTime" format="yyyy-MM-dd"/>
                    </div>
                </div>	
            </li>
            <li>
            	<div class="li_left">
                	最后登录时间：
                </div>
                <div class="li_right">
                	<div class="show_text">
                		<s:date name="user.lastLoginTime" format="yyyy-MM-dd"/>
                    </div>
                </div>	
            </li>
            <div class="div_hr">
            </div>
            <li>
            	<div class="li_left">
                	等级：
                </div>
                <div class="li_right">
                	<div class="show_text">
                		<s:property value="user.rank"/>
                    </div>
                </div>	
            </li>
            <li>
            	<div class="li_left">
                	积分：
                </div>
                <div class="li_right">
                	<div class="show_text">
                		<s:property value="user.score"/>
                    </div>
                </div>	
            </li>
            <li>
            	<div class="li_left">
                	IT豆：
                </div>
                <div class="li_right">
                	<div class="show_text">
                		<s:property value="user.itbeanNum"/>
                    </div>
                </div>
            </li>
            <div class="div_hr">
            </div>
            <li>
            	<div class="li_left">
                	博文量：
                </div>
                <div class="li_right">
                	<div class="show_text">
                		<s:property value="user.articleNumber"/>
                    </div>
                </div>	
            </li>
            <li>
            	<div class="li_left">
                	帖子量：
                </div>
                <div class="li_right">
                	<div class="show_text">
                		<s:property value="user.messageNumber"/>
                    </div>
                </div>	
            </li>
        </div>
		<div class="item_tab" style="display: none;">
        <form action="savePassword" method="post" id="passwordForm">
        	<li>
            	<div class="li_left">
                	<label>旧密码：</label>
                </div>
                <div class="li_right">
                	<input type="password" class="input_text" name="password" id="password"  maxlength="20" />
                </div>	
            </li>
            <li>
            	<div class="li_left">
                	<label><font color="#FF0000">*</font>新密码：</label>
                </div>
                <div class="li_right">
                	<input type="password"  class="input_text" name="newPassword" id="newPassword"  maxlength="20" placeholder="6-20个字符"/>
                </div>                   
            </li>
            <li id="li_complexity">
            	<div id="li_complexity_left">
                	<label>密码强度：</label>
                </div>
                <div id="li_complexity_right">
                    <div id="complexity">0% </div>  
                </div>	
            </li>
            <li>
            	<div class="li_left">
                	<label><font color="#FF0000">*</font>确认密码：</label>
                </div>
                <div class="li_right">
                	<input type="password" class="input_text" name="confirm_password" id="confirm_password" maxlength="20" />
                    <label id="confirm_password_fail">两次密码不一致，请重新输入
                    </label>
                    <label id="confirm_password_ok">输入密码正确
                    </label>
                </div>
            </li>
			<div class="black"></div>
            <li>
            	<div class="li_left">
                </div>
                <div class="li_right">
                	<input type="submit" id="submit" class="input_button" value="提交修改" />
            	</div>
            </li>
         </form>
        </div>
    </div>
            </div>
    	</div>
    </div>
    
    
    
    
    <!--弹出省省市-->
<div class="provinceCityAll">
  <div class="tabs clearfix">
    <ul class="">
      <li><a href="javascript:" class="current" tb="hotCityAll">热门城市</a></li>
      <li><a href="javascript:" tb="provinceAll">省份</a></li>
      <li><a href="javascript:" tb="cityAll" id="cityAll">城市</a></li>
      <li><a href="javascript:" tb="countyAll" id="countyAll">区县</a></li>
    </ul>
  </div>
  <div class="con">
    <div class="hotCityAll invis">
      <div class="pre"><a></a></div>
      <div class="list">
        <ul>
          <!-- 					<li><a href="javascript:"  class="current">南京</a></li> -->
        </ul>
      </div>
      <div class="next"><a class="can"></a></div>
    </div>
    <div class="provinceAll invis">
      <div class="pre"><a></a></div>
      <div class="list">
        <ul>
          <!-- 					<li><a href="javascript:"  class="current">江西省</a></li> -->
        </ul>
      </div>
      <div class="next"><a class="can"></a></div>
    </div>
    <div class="cityAll invis">
      <div class="pre"><a></a></div>
      <div class="list">
        <ul>
          <!-- 					<li><a href="javascript:"  class="current">南京</a></li> -->
        </ul>
      </div>
      <div class="next"><a class="can"></a></div>
    </div>
    <div class="countyAll invis">
      <div class="pre"><a></a></div>
      <div class="list">
        <ul>
        </ul>
      </div>
      <div class="next"><a class="can"></a></div>
    </div>
  </div>
</div>

<!--加载jquery基本库， 以下各个js插件都需要它的支持，必须把它放在其它js库的前面-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>

<!--加载生日选择器的js-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dateSelect/jquery.cxcalendar.min.js"></script> 

<!--加载提示文本框输入字长的剩余字数的js-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/InputLetter/manhuaInputLetter.1.0.js"></script>

<!--加载密码强度检测的js-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/complexify/jquery.complexify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/complexify/jquery.placeholder.min.js"></script>

<script type="text/javascript">

/*提示文本框输入字长的剩余字数*/
jQuery(function(){
	var l=0;
	jQuery('.navs_li').click(function(){
		jQuery(this).siblings().removeClass('on');
		jQuery(this).addClass('on');
		var i=jQuery(this).index();	
		var a1=160*i;	
		jQuery(".s_line").animate({left:a1},150);
		var index = jQuery(".navs_li").index(jQuery(this));
		jQuery(".item_tab").hide();
		jQuery(".item_tab").eq(index).show();
	});	
});

jQuery(function (){
	jQuery("#area_signature").manhuaInputLetter({		     
		len :255,//限制输入的字符个数				
		showId : "signature"//显示剩余字符文本标签的ID
	});
  	
});
jQuery(function (){
	jQuery("#area_introduction").manhuaInputLetter({		     
		len :255,//限制输入的字符个数				
		showId : "introduction"//显示剩余字符文本标签的ID
	});
});
jQuery(function (){
	jQuery("#area_hobby").manhuaInputLetter({		     
		len :255,//限制输入的字符个数				
		showId : "hobby"//显示剩余字符文本标签的ID
	});
});

/*鼠标点击输入框，边框变色特效*/
jQuery(function(){
	
  jQuery(".input_text").focus(function(){
    jQuery(this).css("background-color","#FFC");
	
  });
  jQuery(".input_text").blur(function(){
    jQuery(this).css("background-color", "#FFF");
	
  });
  
  
  jQuery(".input_area").focus(function(){
    jQuery(this).css("background-color","#FFC");
	
  });
  jQuery(".input_area").blur(function(){
    jQuery(this).css("background-color", "#FFF");
	
  });
  
});

/*生日日期选择器*/
jQuery(function (){
jQuery("#dateSelect").cxCalendar({
	begin_year:1950, 
    end_year:2030,
	date:new Date(), 
    type:"yyyy-mm-dd", 
    hyphen:"-", 
    wday:0
});
});

/*密码强度检测*/
$(function(){
			$('input[placeholder]').placeholder();
			$("#newPassword").complexify({}, function(valid, complexity){
				if (!valid) {
					$('#complexity').animate({'width':complexity + '%'}).removeClass('valid').addClass('invalid');
				} else {
					$('#complexity').animate({'width':complexity + '%'}).removeClass('invalid').addClass('valid');
				}
				$('#complexity').html(Math.round(complexity) + '%');
			});
		});
/*让密码检测层默认为隐藏,获得焦点后显示*/
$(function(){
	$("#li_complexity").hide();
	  $("#newPassword").focus(function(){
		$("#li_complexity").fadeIn(1000);
		});
});

/*让确认密码不成功的提示层默认为隐藏，若两次密码不一致，释放焦点后显示*/
$(function(){
	$("#confirm_password_fail").hide();
	$("#confirm_password_ok").hide();

	$("#confirm_password").blur(function(){		
		if($("#confirm_password").val()=="" && $("#newPassword").val()=="" ){
			$("#confirm_password_fail").hide();
			$("#confirm_password_ok").hide();
		}
		else{			          
			if($(this).val()!=$("#newPassword").val() || $(this).val()=="" || $("#newPassword").val()=="" ){				
				$("#confirm_password_fail").show();
				$("#confirm_password_ok").hide();		           			        
			}
			else {	
				$("#confirm_password_ok").show();			$("#confirm_password_fail").hide();
			}

		}		
   });
   		$("#newPassword").blur(function(){		
		if(($("#confirm_password").val()=="" && $("#newPassword").val()=="") || $("#confirm_password").val()=="" ){
			$("#confirm_password_fail").hide();
			$("#confirm_password_ok").hide();
		}
		else{			          
			if($(this).val()!=$("#confirm_password").val() || $(this).val()=="" || $("#confirm_password").val()=="" ){				
				$("#confirm_password_fail").show();
				$("#confirm_password_ok").hide();		           			        
			}
			else {	
				$("#confirm_password_ok").show();			
				$("#confirm_password_fail").hide();
			}

		}		
   });   
});
$(function(){
	$('#selectAddress').change(function(e) {
		$('#address').val($('#selectAddress').val());
    });
    $('#passwordForm').submit(function(){
    	var isSubmit;
    	var password = $('#password').val();
    	var newPassword = $('#newPassword').val();
    	var confirm_password = $('#confirm_password').val();
    	if(password == ""){
    		alert("原密码不能为空！");
    		return false;
    	}
    	if(newPassword == ""){
    		alert("新密码不能为空！");
    		return false;
    	}
    	if(confirm_password == ""){
    		alert("确认密码不能为空！");
    		return false;
    	}
    	if(password.length<6){
    		alert("密码不能少于6位！");
    		return false;
    	}
    	if(newPassword.length<6){
    		alert("新密码不能少于6位！");
    		return false;
    	}
    	if(confirm_password.length<6){
    		alert("确认密码不能少于6位！");
    		return false;
    	}
    	$.ajax({
			url:'passwordValidate',
			async: false,
			data:{password:password},
			cache : false,
			dataType : "text",
			success : function(data){
				//若旧密码密码正确
				if(data == "true"){
					isSubmit = true;
				}
				//若旧密码不正确
				if(data == "false"){
					alert("旧密码错误，请重新输入!");
					isSubmit = false;
				}
			}
		});
		return isSubmit;
    });
});

</script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>