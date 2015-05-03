# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

	$("#submit_cheque").attr("disabled", "disabled")
	$("#single_report").attr("disabled", "disabled")
	$("#all_report").attr("disabled", "disabled")

	$(document).on "ajax:success", "#cheque_delete", ->
		  $("#submit_cheque").attr("disabled", "disabled")
		  $.when($.ajax(
			    url: "/tenants/get_tenant_table"
			    dataType: "text"
			    data:
			      tname: window.tenantname
			  ).success( (data) ->
			      $("#cheque_table_body").html(data)
			  ).error( (data) ->
			      console.log data
			  )).done (a1) ->			  	
			  	$("#submit_cheque").removeAttr("disabled")


	$("#new_cheque").submit ->
		$("#submit_cheque").attr("disabled", "disabled")
		$.post(this.action, $(this).serialize(), null, "script");
		$.when($.ajax(
			    url: "/tenants/get_tenant_table"
			    dataType: "text"
			    data:
			      tname: window.tenantname
			  ).success( (data) ->
			      $("#cheque_table_body").html(data)
			  ).error( (data) ->
			      console.log data
			  )).done (a1) ->			  	
			  	$("#submit_cheque").removeAttr("disabled")

		return false;


	$(".list-group-item").click ->
	  window.tenantname = $(this).text()
	  $(this).parent().find(".list-group-item").css "background-color", "#ffffff"
	  $(this).parent().find(".list-group-item").css "color", "#000000"
	  $(this).css "background-color", "#428bca"
	  $(this).css "color", "#ffffff"
	  path = "/cheques/single_report?tenant=" + window.tenantname
	  $(".button_to").attr("action", path)
	  $.when($.ajax(
			    url: "/tenants/get_tenant_id"
			    dataType: "text"
			    data:
			      tname: window.tenantname
			  ).success( (data) ->
			      $("#cheque_tenant_id").val data
			  ).error( (data) ->
			  	  	
			      console.log data
			  ), $.ajax(
			    url: "/tenants/get_tenant_table"
			    dataType: "text"
			    data:
			      tname: window.tenantname
			  ).success( (data) ->
			      $("#cheque_table_body").html(data)
			  ).error( (data) ->
			  	  	
			      console.log data
			  )).done (a1, a2) ->

			  	
			  	$("#submit_cheque").removeAttr("disabled")
			  	$("#single_report").removeAttr("disabled")
			  	$("#all_report").removeAttr("disabled")
			 return