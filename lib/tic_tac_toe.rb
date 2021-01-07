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
        @index = input - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == " " ? false : true
    end

    def valid_move?(index)
        index.between?(0, 8) && @board[index] == " " ? true : false
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

    def turn
        ##input_to_index, #valid_move?, and #current_player"
        puts "please choose your move."
        input = gets.chomp
        input_to_index(input)
    end

end