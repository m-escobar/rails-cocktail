puts 'Seeding Ingredients'

request_uri = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
request_query = ''
url = "#{request_uri}#{request_query}"
buffer = open(url).read

result = JSON.parse(buffer)

result['drinks'].each do |ing|
    ingredient = Ingredient.new
    
    ingredient.name = ing.first[1]
    ingredient.save!
end
  
puts `Seeded #{Ingredient.count()} ingredientes`