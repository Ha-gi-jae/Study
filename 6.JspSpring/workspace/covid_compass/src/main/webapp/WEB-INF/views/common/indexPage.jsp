<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<head>
<style>
.on-submenu{
	border-bottom : 3px solid black;
}
.bold{
	font-weight: bold;
}
</style>

</head>

<title></title>

<body>

	<div class="content-wrapper" style="background-color:#fff; height:auto; max-width: 1280px; margin: 0 auto; align-content: center;">
	 	<iframe id="the_iframe" onload="calcHeight();" 
	 	name="ifr" src="<%=request.getContextPath() %>/common/loading" 
	 	frameborder="0" scrolling="no" 
	 	style="overflow-x:hidden; overflow:auto; width:100%; min-height:790px;">
	 	</iframe>
 	</div>

<script type="text/javascript">
function goPage(menuUrl, menuNo, isNotice, noticeNo){
	
	//alert(menuUrl);
	document.querySelector('iframe[name="ifr"]').src = menuUrl;
	
	var submenuId = menuUrl.substring('<%= request.getContextPath().length()%>');
	
	var lis = $('li.subMenu');
	
	lis.removeClass('on-submenu');
	
	var target = document.getElementById(submenuId);
	
	$(target).addClass('on-submenu');
	
	var spans = $('li.subMenu span');
	spans.removeClass('bold');
	var spanTarget = $(target).find('span');
	spanTarget.addClass('bold');
	
	if(typeof(history.pushState) == 'function'){
		var renewURL = location.href;
		renewURL = renewURL.substring(0, renewURL.indexOf('?'));
		
		if(!isNotice){
			renewURL += "?mCode=" + menuNo;
		}else{
			renewURL += "?mCode=" + menuNo + "&noticeNo=" + noticeNo;
		}
		history.pushState(menuNo, null, renewURL);
	}else{
		location.hash = "#"+menuNo;
	}
	
}

//<![CDATA[
function calcHeight(){
 //find the height of the internal page

 var the_height=
 document.getElementById('the_iframe').contentWindow.
 document.body.scrollHeight;

 //change the height of the iframe
 document.getElementById('the_iframe').height=the_height;

 //document.getElementById('the_iframe').scrolling = "no";
 document.getElementById('the_iframe').style.overflow = "hidden";
}
//

window.onload = function(){
	
	if('${isNotice}' =='false'){
		goPage('<%=request.getContextPath()%>${menu.menuUrl}','${menu.menuNo}');
	}else{
		goPage('<%=request.getContextPath()%>${menu.menuUrl}?noticeNo=' + '${noticeNo}','${menu.menuNo}', '${isNotice}', '${noticeNo}');
	}
	
}


</script> 	
 	
</body>

