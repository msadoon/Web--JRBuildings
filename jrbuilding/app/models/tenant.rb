class Tenant < ActiveRecord::Base
	before_validation :clear_empty_attrs

	validates_presence_of :tenantbuildinginfo, :tenantname
	validates_format_of :propertynumber, :with => /\A[0-9]+\z/, :allow_nil => false

	belongs_to :property
	has_many   :cheques, dependent: :destroy

	def self.search(search)
		#search.instance_variables.map {|v| "#{v}: #{search.instance_variable_get(v)}\n"}.join
		if ((search.nil?) || (search == ""))
		   	s = Tenant.all
		elsif (Building.search(search))
			s = Tenant.where("tenantbuildinginfo = ?", search)  
		else
			search = search.to_s
		
			split = search.split(' - ', 2)
			binfo = split.last
	
			pinfo = split.first
	
		  	s = Tenant.where("tenantbuildinginfo = ?", binfo).where("propertynumber = ?", pinfo)
		end
		s
	end

	def annualquota
		if (((pshare.nil?) || (pshare == "")) || ((yeartotal.nil?) || (yeartotal == "")))
			#do nothing
		else 
				@aq = ((pshare/100)*yeartotal.to_d)
				val = ((pshare/100)*yeartotal.to_d).to_f
				val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
				val2
		end
  	end

	def monthrent2
  		if ((monthrent.nil?) || (monthrent == ""))
			#do nothing
		else 
			@mr = monthrent
			val = monthrent.to_f
			val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 

			val2
		end
  	end

  	def monthlybasis
  		if (((yearlyincrease.nil?) || (yearlyincrease == "")) || ((monthrent.nil?) || (monthrent == "")))
			#do nothing
		else 
			
			val = (((yearlyincrease/100) + 1)*@mr).to_f
			val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
			val2
		end
  	end
  	def gstamount
  		if (((gst.nil?) || (gst == "")) || ((additionalmonthly.nil?) || (additionalmonthly == "")))
			#do nothing
		else 
			
			val = ((gst/100)*additionalrent.to_d).to_f
			val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
			val2
		end
  	end
  	def qstamount
  		if (((qst.nil?) || (qst == "")) || ((additionalmonthly.nil?) || (additionalmonthly == "")))
			#do nothing
		else 
			
			val = ((qst/100)*additionalrent.to_d).to_f
			val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
			val2
		end
  	end
  	def nowdate
  		DateTime.now.to_date
  	end
  	def additionalmonthly
  		if ((annualquota.nil?) || (annualquota == "")) 
			#do nothing
		else 
			
			val = (@aq/12).to_f
			val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
			val2
		end
  	end
  	def year
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			Expense.find_expense_by_start_date(expenseyear).first.year
		end
  	end
  	def yearend
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			
			Expense.find_expense_by_start_date(expenseyear).first.yearend
		end
  	end
  	def yeartotal
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			val = Expense.find_expense_by_start_date(expenseyear).first.yeartotal.to_f
			val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
			val2
		end
  	end
  	def cost1
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			if ((Expense.find_expense_by_start_date(expenseyear).first.cost1.nil?) || (Expense.find_expense_by_start_date(expenseyear).first.cost1 == "")) 
			#do nothing
			else 
				val = Expense.find_expense_by_start_date(expenseyear).first.cost1.to_f
				val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
				val2
			end
		end
  	end
  	def cost2
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			if ((Expense.find_expense_by_start_date(expenseyear).first.cost2.nil?) || (Expense.find_expense_by_start_date(expenseyear).first.cost2 == "")) 
			#do nothing
			else 
				val = Expense.find_expense_by_start_date(expenseyear).first.cost2.to_f
				val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
				val2
			end
		end
  	end
	def cost3
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			if ((Expense.find_expense_by_start_date(expenseyear).first.cost3.nil?) || (Expense.find_expense_by_start_date(expenseyear).first.cost3 == "")) 
			#do nothing
			else 
				val = Expense.find_expense_by_start_date(expenseyear).first.cost3.to_f
				val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
				val2
			end
		end
  	end
  	def cost4
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			if ((Expense.find_expense_by_start_date(expenseyear).first.cost4.nil?) || (Expense.find_expense_by_start_date(expenseyear).first.cost4 == "")) 
			#do nothing
			else 
				val = Expense.find_expense_by_start_date(expenseyear).first.cost4.to_f
				val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
				val2
			end

		end
  	end
  	def cost5
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			if ((Expense.find_expense_by_start_date(expenseyear).first.cost5.nil?) || (Expense.find_expense_by_start_date(expenseyear).first.cost5 == "")) 
			#do nothing
			else 
				val = Expense.find_expense_by_start_date(expenseyear).first.cost5.to_f
				val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
				val2
			end
		end
  	end
  	def cost6
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			if ((Expense.find_expense_by_start_date(expenseyear).first.cost6.nil?) || (Expense.find_expense_by_start_date(expenseyear).first.cost6 == "")) 
			#do nothing
			else 
				val = Expense.find_expense_by_start_date(expenseyear).first.cost6.to_f
				val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
				val2
			end
		end
  	end
  	def cost7
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			if ((Expense.find_expense_by_start_date(expenseyear).first.cost7.nil?) || (Expense.find_expense_by_start_date(expenseyear).first.cost7 == "")) 
			#do nothing
			else 
				val = Expense.find_expense_by_start_date(expenseyear).first.cost7.to_f
				val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
				val2
			end
		end
  	end
  	def cost8
		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			if ((Expense.find_expense_by_start_date(expenseyear).first.cost8.nil?) || (Expense.find_expense_by_start_date(expenseyear).first.cost8 == "")) 
			#do nothing
			else 
				val = Expense.find_expense_by_start_date(expenseyear).first.cost8.to_f
				val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
				val2
			end
		end
  	end
  	def cost9
		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			if ((Expense.find_expense_by_start_date(expenseyear).first.cost9.nil?) || (Expense.find_expense_by_start_date(expenseyear).first.cost9 == "")) 
			#do nothing
			else 
				val = Expense.find_expense_by_start_date(expenseyear).first.cost9.to_f
				val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
				val2
			end
		end 			
  	end
  	def cost10
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			if ((Expense.find_expense_by_start_date(expenseyear).first.cost10.nil?) || (Expense.find_expense_by_start_date(expenseyear).first.cost10 == "")) 
			#do nothing
			else 
				val = Expense.find_expense_by_start_date(expenseyear).first.cost10.to_f
				val2 = ActionController::Base.helpers.number_with_precision(val, precision: 2) 
				val2
			end
		end
  	end
  	def item1
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			Expense.find_expense_by_start_date(expenseyear).first.item1
		end	
  	end
  	def item2
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			Expense.find_expense_by_start_date(expenseyear).first.item2
		end
  	end
  	def item3
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			Expense.find_expense_by_start_date(expenseyear).first.item3
		end
  	end
  	def item4
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			Expense.find_expense_by_start_date(expenseyear).first.item4
		end
  	end
  	def item5
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			Expense.find_expense_by_start_date(expenseyear).first.item5
		end
  	end
  	def item6
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			Expense.find_expense_by_start_date(expenseyear).first.item6
		end	
  	end
  	def item7
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			Expense.find_expense_by_start_date(expenseyear).first.item7
		end
  	end
  	def item8
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			Expense.find_expense_by_start_date(expenseyear).first.item8
		end
  	end
  	def item9
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			Expense.find_expense_by_start_date(expenseyear).first.item9
		end	
  	end
  	def item10
  		if ((expenseyear.nil?) || (expenseyear == "")) 
			#do nothing
		else 
			Expense.find_expense_by_start_date(expenseyear).first.item10
		end	
  	end
  	
	  protected
	  def clear_empty_attrs
	    @attributes.each do |key,value|
	      self[key] = nil if value.blank?
	    end
	  end

end
