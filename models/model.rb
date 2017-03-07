#http://pokeapi.co/api/v2/pokemon/

require 'net/http'
require 'json'
require 'pp'

url = 'http://pokeapi.co/api/v2/pokemon/' #change ending to match pages with corresponding pokemon
uri = URI(url)
response = Net::HTTP.get(uri)
result = JSON.parse(response)
#puts result["results"][0]["name"]

#require 'poke-api'

#loader = Poke::API::Loader.new("pokemon")
#loader.all
# => [{ "name" => "Bulbasaur", "national_id" => 1, ... }, ...]
#puts loader.find(169)
# => { "name" => "Crobat", "national_id" => 169, ... }
#Testing
