class TwilioService
  def initialize(recipient, message, service = nil)
    @recipient = recipient
    @message = message
    @service = service
  end

  def perform
  end

  private

  def client
    @client ||= Twilio::REST::Client.new
  end

  def submit
    client.messages.create({
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: recipient_number,
      body: @message
    })
  end

  def recipient_number
    if @service
      "#{@service}:#{@recipient}"
    else
      @recipient
    end
  end
end
