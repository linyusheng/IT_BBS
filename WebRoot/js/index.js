// JavaScript Document
$(function(){
	var id_array=new Array('mobile','web','architecture','language','internet','opensource',
						   'os','database','develop','industry','other');
	for(var i=0;i<id_array.length;i++){
		navBg(id_array[i],i+1);
	}
	//搜索博客输入框不能为空
	$('#searchForm').submit(function(){
		var keyword = $('#searchForm input[type="text"]').val();
		if(keyword == "" || keyword == null){
			alert("请输入关键字！");
			return false;
		}
		return true;
	});
})
//导航栏鼠标经过特效
function navBg(id,index){
	$('.nav_side #'+id).hover(
			function(){
				$('.nav_side li:eq('+index+')').addClass('select');
			},
			function(){
				$('.nav_side li:eq('+index+')').removeClass('select');
			}
	);
}
//分页查询
function searchForPage(page) {
	$('#currentpage').val(page);
	if ($('#currentpage').val() != null) {
		$('#pagingForm').submit();
	} else {
		alert("当前页面值不能为空!");
	}
}
function removeHTMLTag(str) {
    str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
    str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
    //str = str.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
    str=str.replace(/ /ig,'');//去掉 
    return str;
}