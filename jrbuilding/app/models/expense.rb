class Expense < ActiveRecord::Base

	belongs_to :building


	validates_presence_of :year, :buildinginfo, :yearend
	validates_uniqueness_of :year, :scope => :buildinginfo
	validates_uniqueness_of :yearend, :scope => :buildinginfo
	validates :cost1, :cost2, :cost3, :cost4, :cost5, :cost6, :cost7, :cost8, :cost9, :cost10, :numericality => { only_integer: false }, :allow_nil => true
	validates_length_of :yeartotal, :minimum => 0, :allow_nil => false, :message => "Please enter at least one amount before saving"

	scope :for_year, lambda {|year1| where("year >= ? and year <= ?", "#{year1}-01-01", "#{year1}-12-31")}

	def self.search(search)
		#search.instance_variables.map {|v| "#{v}: #{search.instance_variable_get(v)}\n"}.join
		if ((search.nil?) || (search == ""))
		   	Expense.all
		elsif (Building.search(search))
			Expense.where("buildinginfo = ?", search)  
		else
			search = search.to_s
		  	Expense.for_year(search)
		end
	end

	def self.years_only
		@y_array = []
		@y2_array = []
		for y in Expense.all

			if @y_array.include?(y.year.year)
				#do nothing, year already in array
			else 
				@y_array << y.year.year
				@y2_array << y
			end
		end
		@y2_array
  	end

  	def year_only
  		year.year
  	end

  	def self.find_expense_by_start_date(date)
  		#search.instance_variables.map {|v| "#{v}: #{search.instance_variable_get(v)}\n"}.join
		if ((date.nil?) || (date == ""))
		    s = ""
		else
			s = Expense.where("year = ?", date) 
		end
		s
  	end

  	def self.for_building(buildinginfo)

		#search.instance_variables.map {|v| "#{v}: #{search.instance_variable_get(v)}\n"}.join
		if ((buildinginfo.nil?) || (buildinginfo == ""))
		    s = []
		    s
		    
		else
			search = buildinginfo.to_s
		
			split = search.split(' ', 2)
			stnum = split.first
	
			stname = split.last
	
		  	s = Building.where("streetno = ?", stnum).where("streetname = ?", stname)
		  	s
		end
	end

	def self.createTag(var1, var2)
		i = 0
	    num = var1.length
	    @var4 = ""
		until i == num
			@var4 << "<option value=\""+var1[i].to_s('F')+"\""+">"+var1[i].to_s+"</option>"
			
		  	i += 1
		end
		@var4
	end

	def self.expenses_for_year(year)
		#search.instance_variables.map {|v| "#{v}: #{search.instance_variable_get(v)}\n"}.join
		
		if ((year.nil?) || (year == ""))
		    s = BigDecimal("0")
		else
			search = year.to_s
		  	s = Expense.where("year = ?", search).first.yeartotal
		end
		s
	end

end
