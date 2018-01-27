class Game
	attr_accessor :arr, :player_1, :player_2, :current_player
	def initialize(player_1)
		@arr = Array.new(9, " ")
	    @player_1 = player_1
	    @player_2 = "O"
	    @current_player = player_1
   	end

   	def start
   		puts 
   		puts "Player #{@current_player} enter your value (1..9) :"
   		value = gets.chomp.to_i-1
   		puts "---------"
   		@arr[value] = @current_player
   		screen
   	end

   	def current_player
   	    @current_player === player_1 ? @current_player = player_2 : @current_player = player_1
   		start
   	end
   	
   	def screen
	 	print @arr[0] + " | ", @arr[1] + " | ", @arr[2]
	 	puts " "
	 	print @arr[3] + " | ", @arr[4] + " | ", @arr[5]
	 	puts " "
	 	print @arr[6] + " | ", @arr[7] + " | ", @arr[8]
	 	puts " "
	 	puts "---------"
	 	winning_combos
   	end

   	def winning_combos
   		board_winner = false

       	if (((@arr[0] == "X" && @arr[1] == "X" && @arr[2] == "X") ||
       		 (@arr[3] == "X" && @arr[4] == "X" && @arr[5] == "X") ||
       		 (@arr[6] == "X" && @arr[7] == "X" && @arr[8] == "X") ||
       		 (@arr[0] == "X" && @arr[3] == "X" && @arr[6] == "X") ||
       		 (@arr[1] == "X" && @arr[4] == "X" && @arr[7] == "X") ||
       		 (@arr[2] == "X" && @arr[5] == "X" && @arr[8] == "X") ||
       		 (@arr[0] == "X" && @arr[4] == "X" && @arr[8] == "X") ||
       		 (@arr[2] == "X" && @arr[4] == "X" && @arr[6] == "X")
       	    ) ||
       	   ( (@arr[0] == "O" && @arr[1] == "O" && @arr[2] == "O") ||
       		 (@arr[3] == "O" && @arr[4] == "O" && @arr[5] == "O") ||
       		 (@arr[6] == "O" && @arr[7] == "O" && @arr[8] == "O") ||
       		 (@arr[0] == "O" && @arr[3] == "O" && @arr[6] == "O") ||
       		 (@arr[1] == "O" && @arr[4] == "O" && @arr[7] == "O") ||
       		 (@arr[2] == "O" && @arr[5] == "O" && @arr[8] == "O") ||
       		 (@arr[0] == "O" && @arr[4] == "O" && @arr[8] == "O") ||
       		 (@arr[2] == "O" && @arr[4] == "O" && @arr[6] == "O")
       	    ))

       	    board_winner = true
        	if board_winner == true
	   			puts "#{@current_player} just win !"
	   			exit
	   		else
	   			puts "Seems we have a bug !"
	   			# just in case
	   		end		
        end

       	check_if_draw
    end

    def check_if_draw
    	board_full = true
   		@arr.each { |value| if value == " "; board_full = false; end }
	   		
	   		if board_full == true
	   			print "Draw, bitches !"
	   			exit
	   		else 
	 		current_player
	 		end		
   	end
end 

Game.new("X").start

# Début v2