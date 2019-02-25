class EventCategory < ApplicationRecord
  belongs_to :category
  belongs_to :event

  validates :category, uniqueness: { scope: :event }
end
