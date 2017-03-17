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
   @user_pokemon.find_poke_name
   @user_pokemon.new_info
   @user_pokemon.poke_sprites
   @user_pokemon.shiny_form
   @user_pokemon.form
   @user_pokemon.poke_type
   @user_pokemon.typing
   @user_pokemon.poke_height
   @user_pokemon.poke_weight

    erb :result
   end
end
