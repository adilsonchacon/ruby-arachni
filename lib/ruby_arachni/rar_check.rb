class RarCheck
  attr_accessor :name, :description, :author, :version, :shortname

  def initialize(fields)
    self.name = fields['name']
    self.description = fields['description']
    self.author = fields['author']
    self.version = fields['version']
    self.shortname = fields['shortname']
  end

  class << self
    def parse(check)
      fields = {}
      
      fields['name'] = check.css('name').text
      fields['description'] = check.css('description').text
      fields['author'] = check.css('author').text
      fields['version'] = check.css('version').text
      fields['shortname'] = check.css('shortname').text
      
      RarCheck.new(fields)
    end
  end
end