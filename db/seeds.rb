# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'
require 'nokogiri'

Location.destroy_all
Review.destroy_all

user = User.create(email: "test@test.com", password: "password", password_confirmation: "password")

links = []

6.times do |i|
 html_file = open("http://www.jaccede.com/en/p/s/?what=&where=london&pg=#{i}&sort=&sort2=&0=trouver")
 html_doc = Nokogiri::HTML(html_file)

 html_doc.search('.lieu-vignette h3 a').each do |element|
   links << element.attribute('href')
 end
end

links.each do |link|
 html_file = open("http://www.jaccede.com/#{link}")
 html_doc = Nokogiri::HTML(html_file)

 name = html_doc.search('#fiche-coordonnes-infos h2').text()
 description = html_doc.search('#place_description').text()
 city = html_doc.search('.fiche-adresse span a').text()
 street = html_doc.search('.fiche-adresse span').text().split(city)[0].strip[0..-2]
 location_category = html_doc.search('#fiche-coordonnes-infos div a')[0].text()

 location = user.locations.create(name: name, description: description, city: city, street: street, location_category: location_category)
 location.reviews.create(rating: 2, content: "super chouette l'accès", user_id: user.id)
end
