require 'nokogiri'
require 'httparty'
require 'byebug'
require 'open-uri'

def scraper
    url = "https://pr.olx.com.br/regiao-de-foz-do-iguacu-e-cascavel/regiao-de-cascavel/imoveis?f=p&o=2"
    unparsed_html = HTTParty.get(url)
    #puts unparsed_html
    #puts unparsed_html.class
    doc = Nokogiri::HTML(URI.open("https://pr.olx.com.br/regiao-de-foz-do-iguacu-e-cascavel/regiao-de-cascavel/imoveis?f=p&o=2"))
    #puts doc 
    #page = Nokogiri::HTML(unparsed_html)
    #puts page 
    product_listings = doc.css('div.sc-12rk7z2-2')
    # puts product_listings
    product_listings.each do |product_listing|
        #puts product_listing
        #puts product_listing.css('div')
        product_listing.xpath("//span").display
        
        byebug
        #product = {
        #    title: product_listing.css('a.product-item-name-js').text,
        #}
        #byebug
    end
 
 end 

scraper