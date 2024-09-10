class Property < ApplicationRecord
	has_attached_file :avatar, :storage => :dropbox, 
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"), 
		:styles => { :medium => "300x300>", :thumb=> "100x100>" }, 
		:default_url => "No_image_available.png",
		:dropbox_options => { 
			:path => proc { "#{avatar_file_name}" } 
		}
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\z/	
	validates_presence_of :number, :buildinginfo
	validates_uniqueness_of :number, :scope => :buildinginfo

	belongs_to :building
	has_many	:tenants, dependent: :destroy
	

	# def self.filter_by_building(buildingnumber)
	# 	if buildingnumber
	# 		self.where(:buildingnumber => buildingnumber)
	# 	else 
	# 		Property.all
	# 	end
	# end

	def self.search(search)
		#search.instance_variables.map {|v| "#{v}: #{search.instance_variable_get(v)}\n"}.join
		if ((search.nil?) || (search == ""))
		    Property.all
		else
		  	Property.where("buildinginfo = ?", search)  
		end
	end

	def self.createTag(var1, var2)
		i = 0
	    num = var1.length
	    @var4 = ""
		until i == num
			@var4 << "<option value=\""+var2[i].to_s+"\""+">"+var1[i].to_s+"</option>"
		  	i += 1
		end
		
		@var4
	end

  	def index_dropdown
  			[number, buildinginfo].join(' - ')
  	end

	def self.searchSecond(search)
		#search.instance_variables.map {|v| "#{v}: #{search.instance_variable_get(v)}\n"}.join
		if ((search.nil?) || (search == ""))
		    nil
		else
			search = search.to_s
		  	s = Property.where("buildinginfo = ?", search).pluck(:id).first
		  	s
		end
	end

end
