class Board
    
    def initialize
        @board = [
        "","","",
        "","","",
        "","",""
        ]
        @winner = false
        @game_over_status = false
        @whose_turn = "no one"
        @counter = 0
    end
    
    def board_play(z, position)
        if z == "X" || z == "O" || z == "x" || z == "o" and @board[position] == ""
            
            @board[position] = z
            
        else
            puts "Invalid move"
            @counter -= 1
        end
    end
    
    def display_board
        p @board[0..2]
        p @board[3..5]
        p @board[6..8]
    end
    
    def check_if_winner
        wins = [
          [0, 1, 2], [3, 4, 5], [6, 7, 8],  # <-- Horizontal wins
          [0, 3, 6], [1, 4, 7], [2, 5, 8],  # <-- Vertical wins
          [0, 4, 8], [2, 4, 6],             # <-- Diagonal wins
        ]

        #check winner
        
        if (@board[0]+@board[1]+@board[2] == "xxx") ||
        (@board[3]+@board[4]+@board[5] == "xxx") ||
        (@board[6]+@board[7]+@board[8] == "xxx") ||
        (@board[0]+@board[3]+@board[6] == "xxx") ||
        (@board[1]+@board[4]+@board[7] == "xxx") ||
        (@board[2]+@board[5]+@board[8] == "xxx") ||
        (@board[0]+@board[4]+@board[8] == "xxx") ||
        (@board[2]+@board[4]+@board[6] == "xxx")
            @winner = true
            @game_over_status = true
            @whose_turn = "x"
        elsif (@board[0]+@board[1]+@board[2] == "ooo") ||
        (@board[3]+@board[4]+@board[5] == "ooo") ||
        (@board[6]+@board[7]+@board[8] == "ooo") ||
        (@board[0]+@board[3]+@board[6] == "ooo") ||
        (@board[1]+@board[4]+@board[7] == "ooo") ||
        (@board[2]+@board[5]+@board[8] == "ooo") ||
        (@board[0]+@board[4]+@board[8] == "ooo") ||
        (@board[2]+@board[4]+@board[6] == "ooo")
            @winner = true
            @game_over_status = true
            @whose_turn = "o"
        elsif (@board[0] and @board[1] and @board[2] and @board[3] and @board[4] and @board[5] and @board[6] and @board[7] and @board[8] != "") && @winner == false
            @game_over_status = true
            
        end
                
    end
    
    def game_over
        if @winner && @game_over_status
            puts "#{@whose_turn.upcase} is the winner!"
        elsif @game_over_status
            puts "It's a tie!"
            
        else
            return 1
        end

    end
    
    def turn
        
        if @counter % 2 == 0
            @whose_turn = "x"
            @counter += 1
            return "x"
        else
            @whose_turn = "o"
            @counter += 1
            return "o"
        end
        
    end
    
end
    

board = Board.new()

puts "Starting new game of tic tac toe..."

while board.game_over do 
    
    turn = board.turn
    puts "Its #{turn.upcase}'s turn"
    z = turn
    
    puts "Which position would you like to play"
    puts "0. Top Left      1. Top Center      2.Top Right"
    puts "3. Middle Left   4. Center          5. Middle Right"
    puts "6. Bottom Left   7. Bottom Center   8. Bottom RIght"
    pos = gets.chomp.to_i
    
    board.board_play(z,pos)
    board.display_board
    board.check_if_winner
    
    #check_if_winner()
end



