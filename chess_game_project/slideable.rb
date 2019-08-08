module Slideable

    DIRECTIONS = { diagonal: [[1, -1], [-1, 1]],
                    horizontal: [[0], [-1, 1]],
                    vertical: [[-1, 1], [0]] }

# [ [[-1,1], [-1,1]], [[-1,1], [0]], [[0], [-1,1]] ]
    def moves
        allowed_directions = move_dir
        move_offsets = allowed_directions.map { |direction| DIRECTIONS[direction] }
        valid_moves = []


        move_offsets.each do |offsets|
            offsets[0].each do |row_offset|
                offsets[1].each do |col_offset|
                    step = 1
                    row, col = self.position
                    while (row + step * row_offset).between?(0,7) && (col + step * col_offset).between?(0,7)
                        test_pos = [row +step * row_offset, col + step * col_offset]
                        outcome = valid_move?(test_pos)
                        if outcome.nil?
                            valid_moves << test_pos
                            break
                        elsif outcome
                            valid_move << test_pos
                        else
                            break
                        end
                        step += 1
                    end
                end
            end
        end
        valid_moves
    end

    def valid_move?(pos)
        return true if board[pos].is_a?(Null_Piece)
        if board[pos].color == self.color
            return false
        else
            return nil
        end
    end


end