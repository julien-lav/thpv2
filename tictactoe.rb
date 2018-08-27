class Game
  attr_accessor :arr, :player_1, :player_2
	def initialize(player_1)
		  @arr = Array.new(9, " ")
	    @player_1 = player_1
	    @player_2 = "O"
	    @current_player = player_1
   	end

   	def start
   		puts "Player #{@current_player} enter your value (1..9) :"
   		value = gets.chomp.to_i-1
   		if ((value < 0 || value > 8) || (@arr[value] != " ")) 
       puts @arr[value]
       start
      else    
       puts "---------"
   		 @arr[value] = @current_player
   		 screen
      end
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

		 if (
		    (@arr[0] == @arr[1] == @arr[2]) ||
		    (@arr[3] == @arr[4] == @arr[5]) ||
		    (@arr[6] == @arr[7] == @arr[8]) ||
		    (@arr[0] == @arr[3] == @arr[6]) ||
		    (@arr[1] == @arr[4] == @arr[7]) ||
		    (@arr[2] == @arr[5] == @arr[8]) ||
		    (@arr[0] == @arr[4] == @arr[8]) ||
		    (@arr[2] == @arr[4] == @arr[6])      	    
		  )
		     board_winner = true
			if board_winner == true
					puts "#{@current_player} just win !"
					exit
	   		else
	   			puts "Looks like we have a bug !"
	   			# just in case for debbug
	   		end		
		 end
       		check_if_draw
	    end

	    def check_if_draw
		board_full = true
			@arr.each { |value| if value == " "; board_full = false; end }

				if board_full == true
					print "Draw, bitches ! \n"
					exit
				else 
				current_player
				end		
   	end
end 

Game.new("X").start

# Début v2
