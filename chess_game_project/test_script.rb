require_relative "display.rb"

# board = Board.new
# # board[[0, 0]] = Queen.new([0,0], board, "black")
# # board[[2, 0]] = Queen.new([2,0], board, "black")
# # board[[0, 5]] = Queen.new([0,5], board, "white")
# puts board
# p board[[0,0]].moves

# puts
# # board.move_piece([0,0], [1,1])
# puts

# p board[[1,1]].moves
# a:0  , b:2  , c:3 , d:4 , e:5, f:6, g:7



a = Display.new

a.board.move_piece([6,5],[5,5])
a.board.move_piece([6,6],[4,6])
a.board.move_piece([1,4],[3,4])
a.board.move_piece([0,3],[4,7])

a.render

puts a.board.in_check?("black")
puts a.board.checkmate?("black")





