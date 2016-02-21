class BookingNotification
  attr_accessor :message

  def intialize(message)
    self.message = message
  end

  def sms(phone_number)
    Rails.logger.debug "Will send SMS, but only in production"
    Rails.logger.debug message
    Rails.logger.debug phone_number

    if Rails.production
      client.messages.create(
        from: twilio_number,
        to: phone_number,
        body: message
      )
    end

  rescue Twilio::REST::RequestError => e
    handle_twilio_exception(e)
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

  private def handle_twilio_exception(e)
    if e.message.include('is not a valid phone number')
      true
    else
      raise e
    end
  end
end