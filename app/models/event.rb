class Event < ApplicationRecord
  has_many :event_categories
  has_many :categories, through: :event_categories

  validates :title, :location, :description, presence: true, if: :active?
end
