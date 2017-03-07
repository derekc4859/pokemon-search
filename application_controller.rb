require 'dotenv/load'
require 'bundler'
require 'poke-api'

Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb:index
  end
  
end
