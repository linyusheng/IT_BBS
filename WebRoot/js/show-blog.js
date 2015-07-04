function path()
{
    var args = arguments,
    result = [];

    for(var i = 0; i < args.length; i++){
        result.push(args[i].replace('@', getRootPath()+'/js/syntaxhighlighter/scripts/'));
	}
    return result
};
//js获取项目根路径，如： http://localhost:8080/ems
function getRootPath(){
	//获取当前网址，如： http://localhost:8080/ems/Pages/Basic/Person.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8080
    var localhostPath = curWwwPath.substring(0, pos);
    //获取带"/"的项目名，如：/ems
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return(localhostPath + projectName);
}
$(function(){
    SyntaxHighlighter.autoloader.apply(null, path(
    'applescript            @shBrushAppleScript.js',
    'actionscript3 as3      @shBrushAS3.js',
    'bash shell             @shBrushBash.js',
    'coldfusion cf          @shBrushColdFusion.js',
    'cpp c                  @shBrushCpp.js',
    'c# c-sharp csharp      @shBrushCSharp.js',
    'css                    @shBrushCss.js',
    'delphi pascal          @shBrushDelphi.js',
    'diff patch pas         @shBrushDiff.js',
    'erl erlang             @shBrushErlang.js',
    'groovy                 @shBrushGroovy.js',
    'java                   @shBrushJava.js',
    'jfx javafx             @shBrushJavaFX.js',
    'js jscript javascript  @shBrushJScript.js',
    'perl pl                @shBrushPerl.js',
    'php                    @shBrushPhp.js',
    'text plain             @shBrushPlain.js',
    'py python              @shBrushPython.js',
    'ruby rails ror rb      @shBrushRuby.js',
    'sass scss              @shBrushSass.js',
    'scala                  @shBrushScala.js',
    'sql                    @shBrushSql.js',
    'vb vbnet               @shBrushVb.js',
    'xml xhtml xslt html    @shBrushXml.js'
    ));
    SyntaxHighlighter.config.clipboardSwf= getRootPath()+'/js/syntaxhighlighter/scripts/clipboard.swf';  
	SyntaxHighlighter.defaults['toolbar'] = false;
    SyntaxHighlighter.all();
});