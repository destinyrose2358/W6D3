require_relative "board.rb"

board = Board.new
board[[0, 0]] = Queen.new([0,0], board, "black")
board[[2, 0]] = Queen.new([2,0], board, "black")
board[[0, 5]] = Queen.new([0,5], board, "white")