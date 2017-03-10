#http://pokeapi.co/api/v2/pokemon/

require 'net/http'
require 'json'
require 'pp'


#url = 'http://pokeapi.co/api/v2/pokemon/?limit=150' #change ending to match pages with corresponding pokemon
#uri = URI(url)
#response = Net::HTTP.get(uri)
#result = JSON.parse(response)
#puts result["results"][0]["url"]
#link = result["results"][0]["url"]
#pp link
#require 'open-uri'
#content = open(link).read
#content[user_name]
#pp content[type]
#require 'poke-api'

@user_name = "bulbasaur"

def find_pokemon_name(user_number)
   if user_number > 0
         user_number = user_number - 1
   end
    url = 'http://pokeapi.co/api/v2/pokemon/?limit=150' #change ending to match pages with corresponding pokemon
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @result = JSON.parse(response)
    @print_name = @result["results"][user_number]["name"]
end
def find_poke_info
        link = @result["results"][0]["url"]
        require 'open-uri'
        content = open(link).read
        pp content["forms"]
end
puts find_pokemon_name(1)
puts find_poke_info

#loader = Poke::API::Loader.new("pokemon")
#loader.all
# => [{ "name" => "Bulbasaur", "national_id" => 1, ... }, ...]
#puts loader.find(169)
# => { "name" => "Crobat", "national_id" => 169, ... }
#Testing

# Has to iterate through each different URL to find the id matching the users input
#class ID
 #attr_reader :id
 
  # def initialize()
    
 #  end
 
#end


