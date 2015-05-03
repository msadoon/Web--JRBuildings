# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

	#AJAX rendering of partial for tenants in any one property. INDEX page
	$('#tenants_filter_property').change ->
		$.get(this.action, $(this).serialize(), null, "script");
		return false;
	$('#tenants_filter_building').change ->
		$.get(this.action, $(this).serialize(), null, "script");
		return false;

	#on load edit page - for delete button
	if (typeof $("#tenant_id").val() is "undefined")
		#do nothing
	else
		if ($("#tenant_id").val().length == 0)
			$("#delete").css('display','none')
		else if ($("#tenant_id").val().length > 0)
			$("#delete").css('display','show')

	#on load edit page
		if (($("#tenant_ltype").val() == "Net") && ($("#tenant_id").val().length == 0))
			$("#net_tenant").css('display','none')
			$("#lease_info").css('display', 'none')
		else if (($("#tenant_ltype").val() == "Net") && ($("#tenant_id").val().length > 0))
			$("#net_tenant").css('display','show')
			$("#lease_info").css('display', 'show')
		else if (($("#tenant_ltype").val() == "Gross") && ($("#tenant_id").val().length > 0))
			$("#net_tenant").css('display','none')
			$("#lease_info").css('display', 'show')
		else
			$("#net_tenant").css('display', 'none')
			$("#lease_info").css('display', 'none')

	#the next three methods define a special message that comes up when submitting the form, checks for tenants currently in the local being saved to.
	if ($("#tenant_id").val().length == 0)
		#filter proprerty basd on building on _edit load
		$.when($.ajax(
			    url: "/buildings/properties_for_building"
			    dataType: "text"
			    data:
			      buildinginfo: $('#tenant_tenantbuildinginfo').val()
			  ).success( (data) ->
			  	  options =  data
				    $("#tenant_propertynumber").html(options)
			  ).error( (data) ->
			  	  console.log data
			      
			  )).done (a1) ->
		 		$.ajax(
			        url: "/tenants/tenants_in_local"
			        dataType: "text"
			        data:
			            pnum: $('#tenant_propertynumber').val(),
			            bnum: $('#tenant_tenantbuildinginfo').val()
			    ).success( (data) ->
			 		         console.log data   	   
			            $('#special_message').text data
			    ).error( (data) ->
			      	console.log 'error'
			    )									
		
		   
		###
		$("#tenant_tenantbuildinginfo").change ->
			$.when($.ajax(
				    url: "/buildings/properties_for_building"
				    dataType: "text"
				    data:
				      buildinginfo: $('#tenant_tenantbuildinginfo').val()
				  ).success( (data) ->
				  	  options =  data
					    $("#tenant_propertynumber").html(options)
				  ).error( (data) ->
				  	  console.log data
				      
				  )).done (a1) ->
			 		$.ajax(
				        url: "/tenants/tenants_in_local"
				        dataType: "text"
				        data:
				            pnum: $('#tenant_propertynumber').val(),
				            bnum: $('#tenant_tenantbuildinginfo').val()
				    ).success( (data) ->
				 		         console.log data   	   
				            $('#special_message').text data
				    ).error( (data) ->
				      	console.log 'error'
				    )

		$("#tenant_propertynumber").change ->	    
		    $.ajax(
				        url: "/tenants/tenants_in_local"
				        dataType: "text"
				        data:
				            pnum: $('#tenant_propertynumber').val(),
				            bnum: $('#tenant_tenantbuildinginfo').val()
				    ).success( (data) ->
				 		         console.log data   	   
				            $('#special_message').text data
				    ).error( (data) ->
				      	console.log 'error'
				    )
		###	
					
	grossnet = ->
			if ($("#tenant_ltype").val() == "Gross")
				monthlyrentwithtax = $("#tenant_monthrent").val() * (($("#tenant_gst").val()/100 + $("#tenant_qst").val()/100) + 1)
				$("#tenant_monthrentwithtax").val(monthlyrentwithtax.toFixed(2))
				yearlyrentwithtax = monthlyrentwithtax * 12
				$("#tenant_yearrentwithtax").val(yearlyrentwithtax.toFixed(2))
			else 
				increase = ((($('#tenant_pshare').val()/100) * $('#tenant_expenseforyear').val())/12)
				basicplus = ((($('#tenant_yearlyincrease').val()/100) + 1) * $('#tenant_monthrent').val())
				subtotal = increase + basicplus
				$("#tenant_additionalrent").val(subtotal.toFixed(2))
				monthlyrentwithtax = $("#tenant_additionalrent").val() * (($("#tenant_gst").val()/100 + $("#tenant_qst").val()/100) + 1)
				$("#tenant_monthrentwithtax").val(monthlyrentwithtax.toFixed(2))
				yearlyrentwithtax = monthlyrentwithtax * 12
				$("#tenant_yearrentwithtax").val(yearlyrentwithtax.toFixed(2))	  

	updatefields = ->

			if ($("select#tenant_expenseyear option").length == 0)
				increase = 0
				basicplus = ((($('#tenant_yearlyincrease').val()/100) + 1) * $('#tenant_monthrent').val())
				subtotal = increase + basicplus
				$("#tenant_additionalrent").val(subtotal.toFixed(2))
				monthlyrentwithtax = $("#tenant_additionalrent").val() * (($("#tenant_gst").val()/100 + $("#tenant_qst").val()/100) + 1)
				$("#tenant_monthrentwithtax").val(monthlyrentwithtax.toFixed(2))
				yearlyrentwithtax = monthlyrentwithtax * 12
				$("#tenant_yearrentwithtax").val(yearlyrentwithtax.toFixed(2))
			else 
				increase = ((($('#tenant_pshare').val()/100) * $('#tenant_expenseforyear').val())/12)
				basicplus = ((($('#tenant_yearlyincrease').val()/100) + 1) * $('#tenant_monthrent').val())
				subtotal = increase + basicplus
				$("#tenant_additionalrent").val(subtotal.toFixed(2))
				monthlyrentwithtax = $("#tenant_additionalrent").val() * (($("#tenant_gst").val()/100 + $("#tenant_qst").val()/100) + 1)
				$("#tenant_monthrentwithtax").val(monthlyrentwithtax.toFixed(2))
				yearlyrentwithtax = monthlyrentwithtax * 12
				$("#tenant_yearrentwithtax").val(yearlyrentwithtax.toFixed(2))
				

	#if l_type is net, also change the expense year (populate the options for the collection select)
	#handles building/property dropdowns (properties filtered based on building)
	
	###
	$("#tenant_tenantbuildinginfo").change ->
			if ($("#tenant_ltype").val() == "Net")
				$.ajax(
					    url: "/expenses/expenses_for_building"
					    dataType: "text"
					    data:
					      buildinginfo: $('#tenant_tenantbuildinginfo').val()
					  ).success( (data) ->
					  	  options =  data
      				$("#tenant_expenseyear").html(options)
					  ).error( (data) ->
					  	  console.log data
					      
					  )
			else
				$('#tenant_expenseyear').empty()
	
	#handles building/property dropdowns (properties filtered based on building)
	$("#tenant_tenantbuildinginfo").change ->
				$.ajax(
					    url: "/buildings/properties_for_building"
					    dataType: "text"
					    data:
					      buildinginfo: $('#tenant_tenantbuildinginfo').val()
					  ).success( (data) ->
					  	  options =  data
      				$("#tenant_propertynumber").html(options)
					  ).error( (data) ->
					  	  console.log data
					      
					  )
	###
		
	#turns on/off expense addendum after type is changed
	$("#tenant_ltype").change ->
		if (($("#tenant_ltype").val() == "Net") && ($("#tenant_id").val().length == 0))
			$("#net_tenant").css('display','none')
			$("#lease_info").css('display', 'none')
		else if (($("#tenant_ltype").val() == "Net") && ($("#tenant_id").val().length > 0))
			$("#net_tenant").css('display','show')
			$("#lease_info").css('display', 'show')
			$.ajax(
					    url: "/expenses/expenses_for_building"
					    dataType: "text"
					    data:
					      buildinginfo: $('#tenant_tenantbuildinginfo').val()
					  ).success( (data) ->
					  	  options =  data
      				$("#tenant_expenseyear").html(options)
					  ).error( (data) ->
					  	  console.log data
					      
					  )
		else if (($("#tenant_ltype").val() == "Gross") && ($("#tenant_id").val().length > 0))
			$("#net_tenant").css('display','none')
			$("#lease_info").css('display', 'show')
		else
			$("#net_tenant").css('display', 'none')
			$("#lease_info").css('display', 'none')

	

	#month, pshare, onload, yearlyincrease, expenseyear onchange calculations, all should modify additional rent, yearly rent with tax and monthly rent with tax (needs work!)

	$("#tenant_expenseyear").change ->
		$.when($.ajax(
				    url: "/expenses/expensesforyear"
				    dataType: "text"
				    data:
				      year: $(this).val()
				  ).success( (data) ->
				    $("#tenant_expenseforyear").val data
				  ).error( (data) ->
				      console.log data
				  )).done (a1) ->

				 updatefields()
				 
				 return

	$("#tenant_pshare").change ->
		updatefields()

	$("#tenant_yearlyincrease").change ->
		updatefields()

	$("#tenant_ltype").change ->
		grossnet()

	$("#tenant_monthrent").change ->
		grossnet()


	$.when($.ajax(
		    url: "/expenses/expensesforyear"
		    dataType: "text"
		    data:
		      year: $("#tenant_expenseyear").val()
		  ).success( (data) ->
		    $("#tenant_expenseforyear").val data
		  ).error( (data) ->
		      console.log data
		  )).done (a1) ->
		 		grossnet()
				updatefields()
		return

	#when tenant buildinginfo changes, change the gst and qst and the monthlyrentwithtax, yearlyrentwithtax.
	###
	$("#tenant_tenantbuildinginfo").change ->
		$.when($.ajax(
		    url: "/buildings/getgst"
		    dataType: "text"
		    data:
		      buildinginfo: $(this).val()
		  ).success( (data) ->
		      $("#tenant_gst").val data
		  ).error( (data) ->
		      console.log data
		  ), $.ajax(
		    url: "/buildings/getqst"
		    dataType: "text"
		    data:
		      buildinginfo: $(this).val()
		  ).success( (data) ->
		      $("#tenant_qst").val data
		  ).error( (data) ->
		      console.log data
		  )).done (a1, a2) ->
		 	if ($("#tenant_ltype").val() == "Net")
					$.ajax(
							url: "/expenses/expensesforyear"
							dataType: "text"
							data:
									year: $("#tenant_expenseyear").val()
								).success( (data) ->
									$("#tenant_expenseforyear").val data
								).error( (data) ->
									console.log data
								).done (a1) ->
									console.log($("#tenant_expenseforyear").val())
									if ($("#tenant_expenseforyear").val() == '0.0')
											console.log 'should be hidden'
											$("#expenseyearid").css('display','none')
									else
											console.log 'should not be hidden'
											$("#expenseyearid").css('display','show')
						 updatefields()
						 grossnet()
				   return
				else 
				    updatefields()
				    grossnet()
												

		return
	###

						  
