
function request_page (request,target){
	$.ajax({
		url: request,
		type: 'GET',
		success: function(response){
			$('#' + target).html(response)
			setUpPageElements();
		}
	});
	
}

function detect_click () {
	$( 'a' ).on('click', function (event) {
		element = $(this);
		var request = element.data('request')
		switch(element.data('type')){
			case 'link':
				request_page(request,element.data('target'));
			break;
			case 'switch':

			break;
			case 'button':

			break;
		}
	});
};


function setUpPageElements () {
	collapsible();
	selectable();
	
};




$(document).ready(function() {
	detect_click();
	request_page('/client/render/all_jobs','view_port');

});