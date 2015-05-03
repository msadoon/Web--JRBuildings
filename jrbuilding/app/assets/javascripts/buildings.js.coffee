# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	#on load edit page
	if (typeof $("#building_id").val() is "undefined")
		#do nothing
	else
		if ($("#building_id").val().length == 0)
			$("#delete").css('display','none')
		else if ($("#building_id").val().length > 0)
			$("#delete").css('display','show')