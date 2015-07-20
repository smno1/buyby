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
		"未读消息",
		{position:"top left",
		className: 'info',
		clickToHide: true,
		autoHide: false}
		);

	$('.new_offer').notify(
		"收到新的报价",
		{position:"top left",
		className: 'info',
		clickToHide: true,
		autoHide: false	}
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
