require_relative "null_piece.rb"

module Stepable

    def moves
        directions = move_diffs
        
        steps = directions.map do |move|
            curr_row, curr_col = self.position
            new_row = move[0] + curr_row
            new_col = move[1] + curr_col
            [new_row,new_col]
        end

        steps.select do |step|
            valid_move?(step) && ( step[0].between?(0,7) && step[1].between?(0,7) )
        end
        
    end

    def valid_move?(pos)
        return true if board[pos].is_a?(NullPiece)
        if board[pos].color == self.color
            return false
        else
            return nil
        end
    end

   

    
end