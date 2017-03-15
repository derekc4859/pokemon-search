require 'dotenv/load'
require 'bundler'
require 'json'

Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
 post '/result' do
   user_number = params[:user_num]
   @user_pokemon = Name.new(user_number)
   @user_pokemon.find_poke_name
   @user_pokemon.new_info
   @user_pokemon.poke_sprites
   @user_pokemon.shiny_form
   @user_pokemon.form
   
    erb :result
   end
end
