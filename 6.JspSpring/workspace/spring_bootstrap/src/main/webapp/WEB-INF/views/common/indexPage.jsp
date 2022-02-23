<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<head></head>

<title></title>

<body>
	<div class="content-wrapper" style="background-color:#fff;">
		<iframe name="ifr" src="" frameborder="0" style="width:100%;height:85vh;"></iframe>
	</div>

<script>
function goPage(url, mCode){
// 	alert(url);
// 	alert(mCode);
// 	$('iframe[name="ifr"]').attr("src", url);
// jquery로 dom을 다루는것은 좋지 않음. 모양만들때만 쓰는걸 추천
// jquery 로딩을 신경써야되니까...
	$('iframe[name="ifr"]').attr("src",url);
// 	document.querySelector('iframe[name="ifr"]').src=url;
	
	// HTML5 지원 브라우저에서 사용 가능
	if (typeof(history.pushState) == 'function'){
		
		//현재 주소를 가져온다.
		var renewURL = location.href;
		// 현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
		renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
		
		if(mCode != 'M000000'){
			renewURL += "?mCode="+mCode;
		}
		// 페이지를 리로드 하지않고 페이지 주소만 변경할 때 사용
		history.pushState(mCode, null, renewURL);
	}else{
		location.hash = "#"+mCode;
	}	
}

function subMenu_go(mCode){
	//alert(mCode);
	if(mCode != "M000000"){
		$.getJSON("<%=request.getContextPath()%>/subMenu.do?mCode="+mCode,function(data){
// 			console.log(data);
			printData(data,$('.subMenuList'), $('#subMenu-list-template'),'.subMenu');
			
		});
	}else{
		$('.subMenuList').html("");
	}
}

//handlebars printElement (args : data Array, append target, handler template, remove class)
function printData(dataArr, target, templateObject, removeClass){
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(dataArr);
	
	// 순수자바스크립트로 하려면 document.querySelector 쓰면됨.
	$(removeClass).remove();
	
	// 부모로 가서 지워야함. 가장 좋은 방법.
// 	var child = document.querySelector(removeClass);
// 	child.parentNode.removeChild(child);

// 	document.querySelectorAll(removeClass).remove(); 인터넷 익스플로러에서는 못씀..
	target.append(html);
}

window.onload=function(){ // 한번만 써야함. include 포함해서 두번쓰면 에러 남! 임베디드형태로 딱 한번만 써라. 헤더 푸터 어사이드 이런곳에!!
	goPage('<%=request.getContextPath()%>${menu.murl}', '${menu.mcode}');
	subMenu_go('${menu.mcode}'.substring(0,3)+"0000");
}

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="subMenu-list-template">
{{#each .}}
	<li class="nav-item subMenu" >
		<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}', '{{mcode}}');"
			class="nav-link">
			<i class="{{micon}}"></i>
			<p>{{mname}}</p>
		</a>
	</li>
{{/each}}
</script>
</body>


