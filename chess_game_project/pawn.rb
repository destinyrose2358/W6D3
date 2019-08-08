require_relative "piece.rb"
require_relative "null_piece"

class Pawn < Piece


    def initialize (position, board, color)
        super(position, board, color, :P)
        @initial_pos = position
    end

    def moves
        #generate all forward moves/check if move has NullPiece !
        #generate all diagonals/check if diagonal move is on board and an enemy piece

        move_options = []

        move_dir = color == "white" ? 1 : -1
        if position == initial_pos 
            move_row = position[0] + move_dir * 2
            move_col = position[1]
            move_options << [move_row,move_col] if board[[move_row,move_col]].is_a?(NullPiece)
        end
        move_row = position[0] + move_dir
        move_col = position[1]
        move_options << [move_row,move_col]

        move_options.select { |possible_move| board[possible_move].is_a?(NullPiece) }

        
        diagonal_options = [[move_row, move_col + 1], [move_row, move_col - 1]]

        move_options += diagonal_options.reject do |move|
            !(move[0].between?(0, 7) && move[1].between?(0,7)) || 
            board[move].color == self.color || board[move].color.nil?
        end

        move_options  
    end

    private
    attr_reader :initial_pos
end