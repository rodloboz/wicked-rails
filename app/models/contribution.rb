class Contribution < ApplicationRecord
  belongs_to :speech

  attr_accessor :speech_html
end
