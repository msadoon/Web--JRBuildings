# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

	#AJAX rendering of partial for tenants in any one property. INDEX page
	$('#expenses_filter_building').change ->
		$.get(this.action, $(this).serialize(), null, "script");
		return false;
	$('#expenses_filter_year').change ->
		$.get(this.action, $(this).serialize(), null, "script");
		return false;

	#on load edit page
	if (typeof $("#expense_id").val() is "undefined")
		#do nothing
	else
		if ($("#expense_id").val().length == 0)
			$("#delete").css('display','none')
		else if ($("#expense_id").val().length > 0)
			$("#delete").css('display','show')

	#calculating yearly total for expenses
	@yeartotal = 0
	$("#expense_cost1").change ->
		@yeartotal = $(this).val() * 1 + $("#expense_cost2").val() * 1 + $("#expense_cost3").val() * 1 + $("#expense_cost4").val() * 1 + $("#expense_cost5").val() * 1 + $("#expense_cost6").val() * 1 + $("#expense_cost7").val() * 1 + $("#expense_cost8").val() * 1 + $("#expense_cost9").val() * 1 + $("#expense_cost10").val() * 1
		$("#expense_yeartotal").val(@yeartotal.toFixed(2))
		return

	$("#expense_cost2").change ->
		@yeartotal = $(this).val() * 1 + $("#expense_cost1").val() * 1 + $("#expense_cost3").val() * 1 + $("#expense_cost4").val() * 1 + $("#expense_cost5").val() * 1 + $("#expense_cost6").val() * 1 + $("#expense_cost7").val() * 1 + $("#expense_cost8").val() * 1 + $("#expense_cost9").val() * 1 + $("#expense_cost10").val() * 1
		$("#expense_yeartotal").val(@yeartotal.toFixed(2))
		return

	$("#expense_cost3").change ->
		@yeartotal = $(this).val() * 1 + $("#expense_cost1").val() * 1 + $("#expense_cost2").val() * 1 + $("#expense_cost4").val() * 1 + $("#expense_cost5").val() * 1 + $("#expense_cost6").val() * 1 + $("#expense_cost7").val() * 1 + $("#expense_cost8").val() * 1 + $("#expense_cost9").val() * 1 + $("#expense_cost10").val() * 1
		$("#expense_yeartotal").val(@yeartotal.toFixed(2))
		return

	$("#expense_cost4").change ->
		@yeartotal = $(this).val() * 1 + $("#expense_cost1").val() * 1 + $("#expense_cost2").val() * 1 + $("#expense_cost3").val() * 1 + $("#expense_cost5").val() * 1 + $("#expense_cost6").val() * 1 + $("#expense_cost7").val() * 1 + $("#expense_cost8").val() * 1 + $("#expense_cost9").val() * 1 + $("#expense_cost10").val() * 1
		$("#expense_yeartotal").val(@yeartotal.toFixed(2))
		return

	$("#expense_cost5").change ->
		@yeartotal = $(this).val() * 1 + $("#expense_cost1").val() * 1 + $("#expense_cost2").val() * 1 + $("#expense_cost3").val() * 1 + $("#expense_cost4").val() * 1 + $("#expense_cost6").val() * 1 + $("#expense_cost7").val() * 1 + $("#expense_cost8").val() * 1 + $("#expense_cost9").val() * 1 + $("#expense_cost10").val() * 1
		$("#expense_yeartotal").val(@yeartotal.toFixed(2))
		return

	$("#expense_cost6").change ->
		@yeartotal = $(this).val() * 1 + $("#expense_cost1").val() * 1 + $("#expense_cost2").val() * 1 + $("#expense_cost3").val() * 1 + $("#expense_cost4").val() * 1 + $("#expense_cost5").val() * 1 + $("#expense_cost7").val() * 1 + $("#expense_cost8").val() * 1 + $("#expense_cost9").val() * 1 + $("#expense_cost10").val() * 1
		$("#expense_yeartotal").val(@yeartotal.toFixed(2))
		return

	$("#expense_cost7").change ->
		@yeartotal = $(this).val() * 1 + $("#expense_cost1").val() * 1 + $("#expense_cost2").val() * 1 + $("#expense_cost3").val() * 1 + $("#expense_cost4").val() * 1 + $("#expense_cost5").val() * 1 + $("#expense_cost6").val() * 1 + $("#expense_cost8").val() * 1 + $("#expense_cost9").val() * 1 + $("#expense_cost10").val() * 1
		$("#expense_yeartotal").val(@yeartotal.toFixed(2))
		return

	$("#expense_cost8").change ->
		@yeartotal = $(this).val() * 1 + $("#expense_cost1").val() * 1 + $("#expense_cost2").val() * 1 + $("#expense_cost3").val() * 1 + $("#expense_cost4").val() * 1 + $("#expense_cost5").val() * 1 + $("#expense_cost6").val() * 1 + $("#expense_cost7").val() * 1 + $("#expense_cost9").val() * 1 + $("#expense_cost10").val() * 1
		$("#expense_yeartotal").val(@yeartotal.toFixed(2))
		return

	$("#expense_cost9").change ->
		@yeartotal = $(this).val() * 1 + $("#expense_cost1").val() * 1 + $("#expense_cost2").val() * 1 + $("#expense_cost3").val() * 1 + $("#expense_cost4").val() * 1 + $("#expense_cost5").val() * 1 + $("#expense_cost6").val() * 1 + $("#expense_cost7").val() * 1 + $("#expense_cost8").val() * 1 + $("#expense_cost10").val() * 1
		$("#expense_yeartotal").val(@yeartotal.toFixed(2))
		return

	$("#expense_cost10").change ->
		@yeartotal = $(this).val() * 1 + $("#expense_cost1").val() * 1 + $("#expense_cost2").val() * 1 + $("#expense_cost3").val() * 1 + $("#expense_cost4").val() * 1 + $("#expense_cost5").val() * 1 + $("#expense_cost6").val() * 1 + $("#expense_cost7").val() * 1 + $("#expense_cost8").val() * 1 + $("#expense_cost9").val() * 1
		$("#expense_yeartotal").val(@yeartotal.toFixed(2))
		return