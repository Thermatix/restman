function make_request(request,method,data,callback) {
	$.ajax({
		url: request,
		type: method,
		data: data,
		success: callback
	});
}


function get_page (request,target){
	make_request(request,'GET',null,function (response) {
		request_callback(response,target);
		});	
}

function post_page (request,data,target){
	make_request(request,'POST',data,function (response) {
		request_callback(response,target);
	})
}

function request_callback (response,target) {
	change_target(response,target)
	setUpPageElements();
}

function submit_form (request,method,data,type,target) {
	switch(type){
		case 'modal':
 			$('#' + target).openModal();
		break;
		case 'target':

		break;
		case 'page':

		break
	}
	make_request(request,method,data,function (response) {
		change_target(response,target)
		submit_callback(response,type,target)
	})
}

function change_target (html,target){
	$('#' + target).html(html)			
}

function submit_callback(response,type,target) {
	switch(type){
		case 'modal':
			post_page(response.links.modal,{"message" : response.message},target)
		break;
		case 'target':
			change_target(response,target);
			setUpPageElements();
		break
		case 'page':
			('body').html(response)
		break;
	}
}

function detect_click () {
	$( 'a' ).unbind().on('click', function (event) {
		element = $(this);
		var request = element.data('request')
		switch(element.data('type')){
			case 'link':
				get_page(request,element.data('target'));
			break;
			case 'switch':

			break;
			case 'button':

			break;
		}
	});
};



function detect_submit () {
	$('#form').unbind().on('submit', function (e) {
		e.preventDefault();
		form = $(this);
		submit_form(form.attr('action'),form.attr('method'),form.serialize(),form.data('type'),form.data('target'))
	});
}


function setUpPageElements () {
	collapsible();
	selectable();

	detect_click();
	detect_submit();

};




$(document).ready(function() {
	get_page('/client/render/all_jobs','view_port');
});

