require 'nokogiri'
require 'httparty'
require 'byebug'
require 'open-uri'

def scraper
    doc = Nokogiri::HTML(URI.open("https://mariaclariceleiloes.com.br"))
    product_listings = doc.xpath("//*[@class=\"#{'listing-content'}\"]")
    product_listings.each do |product_listing|
        product = {
             title: product_listing.css('p.box-leiloes-titulo').text,
             price: product_listing.css('span').text
         }
        puts product
    end
 
 end 

scraper

