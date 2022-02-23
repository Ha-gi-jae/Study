<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	function summernote_go(target){
		// UI적인 요소(Jquery로 만든)는 무조건 Jquery 로 선택해야함. 
		// DOM, BOM 핸들링은 JAVA Script
		//기본형 summernote TA 안보이게하고 자기것을 보여줌.
		// JSON 형태로 각각의 항목이 있다. 키값으로 정해져있음. css, 스타일 핸들링 절대 안먹힘.^^
		// 그러니까 설정치를 줘야함. // 단축도구도 지정 가능하다. 폰트도 내가 지정 가능! 데이트피커도 이와 유사함.
		target.summernote({
			placeholder:'여기에 내용을 적어주세요.',
			lang:'ko-KR',
			height: '250px',
			disableResizeEditor: true,
			callbacks:{ // callbacks - 재 정의 하겠다.
				onImageUpload : function(files, editor, welEditable){ // files - 순수 자바스크립트 파일 배열 객체. 여러개가 가능. 순서 X
					for(var file of files){
	// 					alert(file.name);
						if(file.name.substring(file.name.lastIndexOf(".")+1).toUpperCase() != "JPG"){
							alert("JPG 이미지형식만 가능합니다.");
							return;
						}
						if(file.size > 1024 *1024 * 5){
							alert("이미지는 5MB 미만입니다.");
							return;
						}
					}
				
					for(var file of files){
						sendFile(file,this); // this = TextArea
					}
				},
				onMediaDelete : function(target){ // image Tag - JQuery객체.
	// 				alert(target.attr("src"));
	// 				alert(target[0].src); // 순수 자바스크립트 객체가0번째에포함되어있음.
					var splitSrc = target[0].src.split("=");
	//					var splitSrc = target.attr("src").split("=");
					var fileName = splitSrc[splitSrc.length-1];
	//					alert(fileName);
					deleteFile(fileName); //target, fileName, target[0].src 셋 중 선택
				}
			}
		});
	}

	function sendFile(file, el){ // el = TextArea
		var form_data = new FormData();
		form_data.append("file", file);
		$.ajax({
			data: form_data,
			type: "POST",
			url: '<%=request.getContextPath()%>/uploadImg.do',
			cache: false,
			contentType: false,
			processData: false,
			success: function(img_url) {
				$(el).summernote('editor.insertImage', img_url);
			},
			error: function(){
				alert(file.name+" 업로드에 실패했습니다.");
			}
		});
	}

//json 받을때 객체로 받는다 > command 객체, 보낼때 object mapper.
	function deleteFile(src){
		var splitSrc = src.split("=");
		var fileName = splitSrc[splitSrc.length-1];
		
		var fileData = {fileName:fileName}; // object mapper로 받으려고함! command 객체 필요 // 클래스 리스트 혼용 /
		
		$.ajax({
			url:"<%=request.getContextPath()%>/deleteImg.do",
			data : JSON.stringify(fileData),
			type:"post",
			contentType : "application/json",
			success:function(res){
				console.log(res);
			},
			error:function(){
				alert("이미지 삭제가 불가합니다.");
			}
		})
	}
</script>