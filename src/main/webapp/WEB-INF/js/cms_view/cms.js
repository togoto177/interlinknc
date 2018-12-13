jQuery(document).ready(function($){
	$(".portTable table tr").mouseover(function(){
		$(this).find("img").attr("src", "resources/download/download_arrow_lightviolet.png");
	}).mouseleave(function(){
		$(this).find("img").attr("src", "resources/mainImg/download_arrow_white.png");
    });
});