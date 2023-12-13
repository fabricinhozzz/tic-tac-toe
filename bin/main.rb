
require_relative '../lib/game'

puts 'Bem vindo(a) ao tic-tac-toe, mais conhecido como jogo da velha!'
puts 'As regras são as mesmas, mas pra escolher o lugar, você deve colocar coordenadas.'
puts 'A cada rodada, coloque dois números, com um espaço entre eles, seguindo o layout abaixo:'

puts "\r\n"
puts '0 0 | 0 1 | 0 2'
puts '1 0 | 1 1 | 1 2'
puts '2 0 | 2 1 | 2 2'
puts "\r\n"

game = Game.new
game.play_name
