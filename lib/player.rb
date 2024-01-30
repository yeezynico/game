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
    end
end

    