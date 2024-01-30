require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "___________________"
puts "|  force a toi     \\"
puts "|__________________/"

#player
player1 = Player.new("josiane")
player2 = Player.new("josué")

puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state
puts""
puts "Passons à la phase d'attaque :"


# end
  
while player1.life_points > 0 && player2.life_points > 0
    puts " voicie l'état de chaque joueur :"
    print player1.show_state
    print player2.show_state
    puts " "

    puts "passon à la phase d'attaque :"
    player1.attacks(player2)
    player2.attacks(player1)
    puts " "
    break if player2.life_points <= 0 ||  break if player1.life_points <= 0


end
binding.pry