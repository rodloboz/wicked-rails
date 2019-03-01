class SpeechToHtml
  def initialize(text)
    @text = text
  end

  def perform
    text_to_html
  end

  private

  attr_reader :text

  def paragraphs
    @paragraphs ||= text.split(/\n/)
  end

  def text_to_html
    paragraphs.each_with_index.map do |content, i|
      "<p data-index=#{i}>#{content}</p>"
    end.join
  end
end
