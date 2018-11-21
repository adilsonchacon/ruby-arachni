require 'nokogiri'

require File.join(File.dirname(__FILE__), 'ruby_arachni', 'version')
require File.join(File.dirname(__FILE__), 'ruby_arachni', 'rar_reference')
require File.join(File.dirname(__FILE__), 'ruby_arachni', 'rar_issue')
require File.join(File.dirname(__FILE__), 'ruby_arachni', 'rar_check')
require File.join(File.dirname(__FILE__), 'ruby_arachni', 'rar_vector')

module RubyArachni

  def self.parse(path)
    issues = []
    
    doc = Nokogiri::XML(File.open(path))
    doc.xpath('//issues/issue').map do |xml_issue|
      issue = RarIssue.new
      [:name, :description, :remedy_guidance, :remedy_code, :severity, :cwe, :digest,
      :remarks, :page, :referring_page, :signature, :proof, :trusted, :platform_type,
      :platform_name].each do |field|
        issue.send("#{field.to_s}=", xml_issue.css(field.to_s).text)
      end
      
      check = xml_issue.css('check')
      issue.check = RarCheck.parse(check) if !check.nil?

      vector = xml_issue.css('vector')
      issue.vector = RarVector.parse(vector) if !vector.nil?
      
      issue.references = []
      
      references = xml_issue.css('references')
      if !references.nil? 
        references.css('reference').each do |reference|
          issue.references.push(RarReference.parse(reference))
        end
      end
            
      issues.push issue
    end
    
    issues
  end

end
