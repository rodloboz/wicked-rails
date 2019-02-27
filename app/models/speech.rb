class Speech < ApplicationRecord
  has_many :contributions

  before_create :format_content

  private

  def format_content
    self.content = SpeechToHtml.new(content).perform
  end
end
