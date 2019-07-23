class Game

  attr_accessor :human_player, :enemies, :player1, :player2, :player3, :player4

# ----------------

  def initialize(name)
  	# initialisation des joueurs
    puts "","Choisis un nom de joueur"
    name = gets.chomp

	@human_player = HumanPlayer.new(name)

	player1 = Player.new("Josiane")
	player2 = Player.new("José")
	player3 = Player.new("Adrien")
	player4 = Player.new("Lucie")

	@enemies_array = [player1, player2, player3, player4]

	return @enemies_array

  end # fin méthode initialize

# ----------------

  def menu_choice
    # ask for human_player decision
    puts "","-----",""
    puts "Il te reste #{human_player.life_points} points de vie, quelle action veux-tu effectuer ?"
    puts "","a - chercher une meilleure arme","s - chercher à se soigner"
    puts "", "attaquer un joueur en vue :"
    # on boucle sur le tableau @enemies pour que le menu d'adapte à l'initialisation (nombre de joueurs et noms)
    @enemies_array.each {|enemies| puts "#{@enemies_array.index(enemies)} - #{enemies.name} a #{enemies.life_points} points de vie"}


    human_player_decision = gets.chomp
    puts ""
 
	if human_player_decision == "a"
	  human_player.search_weapon
	  gets.chomp
	elsif human_player_decision == "s"
	  human_player.search_health_pack
	  gets.chomp
	else
	  human_player.attacks(@enemies_array[human_player_decision.to_i])
	  # si l'enemi n'a plus de point, on l'enlève du tableau @enemies_array pour ne plus l'appeler dans le menu choix
	  if @enemies_array[human_player_decision.to_i].life_points < 1
	  	kill_player(@enemies_array[human_player_decision.to_i])
	  end
	  end_game
	  gets.chomp
	end

  end # fin méthode menu_choice

# ----------------

  def enemies_attack
	puts "Les autres joueurs t'attaquent !"
	# tous les joueurs attaquent human_player à tour de rôle
	@enemies_array.each {|enemies| 
		enemies.attacks(human_player)
		end_game
	}    
  end  # fin méthode enemies_attack

# ----------------

  def end_game
  # le jeu s'arrête si le human_player n'a plus de point => partie perdue
  # ou si tous les players ont été tués => partie gagnée
    if human_player.life_points < 1
  	  puts "Vous n'avez plus de point, la partie s'arrête ici. Dommage!"
  	  puts ""
  	  puts "   ------------------------  PERDU  --------------------------"
  	  puts "   ---------------------- *** FIN *** ------------------------"
  	  puts "   -----------------------------------------------------------"
  	  puts ""
      exit
    elsif @enemies_array.any? == false
      puts "Tous vos ennemis sont morts! Bravo, vous avez gagné la partie!"
  	  puts ""
  	  puts "   ------------------------  BRAVO ! -------------------------"
  	  puts "   ---------------------- *** FIN *** ------------------------"
  	  puts "   -----------------------------------------------------------"
  	  puts ""
  	  exit
    else
    end

  end # fin méthode end

# ----------------

  def is_still_ongoing?
  	(@enemies_array.any? && @human_player.life_points > 0) ? true : false
  end # fin méthode is_still_ongoing?

# ----------------

  def kill_player(player)
  	@enemies_array.delete(player)
  end # fin méthode kill_player



end #class Game