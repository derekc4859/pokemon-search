require 'dotenv/load'
require 'bundler'
require 'json'

Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do        #Sends user to index.erb when they go to the link
    erb :index
  end
  #below is what is posted when they go to the result page after hitting submit
 post '/result' do
   user_number = params[:user_num]
   @user_pokemon = Name.new(user_number)
   @user_pokemon.find_poke_name #gets pokemon name
   @user_pokemon.new_info
   @user_pokemon.poke_sprites   #gets sprites in normal form
   @user_pokemon.shiny_form     #gets sprites in shiny form
   @user_pokemon.form       
   @user_pokemon.poke_type  
   @user_pokemon.typing         #Gets the pokemons type
   @user_pokemon.poke_height    #Gets the pokemons height
   @user_pokemon.poke_weight    #Gets the pokemons weight

    erb :result #goes to result page
   end
end
