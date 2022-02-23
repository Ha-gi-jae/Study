/**
 * 
 */

updateBoardServer = function(){
	$.ajax({
		url: '/boardpro/UpdateBoard.do',
		type: 'post',
		data: udatas, //방금 만든 데이터~
		dataType: 'json',	// text, html, xml 올 수 있음.
		success: function(res){
			alert(res.flag);
			
			//화면 수정. -// btnupdate : 수정버튼 이다.
			parent = $(btnupdate).parents('.panel');
			$(parent).find('a').text(udatas.subject);
			$(parent).find('.mail').text(udatas.mail);
			
			content = udatas.content.replace(/\r/g, "").replace(/\n/g, "<br>");
			
			$(parent).find('.bcont').html(content); // textarea
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status + " 메시지 : " + xhr.statusText);
		}
	})
}

deleteBoardServer = function(){
	$.ajax({
		url: '/boardpro/DeleteBoard.do',
		type: 'get',
		data: {"num" : vidx},
		dataType : 'json',
		success : function(res){
			if (res.flag == "성공"){
				if(res.tpage < currentPage) currentPage = res.tpage;
			}
			// 다시 리스트 출력 ( 게시글이 삭제되면 카운트가 바뀌기 때문에 페이지도 바뀐다. )
			listPageServer(currentPage);
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

updateHitServer = function(){
	$.ajax({
		url: '/boardpro/UpdateHit.do',
		type: 'get',
		data: {"num" : vidx},
		dataType: 'json',
		success : function(res){
//			alert(res.flag);
		},
		error: function(xhr){
			alert("상태 : " + xhr.status + " 메시지 : " + xhr.statusText);
		}
	})
}

replyUpdateServer = function(){
	$.ajax({
		url: '/boardpro/ReplyUpdate.do',
		type: 'post',
		data: reply,
		dataType: 'json',
		success: function(res){
//			alert(res.flag);
		},
		error: function(xhr){
			alert("상태 : " + xhr.status + " 메시지 : " + xhr.statusText);
		}
		
	})
}

replyDeleteServer = function(but){
	$.ajax({
		url: '/boardpro/ReplyDelete.do',
		data: {"renum" : vidx},
		type: 'get',
		dataType: 'json',
		success: function(res){
			$(but).parents('.rep').remove();
			
		},
		error: function(xhr){
			alert("상태 : " + xhr.status + " 상태 메시지 : " + xhr.statusText);
		}
	})
	
	
	
	
}


replyListServer = function(t){
	
	$.ajax({
		url: '/boardpro/ReplyList.do',
		data: {"bonum" : vidx},
		type: 'get',
		dataType: 'json',
		success: function(res){
			
			$(t).parents('.panel').find('.rep').remove();
					// $(t) parents('panel') find('.pbody').find('.rep').remove(); 이렇게 해줘도 된다.
			rcode = "";
			
			$.each(res, function(i, v){
				
				rcode += '<div class="panel-body rep">';
				rcode += '<p class="p1">';
				rcode += '작성자 : <span class="name">'+ v.name +'</span>&nbsp;&nbsp;&nbsp;&nbsp;';
				rcode += '작성날짜 : <span class="date">'+ v.redate +'</span>&nbsp;&nbsp;&nbsp;&nbsp;';
				rcode += '</p>';
				rcode += '<p class="p2">';
				rcode += '<input type="button" idx="' + v.renum + '" value="댓글수정" name="rmodify" class="action">';
// 밑에처럼하면 동기방식!
// rcode += '<input type="button" onclick="boardproReplyDelete.do?renum" idx="' + v.renum + '" value="댓글수정" name="rmodify" class="action">';
				rcode += '<input type="button" idx="' + v.renum + '" value="댓글삭제" name="rdelete" class="action">';
				rcode += '</p>';
				rcode += '<p class="p3">';
				rcode += v.cont;
				rcode += '</p>';
				rcode += '</div>'
			})
			
			$(t).parents('.panel').find('.pbody').append(rcode);
			
		},
		error: function(xhr){
			alert("상태 : " + xhr.status + " 에러 메시지 : " + xhr.statusText)
		}
	})
}

replySaveServer = function(t){ // t는 this로 받은거. 등록버튼
	$.ajax({
		url: '/boardpro/ReplySave.do',
		data: reply, // cont, bonum, name 들어가있음.
		type: 'post',
		dataType: 'json',
		success: function(res){
			// 성공했다면? 리스트 출력
			replyListServer(t);
		},
		error: function(xhr){
			alert("상태 : " + xhr.status)
		}
	})
	
	
}

listPageServer = function(page){
	
	//페이지별 리스트 출력
	$.ajax({
		url : "/boardpro/List.do",
		type : 'post',
		data : {"page" : page},
		success : function(res){
			code = '<div class="panel-group" id="accordion">';
			$.each(res.datas, function(i, v){
				code += '<div class="panel panel-default">';
			    code += '<div class="panel-heading">';
			    code += '<h4 class="panel-title">';
			    code += '<a name="list" class="action" idx="'+ v.num + '" data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.num + '">'+ v.subject +'</a>';
			    code += '</h4>';
			    code += '</div>';
			    code += '<div id="collapse' + v.num + '" class="panel-collapse collapse">';
			    code += '<div class="panel-body pbody">';
			    code += '<p class="p1">';
			    code += '작성자 : <span class="name">'+ v.writer +'</span>&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '이메일 : <span class="mail">'+ v.mail +'</span>&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '작성날짜 : <span class="date">'+ v.wdate +'</span>&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '조회수 : <span class="hit">'+ v.hit +'</span>';
			    code += '</p>';
			    code += '<p class="p2">';
			    code += '<input type="button" idx="' + v.num + '" value="수정" name="modify" class="action">';
			    code += '<input type="button" idx="' + v.num + '" value="삭제" name="delete" class="action">';
			    code += '</p>';
			    code += '<p class="p3 bcont">';
			    code += v.content;
			    code += '</p>';
			    code += '<p class="p4">';
			    code += '<textarea rows="3" cols="80"></textarea>';
			    code += '<input type="button" idx="' + v.num + '" value="등록" name="reply" class="action">';
			    code += '</p>';
			    code += '</div>';
			    code += '</div>';
			    code += '</div>';
			})
			code += '</div>';
			
			$('.box').html(code);
			
			// 이전
			pager ="";
			if(res.spage > 1){
					
				pager += '<ul class="pager">';
					pager += '<li class="previous"><a href="#">Previous</a></li>';
				pager += '</ul>';
			}
			
			//페이지번호
			pager += '<ul class="pagination">';
				for(i = res.spage; i <=res.epage ; i++){
					
					if(res.cpage == i) {
						pager += '<li class="active"><a href="#">' + i + '</a></li>';
					}else{
						pager += '<li><a href="#">' + i +'</a></li>';
					}
				}
			 pager += '</ul>';
			  
			// 다음
			if(parseInt(res.epage) < parseInt(res.tpage)){ // 데이터가 많으면 parseInt해야함. 정렬 때문ㅇ.
				
				pager += '<ul class="pager">';
					pager += '<li class="next"><a href="#">Next</a></li>';
				pager += '</ul>';
			}
			
			$('.plist').html(pager);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status + " text : " + xhr.statusText);
		},
		dataType : 'json'
	})
}


listServer = function(){	
	
// 전체 리스트 출력
	$.ajax({
		url: "/boardpro/List.do",
		type: 'get',
		success: function(res){
			
			code = '<div class="panel-group" id="accordion">';
			$.each(res, function(i, v){
				code += '<div class="panel panel-default">';
			    code += '<div class="panel-heading">';
			    code += '<h4 class="panel-title">';
			    code += '<a data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.num + '">'+ v.subject +'</a>';
			    code += '</h4>';
			    code += '</div>';
			    code += '<div id="collapse' + v.num + '" class="panel-collapse collapse">';
			    code += '<div class="panel-body">';
			    code += '<p class="p1">';
			    code += '작성자 : <span class="name">'+ v.writer +'</span>&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '이메일 : <span class="mail">'+ v.mail +'</span>&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '작성날짜 : <span class="date">'+ v.wdate +'</span>&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '조회수 : <span class="hit">'+ v.hit +'</span>';
			    code += '</p>';
			    code += '<p class="p2">';
			    code += '<input type="button" value="수정" name="modify" class="action">';
			    code += '<input type="button" value="삭제" name="delete" class="action">';
			    code += '</p>';
			    code += '<p class="p3">';
			    code += v.content;
			    code += '</p>';
			    code += '<p class="p4">';
			    code += '<textarea rows="3" cols="80"></textarea>';
			    code += '<input type="button" value="등록" name="reply" class="action">';
			    code += '</p>';
			    code += '</div>';
			    code += '</div>';
			    code += '</div>';
			})
			code += '</div>';
			
			$('.box').html(code);
			
		},
		error: function(xhr){
			alert('상태 : ' + xhr.status + "Text : " + xhr.statusText)
		},
		dataType: 'json'
	})
}