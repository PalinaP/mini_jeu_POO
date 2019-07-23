class Player

  attr_accessor :name, :life_points

# ----------------

  def initialize (name)
  	@life_points = 10
  	@name = name
  end

# ----------------

  def show_state
  	if @life_points > 0
  	  puts "#{@name} a #{@life_points} points de vie"
  	else 
  	  puts "#{@name} est mort"
  	end
  end

# ----------------

  def gets_damage(damage_points)
  	@life_points = @life_points - damage_points
  	if @life_points < 1
  	  puts "Le joueur #{@name} a été tué"
    end
  end

# ----------------

  def attacks(player_x)
  	puts "#{@name} attaque le joueur #{player_x.name}"
    damage_points = compute_damage
    puts "Il lui inflige #{damage_points} points de dommages"
    player_x.gets_damage(damage_points)
  end

# ----------------

  def compute_damage
    return rand(1..6)
  end

# ----------------

end

# -----------------------------------------
# -----------------------------------------
# --- ** CLASSE FILLE ** ------------------
# -----------------------------------------

class HumanPlayer < Player

  attr_accessor :weapon_level

# ----------------

  def initialize (name)
  	super(name)
  	@life_points = 100
  	@weapon_level = 1  	
  end

# ----------------

  def show_state
  	puts "#{@name} a #{@life_points} points de vie et a une arme de niveau #{@weapon_level}"
  end

# ----------------

  def search_weapon
  	@weapon_level_new = rand(1..6)
  	puts "Tu as trouvé une arme de niveau #{@weapon_level_new}"
  	if @weapon_level_new > @weapon_level
  		@weapon_level = @weapon_level_new
  		puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
  	else
  		puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

# ----------------

  def compute_damage
    rand(1..6) * @weapon_level
  end

# ----------------

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1 # => +0 points
      puts "Tu n'as rien trouvé... "
    elsif health_pack == 6 # => +80 points
      @life_points = @life_points + 80
      if @life_points > 100
      	@life_points = 100
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    else # 2, 3, 4, 5 => +50 points
      @life_points = @life_points + 50
      if @life_points > 100
      	@life_points = 100
      end
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    end
  end

# ----------------


end