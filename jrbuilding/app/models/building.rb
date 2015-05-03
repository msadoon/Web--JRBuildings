class Building < ActiveRecord::Base
	has_attached_file :avatar, :storage => :dropbox, 
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"), 
		:styles => { :medium => "300x300>", :thumb=> "100x100>" }, 
		:default_url => "No_image_available.png",
		:dropbox_options => { 
			:path => proc { "#{avatar_file_name}" } 
		}
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\z/	
	validates_presence_of :streetno, :streetname, :gst, :qst
	validates_uniqueness_of :streetno, :scope => :streetname
	validates :gst, :qst, :numericality => { only_integer: false }, :allow_nil => true

	has_many :properties, dependent: :destroy
	has_many :tenants, through: :properties, dependent: :destroy
	has_many :expenses, dependent: :destroy

	def self.with_properties
		buildings = Array.new
		Building.all.each do |b| 
			if b.properties.count > 0
				buildings << b
			end
		end
		return buildings
	end

	def full_address
    	[streetno, streetname, postalcode, "Saint Laurent", "Quebec", "Canada"].compact.join(', ')
  	end

  	def half_address
  			[streetno, streetname].join(' ')
  	end

  	def self.get_gst_for_building(buildinginfo)
  		
  		b = Building.find_by_id(search(buildinginfo))
  		if ((b.nil?) || (b == ""))
		    nil
		else
  			b.gst
  		end
  	end

  	def self.get_qst_for_building(buildinginfo)
  		b = Building.find_by_id(search(buildinginfo))
  		if ((b.nil?) || (b == ""))
		    nil
		else
  			b.qst
  		end
  	end

  	def self.search(search)

		#search.instance_variables.map {|v| "#{v}: #{search.instance_variable_get(v)}\n"}.join
		if ((search.nil?) || (search == ""))
		    nil
		else
			search = search.to_s
		
			split = search.split(' ', 2)
			stnum = split.first
	
			stname = split.last
	
		  	s = Building.where("streetno = ?", stnum).where("streetname = ?", stname).pluck(:id).first
	
		  	s
		end
	end

  	geocoded_by :full_address
  	after_validation :geocode

end
