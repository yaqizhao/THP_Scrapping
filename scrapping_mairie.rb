require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(city_add)
	page = Nokogiri::HTML(open(city_add))
	result = page.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').to_s[4..-6]
  return result
end 

def get_all_the_urls_of_val_doise_townhalls
  result = []
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  array_cities = page.css("a").select{|a| a['class'] == "lientxt"}
  array_cities.each{|link| result << "http://annuaire-des-mairies.com/" + link["href"][2..-1] }
  return result
end

def get_all_emails
  emails = []
  get_all_the_urls_of_val_doise_townhalls.each{|url| emails << get_the_email_of_a_townhal_from_its_webpage(url)}
  return emails
end

puts get_all_emails