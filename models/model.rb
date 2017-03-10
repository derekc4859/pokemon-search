#http://pokeapi.co/api/v2/pokemon/

require 'net/http'
require 'json'
require 'pp'

url = 'http://pokeapi.co/api/v2/pokemon/?limit=150' #change ending to match pages with corresponding pokemon
uri = URI(url)
response = Net::HTTP.get(uri)
result = JSON.parse(response)
puts result["results"][21]["name"]



#loader = Poke::API::Loader.new("pokemon")
#loader.all
# => [{ "name" => "Bulbasaur", "national_id" => 1, ... }, ...]
#puts loader.find(169)
# => { "name" => "Crobat", "national_id" => 169, ... }
#Testing


# Has to iterate through each different URL to find the id matching the users input
class ID
 attr_reader :id
 
   def initialize()
    
   end
 
end


