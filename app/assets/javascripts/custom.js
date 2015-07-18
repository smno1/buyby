var main = function() {	
	$('.datatable').DataTable({    
  });
	$(".owl-carousel").owlCarousel({
 
      autoPlay: 3000, //Set AutoPlay to 3 seconds
 
      items : 4,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3]
 
  });
	$('.selectpicker').selectpicker();

	$('.show_next').click(function() {
		$(this).next().toggle();
	});

	$('.unread_comment').click();
};

$(document).ready(main);
$(document).on('page:load', main)
