require 'poke-api'

loader = Poke::API::Loader.new("pokemon")
loader.all
# => [{ "name" => "Bulbasaur", "national_id" => 1, ... }, ...]
loader.find(169)
# => { "name" => "Crobat", "national_id" => 169, ... }