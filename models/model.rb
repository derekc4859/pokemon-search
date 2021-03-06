
#http://pokeapi.co/api/v2/pokemon/

#Without requiring these, there would be no application because they wouldn't know where to go
require 'net/http'
require 'json'
require 'pp'


class Name
    

    attr_accessor :num , :form , :shiny_form , :print_name , :typing, :height, :weight
    
    def initialize(num)
        @num = num.to_i
    end
    
    def find_poke_name  #Finds the name of the pokemon associated with users input number
      number = @num
      if number > 0 #If number > 0 it will subtract 1 because since its in an array it starts from 0
        number -= 1
      elsif number <= 0
          number = number + 1
      end
      #Below searches API for correct pokemon
      @real_num = number
      url = 'http://pokeapi.co/api/v2/pokemon/?limit=150' #change ending to match pages with corresponding pokemon ID
      uri = URI(url)
      response = Net::HTTP.get(uri)
      @result = JSON.parse(response)
      @print_name = @result["results"][@real_num]["name"]
    end

    def new_info
        #looks up the 2 forms of the pokemon, shiny and regular
     url = @result["results"][@real_num]["url"]
     uri = URI(url) 
     response = Net::HTTP.get(uri)
     @link = JSON.parse(response)
     @link["forms"][0]["url"]
    end

    def poke_sprites
        #Grabs Sprites for shiny and non-shiny pokemon
     url = @link["forms"][0]["url"]
     uri = URI(url) 
     response = Net::HTTP.get(uri)
     @sprites = JSON.parse(response)
     @form = @sprites["sprites"]["front_default"]   #Gets normal form
     @shiny_form = @sprites["sprites"]["front_shiny"]   #Gets shiny form
    end

    def poke_type
        #Grabs the pokemon's type by going through the APL link of a specific pokemon
     @typing = @link["types"][0]["type"]["name"]
    end


    def poke_height #this should be here
    @height= @link["height"]    #grabs the height from the API link
    end

    def poke_weight
    @weight= @link["weight"]    #grabs the weight from the API link
    end
    
end





#   user_number = Name.new("1")
#   puts user_number.num
#   puts user_number.find_poke_name
#   puts user_number.new_info
#   user_number.poke_sprites
#   puts user_number.shiny_form
#   puts user_number.form
# puts user_number.poke_height

