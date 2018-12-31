jQuery(document).ready(function($){
	var board_division = $('#board_division').val();
	var division = $('#division').val();
	
	if(board_division){
		var k = $('.leftbar_ul li').length;
		for(var i = 1; i < k; i++){
			var name = $('#li_0'+i+' a').attr('id');
			if(board_division == name){
				$('#li_0'+i+'').attr('class', 'rightAc');
			}else{
				$('#li_0'+i+'').attr('class', '');
			}
		}
	}
	if(division){
		var k = $('.leftbar_ul li').length;
		for(var i = 1; i < k; i++){
			var name = $('#li_0'+i+' a').attr('id');
			if(division == name){
				$('#li_0'+i+'').attr('class', 'rightAc');
			}else{
				$('#li_0'+i+'').attr('class', '');
			}
		}
	}
});