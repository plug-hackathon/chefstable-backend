class BookingNotification
  attr_accessor :message

  def intialize(message)
  	self.message = message
  end

  def sms(phone_number)
  	if Rails.env.production?	
	  	client.messages.create(
	  		from: twilio_number,
	  		to: phone_number,
	  		body: message
	  	)
	  else
	  	logger.debug message 
	  	logger.phone_number
	  end
  end

  private def client
  	@client ||= begin
  		Twilio::REST::Client.new twilio_account_sid, twilio_auth_token
  	end
	end

	private def twilio_auth_token
		Rails.application.secrets.twilio_auth_token
	end

	private def twilio_account_sid
		Rails.application.secrets.twilio_account_sid
	end

	private def twilio_number
		Rails.application.secrets.twilio_number
	end
end