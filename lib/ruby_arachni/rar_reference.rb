class RarReference
  attr_accessor :title, :url

  def initialize(title, url)
    self.title = title
    self.url = url
  end

  class << self
    def parse(reference)
      RarReference.new(reference.attribute('title').value, reference.attribute('url').value)
    end
  end
end