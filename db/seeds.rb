require 'json'
require 'open-uri'
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning ingredients database...'

Ingredient.destroy_all

puts 'Creating ingredients... '

ingredient_attributes = []
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients_serialized = open(url).read

ingredients = JSON.parse(ingredients_serialized)

ingredients["drinks"].each do |ingredient|
  ingredient_attributes << { name: ingredient["strIngredient1"] }
end

Ingredient.create!(ingredient_attributes)

Cocktail.destroy_all
5.times do
  Cocktail.create(
    name: Faker::Coffee.blend_name
  )
end
