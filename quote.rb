class Quote
  attr_accessor :id, :content

  def initialize(content)
    @content = content
  end

  def save
    @id = 1 if valid?
    valid?
  end

  def valid?
    !content.nil? && !content.empty?
  end

  def to_json
    {
      id: @id,
      content: @content
    }
  end
end
