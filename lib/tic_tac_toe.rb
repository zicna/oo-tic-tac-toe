require 'pry'

class TicTacToe

    def initialize
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "------------------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "------------------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input = input.to_i
        #*******************************************************************
        #1. shold we set index as a instance variable or method variable?
        index = input - 1
    end
    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == " " || @board[index] == nil ? false : true
    end

    def valid_move?(index)
        index.between?(0, 8) && !position_taken?(index) ? true : false
    end
#can we do this in fewer line of code???
    def turn_count
        @count = 0
        @board.each do |poss|
            if poss != " "
                @count += 1
            end
        end
        @count
    end

    def current_player
        turn_count
        @count == 0 || @count.even? ? "X" : "O"
    end
    #*******************************************************************
    #2. best way to call other instance method?
    def turn
        puts "Please choose a number 1-9:"
        input = gets.chomp
        #binding.pry
        index = input_to_index(input)
        if valid_move?(index)
            #*******************************************************************
            #3. can this be done with just calling current_player as argument?
            token = current_player
            move(index, token)
            display_board
        else
            turn
        end
    end

    def won?
        x_combinations = []
        o_combinations = []
        @final = []
        @board.each.with_index do |token, index|
            if token == "X"
                x_combinations << index
            elsif token == "O"
                o_combinations << index
            end
        end
        
        WIN_COMBINATIONS.each do |comb|
            #binding.pry
            if comb.all? {|item| o_combinations.include?(item)}
                @final = comb
                #4. why is this break making this to pass or why is this "break" necessary
                break
            elsif comb.all? {|item| x_combinations.include?(item)}
                @final = comb
                break
            else
                @final = false
            end
        end
        @final
    end

    def full?
        turn_count == 9 ? true : false
    end

    def draw?
        full? && won? == false ? true : false
    end

    def over? 
        won? || full? ? true : false
    end
    #option 1. won? method return a instance variable (I changed final => @final in won? method) and then operate on them
    def winner
        winner_token = ""
        if won?
            if @final.all? {|index| @board[index] == "X"}
                winner_token = "X"
            else
                winner_token = "O"
            end
        else
            winner_token = nil
        end
        winner_token
    end
    
    def play
        until over? == true
            turn
        end
            
        if won? 
            puts "Congratulations #{winner}!"
        elsif draw? 
            puts "Cat's Game!"
        end
    
    end


end