class User < ActiveRecord::Base
	attr_accessor :password
	before_save :encrypt_password

	has_attached_file :avatar, :storage => :dropbox, 
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"), 
		:styles => { :medium => "300x300>", :thumb=> "100x100>" }, 
		:default_url => "No_image_available.png",
		:dropbox_options => { 
			:path => proc { "#{avatar_file_name}" } 
		}

	has_attached_file :mlease, :storage => :dropbox, 
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"), 
		:dropbox_options => { 
			:path => proc { "master_lease.pdf" } 
		}

	has_attached_file :expadd, :storage => :dropbox, 
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"), 
		:dropbox_options => { 
			:path => proc { "exp_add.pdf" } 
		}

	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\z/	
	validates_attachment :mlease, content_type: { content_type: "application/pdf", message: "Please only upload a pdf in this field" }
	validates_attachment :expadd, content_type: { content_type: "application/pdf", message: "Please only upload a pdf in this field" }
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email

	def self.mlease_url(current_user)
		mlease_url = "https://www.dropbox.com/s/4k53u162clnspr3/master_lease.pdf?dl=1"
		mlease_url
	end

	def self.expadd_url(current_user)
		expadd_url = "https://www.dropbox.com/s/6mo76r431ucxsly/exp_add.pdf?dl=1"
		expadd_url
	end

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

end
