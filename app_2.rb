require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Display welcome message

puts "-----------***---------------------***---------------"
puts "-----------------------------------------------------"
puts "|     Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
puts "|  Le but du jeu est d'être le dernier survivant !  |"
puts "-----------------------------------------------------"
puts "------------------**************---------------------"

# initialisation joueurs
puts "","Choisis ton nom de joueur"
name = gets.chomp

hplayer = HumanPlayer.new(name)

Josiane = Player.new("Josiane")
José = Player.new("José")

enemies_array = [Josiane, José]

# play combat
while (Josiane.life_points > 0 || José.life_points > 0) && hplayer.life_points > 0
  # display hplayer state
  puts hplayer.show_state

  # ask for hplayer decision
  puts "","-----",""
  puts "Il te reste #{hplayer.life_points} points de vie, quelle action veux-tu effectuer ?"
  puts "","a - chercher une meilleure arme","s - chercher à se soigner"
  puts "", "attaquer un joueur en vue :"
  puts "","0 - Josiane a #{Josiane.life_points} points de vie","1 - José a #{José.life_points} points de vie"

  hplayer_decision = gets.chomp
  puts ""
  gets.chomp

  if hplayer_decision == "a"
    hplayer.search_weapon
    gets.chomp
  elsif hplayer_decision == "s"
  	hplayer.search_health_pack
  	gets.chomp
  elsif hplayer_decision == "0"
    hplayer.attacks(Josiane)
    gets.chomp
  elsif hplayer_decision == "1"
     hplayer.attacks(José)
     gets.chomp
  end

  puts "","-----",""
  # si l'ensemble des joueurs n'ont plus de point la partie est gagnée, sinon les joueurs restant attaquent
  if enemies_array.all? {|enemies| enemies.life_points < 1} == true
  	puts "Fin de partie, bravo, tu as gagné"
  	break
  else
	puts "Les autres joueurs t'attaquent !"
	enemies_array.each {|enemies|
		# chaque joueur ayant des points de vie attaque le HumanPlayer
		if enemies.life_points > 0
		  puts ""
		  enemies.attacks(hplayer)
		end
		# si le HumanPlayer n'a plus de points de vie on arrête la partie
		if hplayer.life_points <= 0
		  puts "Fin de partie, ton joueur #{hplayer.name} a été tué"
		  break
		end
	}
  end

  gets.chomp
end


binding.pry