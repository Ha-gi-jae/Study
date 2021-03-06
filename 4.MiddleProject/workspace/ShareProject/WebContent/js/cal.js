/**
 * 
 */
deleteTt = function(id) {
	$.ajax({
		url : '/ShareProject/TtDelete.do',
		data: {"id" : id},
		type : 'get',
		success : function(res) {
			if(res.flag == "성공하였습니다."){
				alert("시간표를 삭제하였습니다.")
				location.reload();
			}
		},
		error : function(abc) {
			alert("상태 : " + abc.status)
		},
		dataType : 'json'
	}) 
}

updateTt = function(updata) {
	$.ajax({
		url : '/ShareProject/TtUpdate.do',
		data: updata,
		type : 'post',
		success : function(res) {
			if(res.flag == "성공하였습니다."){
				alert("시간표를 수정하였습니다.")
				$('#updateModal').modal('hide');
				
				
			}
			$('.tt').attr("disabled");
			location.reload();
			
		},
		error : function(abc) {
			alert("상태 : " + abc.status)
		},
		dataType : 'json'
	}) 
}

ttInsert = function(ttdata) {
	$.ajax({
		url : '/ShareProject/TtInsert.do',
		data: ttdata,
		type : 'post',
		success : function(res) {
			if(res.flag == "성공하였습니다."){
				alert("시간표 등록에 성공하였습니다.")
				$('#writeModal').modal('hide');
			}
			location.reload();
		},
		error : function(abc) {
			alert("상태 : " + abc.status)
		},
		dataType : 'json'
	}) 
}

calList = function(day, id) {
	$.ajax({
		url : '/ShareProject/CalList.do',
		type : 'get',
		data : {"day" : day},
		success : function(res) {
			code = "<br><br>";
			code += "<h3 class='a'><b>[" + day.substr(0,4) + "년 "+ day.substr(4,2) + "월 " +day.substr(6) + "일]</b></h3><br>";
			if(id == "admin"){
			code += '<button type="button" class="calInsert pin" data-toggle="modal" data-target="#writeModal" style="display : none;">일정등록</button>';
			 }
			if(res == ""){
				code += "<br><p class='a'>해당하는 일정이 없습니다.</p>"
			}else{
				$.each(res, function(i, v) { 
					
					s = v.start;
					e = v.end;
					code += "<div class='list a'>";
					code += "<br><p class='id a'>" + v.id + "</p>";
					code += "<h4 class='ti a'>"+ v.title +"</h4>";
					code += "<p class='s a'> 시작 : " + s.substr(0,10) +"</p>";
					code += "<p class='e a'> 종료 : " + e.substr(0,10) + "</p>";
					code += "<p class='col a'>" + v.color + "</p>";
					 if(id == "admin"){
					code += '<input type="button" value="일정수정" class="modi a" data-toggle="modal" data-target="#updateModal"> ';
					code += '<input type="button" value="일정삭제" class="del a"><br><br>';
					 }
					code += "</div>";
				})
			}

			$('#detail').html(code);
			
			// 관리자 아이디일 경우 등록버튼 보여주기
	       	 if(id == "admin"){
	       		$('.del').show();
	       		$('.modi').show();
	       		$('.calInsert').show();
	       	 }
			
			
			
		},
		error : function(abc) {
			alert(abc.status)
		},
		dataType : 'json'
	})
}

insertCal = function(datas) {
	
	$.ajax({
		url : '/ShareProject/CalInsert.do',
		type : 'post',
		data : datas,
		success : function(res) {
			
			alert("등록 " + res.flag);
			
			$('#writeModal .fin').val("");
			$('#writeModal').modal('hide');
			
			location.reload();
		}, 
		error : function(abc) {
			alert("상태 : " + abc.status)
		},
		dataType : 'json'
	})
}

deleteCal = function(id) {

	$.ajax({
		url : '/ShareProject/CalDelete.do',
		type : 'get',
		data : {"id" : id},
		success : function(res) {
			
			alert("삭제" + res.flag);
			
		}, 
		error : function(abc) {
			alert("상태 : " + abc.status)
		},
		dataType : 'json'
	})
}

updateCal = function(updatas) {
	$.ajax({
		url : '/ShareProject/CalUpdate.do',
		type : 'post',
		data : updatas,
		success : function(res) {
			alert("수정" + res.flag);
			$('#updateModal').modal('hide');
			location.reload();
		}, 
		error : function(abc) {
			alert("상태 : " + abc.status)
		},
		dataType : 'json'
	})
}