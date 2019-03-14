class Event < ApplicationRecord
  has_many :event_categories
  has_many :categories, through: :event_categories

  validates :title, :location, :description, presence: true, if: :active?
  validates :start_time, presence: true

  after_create :set_reminder


  private

  def set_reminder
    return if start_time > Time.now.end_of_day

    TwilioRelayJob.new.set(wait: start_time - 10.minutes).perform_later(self)
  end
end
