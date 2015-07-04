// JavaScript Document
$(function(){
	$(".header").slide({effect:"topLoop",mainCell:".ad ul",autoPlay:true,interTime:5000});
	//搜索博客输入框不能为空
	$('#searchForm').submit(function(){
		var keyword = $('#searchForm input[type="text"]').val();
		if(keyword == "" || keyword == null){
			alert("请输入关键字！");
			return false;
		}
		return true;
	});
	//提交问题表单验证
	$('#postForm').submit(function(e) {
		var title = $('#postForm input[type="text"]').val();
		var editor = CKEDITOR.instances.editor.getData();
		if(title == ""){
			alert("标题不能为空！");
			return false;
		}
		if(editor == ""){
			alert("详细描述不能为空！");
			return false;
		}
        return true;
    });
})
//分页查询
function searchForPage(page) {
	$('#currentpage').val(page);
	if ($('#currentpage').val() != null) {
		$('#pagingForm').submit();
	} else {
		alert("当前页面值不能为空!");
	}
}