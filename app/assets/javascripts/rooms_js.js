$(function(){
	$('table#roomtable tr').css('background-color', '#cfc');
	$(".enter_button").click(function(){
		console.log('room' + this.id + ' clicked ' + $("#user_name").prop("value"));
		window.location.href = "chat/index?room_id="+this.id+"&user_name="+$("#user_name").prop("value");
	});
});
