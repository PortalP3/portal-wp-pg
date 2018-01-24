(function( $ ) {

	'use strict';

	$(function() {

		var data = {};
		data.creativegem_plugins_list = 'yes';
		$.ajax({
			url: document.URL,
			cache: false,
			type: "get",
			data: data,
			success: function(response) {

				if( $( response ).find('.creativegem-addons-list').length > 0 ) {

					$('.creativegem-addons-list').replaceWith( $( response ).find('.creativegem-addons-list') );
				}
			}
		});
	});

})( jQuery );
