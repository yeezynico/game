require 'bundler'
Bundler.require

class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
      puts "#{@name} a #{@life_points} poits de vie"
    end

    def gets_damage(damage)
      @life_points -= damage
     # -= est la syntaxe racourcis de : @life_points = @life_points - damage qui veux dire la même chose
     # si je veux rajouter des pv je fais +=
      if @life_points <= 0 
        puts " le joueur #{name} a été tué !"
      end
    end  

    def compute_damage
        return rand(1..6)
    end

    def attacks(other_player)
      puts " #{name} attaque #{other_player.name}"
      damage = compute_damage
      other_player.gets_damage(damage)
      damage
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level
    
    def initialize(name)
        super(name) # appel au initialize de Player
        @weapon_level = 1 
        @life_points = 100
    end

    def show_state
        puts "#{name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        dice_result  = rand(1..6)
        puts " Tu as trouvé une arme de niveau #{dice_result}"

        if dice_result > @weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else 
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
       dice_result = rand(1..6)

       if dice_result == 1 
          puts "Tu n'as rien trouvé... "
       elsif dice_result >= 2 && dice_result <= 5
          @life_points = @life_points + 50 #ajout 50 points de vie sans que la totale dépasse 100
          @life_points = 100 if @life_points > 100 
          puts  "Bravo, tu as trouvé un pack de +50 points de vie !"
       elsif dice_result == 6
          @life_points =  @life_points + 80 #ajout 80 points de vie sans que la totale dépasse 100
          @life_points = 100 if @life_points > 100
          puts "Waow, tu as trouvé un pack de +80 points de vie !"
       end
    end

end
    