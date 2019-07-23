require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# ----------------

# Display welcome message
puts "      -----------***---------------------***-----------"
puts "     ---------------------------------------------------"
puts "    |     Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
puts "    |  Le but du jeu est d'être le dernier survivant !  |"
puts "     ---------------------------------------------------"
puts "      ------------------**************-----------------"


# initialisation du jeu
my_game = Game.new("Alex")

# attaques jusqu'à fin du jeu (gagné/perdu)
while my_game.is_still_ongoing?
	my_game.menu_choice
	my_game.enemies_attack
end

binding.pry