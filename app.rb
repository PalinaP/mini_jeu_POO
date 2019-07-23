require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

Josiane = Player.new("Josiane")
José = Player.new("José")

puts "Voici l'état de chaque joueur :"
Josiane.show_state
José.show_state

puts "", "Passons à la phase d'attaque :", ""

while Josiane.life_points > 0 && José.life_points > 0
 
  Josiane.attacks(José)
  puts "--"
  if José.life_points > 0
    José.attacks(Josiane)
   puts "--"
  else break
  end

end

binding.pry


