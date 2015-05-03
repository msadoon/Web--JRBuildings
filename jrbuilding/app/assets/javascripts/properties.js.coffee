# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	$('#properties_filter').change ->
		$.get(this.action, $(this).serialize(), null, "script");
		return false;

	#on load edit page
	if (typeof $("#property_id").val() is "undefined")
		#do nothing
	else
		if ($("#property_id").val().length == 0) 
			$("#delete").css('display','none')
		else if ($("#property_id").val().length > 0)
			$("#delete").css('display','show')
