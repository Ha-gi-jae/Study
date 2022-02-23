
document.addEventListener('DOMContentLoaded', function(){
	var calendarEl = document.getElementById('calendar');
	
	var calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar: {
			left: 'prev, next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay'
		},
		initialDate: '2021-12-01',
		navLinks: true,
		selectable: true,
		selectMirror: true,
		select: function(arg){
			console.log(arg);
			
			var title = prompt('입력할 일정:');
			
			if(title){
				calendar.addEvent({
					title : title,
					start : arg.start,
					end : art.end,
					allDay : arg.allDay,
					backgroundColor : "yellow",
					textColor: "blue"
				})
			}
			calendar.unselect()
		},
		eventClick: function(arg){
			// 있는 일정 클릭 시
			console.log("등록된 일정 클릭#");
			console.log(arg.event);
			
			if(confirm('Are you sure you want to delete this event?')){
				arg.event.remove();
			}
		},
		editable: true,
		dayMaxEvents: true, 
		events : function(info, successCallback, failureCallback){
			$.ajax({
				type:"get",
				url:"${path}/calendar.do?method=data",
				dataType:"json"
			});
		}
			// ajax 데이터 불러올 부분
	});
	calendar.render();
});