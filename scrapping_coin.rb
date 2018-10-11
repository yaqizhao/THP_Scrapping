require 'rubygems'
require 'nokogiri'
require 'open-uri'

def trader_de_lobscur
  array_de_hashs = []
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  page.at_css('#currency-exchange-rates').each do |key, value| 
    hash = Hash.new(key.to_s)
    hash[key.to_s] = value.to_f 
    array_de_hashs << hash
  end
  return array_de_hashs
end

puts trader_de_lobscur