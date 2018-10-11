require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_all_the_urls_of_nos_deputes
  result = []
	page = Nokogiri::HTML(open("http://www.nosdeputes.fr/deputes"))
  list_string = page.css('.list_nom').text
  list_string.split('    ').each do |names|
    noms = names.split(', ')
    if (noms[0] != "\n" and noms[1] != nil)
      hash = Hash.new
      hash["last_name"] = noms[0][2..-1]
      hash["first_name"] = noms[1]
      result << hash
    end
  end
  
  return result
end

# puts get_all_emails
puts get_all_the_urls_of_nos_deputes