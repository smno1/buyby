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

	$('.unread').notify(
		"未读消息", "info",
		{position:"top left"}
		);
	$('.unread-comment').click(function(){
		$.ajax({
			url: "/update_unread_comment",
			data: {
				comment_id : $(this).attr('data-id')
			},
			dataType: "script"
		});
		$(this).removeClass('unread-comment');
	});
};

$(document).ready(main);
$(document).on('page:load', main)
