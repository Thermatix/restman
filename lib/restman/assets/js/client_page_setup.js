function collapsible () {
	var collapse_element = $('.collapsible')
	var is_accordion = (collapse_element.data('collapsible') == 'accordion')
	collapse_element.collapsible({
	      accordion : is_accordion
	 });
}

function selectable () {
	$('select').material_select();
};


