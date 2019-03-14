class TwilioRelayJob < ApplicationJob
  queue_as :default

  def perform(event)
    message = "You have the event #{event.title} coming up in 10 minutes"
    TwilioService.new(event.host, message, :whatsapp).perform
  end
end
