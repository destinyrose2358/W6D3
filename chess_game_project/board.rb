require_relative "piece.rb"
require_relative "null_piece.rb"
require_relative "queen.rb"

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8, NullPiece.instance) }
        #fill_board
    end

    def [](pos)
        row, col = pos
        rows[row][col]
    end

    def move_piece(start_pos,end_pos)
        piece = self[start_pos]

        raise "Empty start position" if piece.nil?

        raise "End position off board" unless end_pos[0].between?(0,7) && end_pos[1].between?(0,7)

        raise "Illegal move" unless piece.moves.include?(end_pos)

        self[end_pos] = piece
        piece.position = end_pos
        self[start_pos] = NullPiece.instance
    end

    def []=(pos, value) # put this back in private!!!
        row, col = pos
        rows[row][col] = value
    end

    private

    

    def fill_board
        # places pawns
        rows[1] = Array.new(8) { Piece.new }
        rows[6] = Array.new(8) { Piece.new }

        # places rooks
        rows[0][0], rows[0][7] = Piece.new, Piece.new
        rows[7][0], rows[7][7] = Piece.new, Piece.new

        # places knights
        rows[0][1], rows[0][6] = Piece.new, Piece.new
        rows[7][1], rows[7][6] = Piece.new, Piece.new

        # place_bishops
        rows[0][2], rows[0][5] = Piece.new, Piece.new
        rows[7][2], rows[7][5] = Piece.new, Piece.new

        # place_queens
        rows[0][3], rows[7][3] = Piece.new, Piece.new

        #place_kings
        rows[0][4], rows[7][4] = Piece.new, Piece.new
    end


end