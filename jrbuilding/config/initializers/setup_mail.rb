ActionMailer::Base.smtp_settings = {
	:address			  => "smtp.gmail.com",
	:port				  => 587,
	:domain				  => "jrbuildings.com",
	:user_name			  => "msadoon",
	:password			  => "047001169",
	:authentication		  => "plain",
	:enable_starttls_auto => true
}