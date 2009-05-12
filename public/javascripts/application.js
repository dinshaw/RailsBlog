// External links
$(function(){
	// need to figure out how to concat seletors...
	$('a.external').click(function(){
		window.open(this.href);
		return false;
	});
	$('.external').find('a').click(function(){
		window.open(this.href);
		return false;
	});
	$('.external-img').find('a').click(function(){
		window.open(this.href);
		return false;
	});
});