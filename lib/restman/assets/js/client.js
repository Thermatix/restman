
function detect_click () {
	$( 'a' ).on('click', function (event) {
		element = $(this);
		var request = element.data('request')
		var renderTarget = element.data('rendertarget');
		if(request) {
			$.ajax({
				url: request,
				type: 'GET',
				success: function(response){
					$('#' + renderTarget).html(response)
				}
			});
		}
	})
};





$( document ).ready(function() {
	detect_click();
});