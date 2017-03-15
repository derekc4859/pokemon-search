
#http://pokeapi.co/api/v2/pokemon/

require 'net/http'
require 'json'
require 'pp'


#@user_name = "bulbasaur"
class Name
    
    attr_accessor :num , :form , :shiny_form
    
    def initialize(num)
        @num = num.to_i
    end
    
    def find_poke_name
      number = @num
      if number > 0
        number -= 1
      elsif number <= 0
          number = number + 1
      end
      @real_num = number
      url = 'http://pokeapi.co/api/v2/pokemon/?limit=150' #change ending to match pages with corresponding pokemon
      uri = URI(url)
      response = Net::HTTP.get(uri)
      @result = JSON.parse(response)
      @print_name = @result["results"][@real_num]["name"]
    end

    def new_info
     url = @result["results"][@real_num]["url"]
    # url = "http://pokeapi.co/api/v2/pokemon/1/"
     uri = URI(url) 
     response = Net::HTTP.get(uri)
     @link = JSON.parse(response)
     @link["forms"][0]["url"]
    end

    def poke_sprites
     url = @link["forms"][0]["url"]
     uri = URI(url) 
     response = Net::HTTP.get(uri)
     @sprites = JSON.parse(response)
     @form = @sprites["sprites"]["front_default"]
     @shiny_form = @sprites["sprites"]["front_shiny"]
    end

    def poke_type
     @typing = @link["types"][0]["type"]["name"]
    end
end


def poke_sprites
   url = @link["forms"][0]["url"]
   uri = URI(url) 
    response = Net::HTTP.get(uri)
    @sprites = JSON.parse(response)
   @form = @sprites["sprites"]["front_default"]
   @shiny_form = @sprites["sprites"]["front_shiny"]
end

user_number = Name.new("150")
puts user_number.num
puts user_number.find_poke_name
puts user_number.new_info
user_number.poke_sprites
puts user_number.shiny_form
puts user_number.form
puts user_number.poke_type

