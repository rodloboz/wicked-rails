class Event < ApplicationRecord
  has_many :event_categories
  has_many :categories, through: :event_categories

  # accepts_nested_attributes_for :event_categories, allow_destroy: true

  validates :title, :location, :description, presence: true, if: :active?
end
