$().ready(function() {

	$('#ei-slider').eislideshow({
		animation : 'center',
		autoplay : true,
		slideshow_interval : 3000,
		titlesFactor : 0
	});

	$(".to_blur").mouseover(function() {
		$(this).find('.image img').first().addClass('blurred');
	});
	
	$('.to_blur').mouseleave(function(){
		$(this).find('.image img').first().removeClass('blurred');
	});
});
