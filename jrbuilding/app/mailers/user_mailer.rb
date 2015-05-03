class UserMailer < ActionMailer::Base
  default :from => "jordan@webguard.com"
  def reminder_email(tname, temail, tleaseend)
  	@tname = tname
  	@temail = temail
  	@tlend = tleaseend

  		mail(:to => @temail, :subject => "Your Lease is Coming Up on Expiry!")
  	
  end
  

end
