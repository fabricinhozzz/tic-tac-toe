
class Game
    @@turn_count = 1
    @@winner = ''

    def initialize
        print 'Player 1 - coloque seu nome: '
        @player_one_name = gets.chomp
        print 'Player 2 - coloque seu nome: '
        @player_two_name = gets.chomp

        @board = Array.new(3) { Array.new(3, '_') }
    end

    def display_board(board)
        puts "#{board[0][0]} | #{board[0][1]} | #{board[0][2]}"
        puts "#{board[1][0]} | #{board[1][1]} | #{board[1][2]}"
        puts "#{board[2][0]} | #{board[2][1]} | #{board[2][2]}"
    end

    def player_turn(turn)
        if turn.odd?
            player_choice(@player_one_name, 'O')
        else
            player_choice(@player_two_name, 'X')
        end        
    end

    def player_choice(player, symbol)
        puts "\r\n"
        puts "#{player}, digite suas coordenadas!"
        input = gets.chomp
        puts "\r\n"

        input_array = input.split
        coord_one = input_array[0].to_i
        coord_two = input_array[1].to_i

        until input.match(/\s/) && coord_one.between?(0, 2) && coord_two.between?(0, 2) && @board[coord_one][coord_two] == '_'
            puts 'Digite coordenadas válidas pros espaços vazios!'
            input = gets.chomp
            puts "\r\n"

            input_array = input.split
            coord_one = input_array[0].to_i
            coord_two = input_array[1].to_i
        end

        add_to_board(coord_one, coord_two, symbol)
    end

    def add_to_board(coord_one, coord_two, symbol)
        @board[coord_one][coord_two] = symbol
        @@turn_count += 1
    end

    def three_across
        @board.each do |i|
            if i.all? { |j| j == 'X' }
                @@winner = 'X'
                @@turn_count = 10
            elsif i.all? { |j| j == 'O' }
                @@winner = 'O'
                @@turn_count = 10
            else
                nil
            end
        end
    end

    def three_down
        flat = @board.flatten

        flat.each_with_index do |v, i|
            if v == 'X' && flat[i + 3] == 'X' && flat[i + 6] == 'X'
                @@winner = 'X'
                @@turn_count = 10
            elsif v == 'O' && flat[i + 3] == 'O' && flat[i + 6] == 'O'
                @@winner = 'O'
                @@turn_count = 10
            else
                nil
            end
        end
    end

    def three_diagonal
        center_val = @board[1][1]

        if center_val == 'X' || center_val == 'O'

          if @board[0][0] && @board[2][2] == center_val
            @@winner = center_val
            @@turn_count = 10
          elsif @board[2][0] && @board[0][2] == center_val
            @@winner = center_val
            @@turn_count = 10
          end

        else
          nil
        end
    end

    def declare_result(symbol)
        case symbol
        when 'O'
            puts 'Parabéns!!'
            puts "#{@player_one_name} ganhou o jogo!"
        when 'X'
            puts 'Parabéns!!'
            puts "#{@player_two_name} ganhou o jogo!"
        else
            puts "Deu empate!"
        end
    end

    def play_name
        puts "\r\n"
        puts 'Joguem!'
        puts "\r\n"

        display_board(@board)
        puts "\r\n"
    
        until @@turn_count >= 10 do
            player_turn(@@turn_count)
            three_across
            three_down
            three_diagonal
            display_board(@board)
        end
    
        puts "\r\n"
        declare_result(@@winner)
    end
end
