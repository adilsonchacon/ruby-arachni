class RarVector
  attr_accessor :klass, :type, :url, :action

  def initialize(klass, type, url, action)
    self.klass = klass
    self.type = type
    self.url = url
    self.action = action
  end

  class << self
    def parse(vector)
      RarVector.new(vector.css('class').text, vector.css('type').text, vector.css('url').text, vector.css('action').text)
    end
  end
end