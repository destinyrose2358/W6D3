require_relative "piece.rb"
require_relative "null_piece.rb"
require_relative "queen.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "knight.rb"
require_relative "king.rb"
require_relative "pawn.rb"

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8, NullPiece.instance) }
        fill_board
    end

    def [](pos)
        row, col = pos
        rows[row][col]
    end

    def move_piece(start_pos,end_pos)
        piece = self[start_pos]

        raise "Empty start position" if piece.is_a?(NullPiece)

        raise "End position off board" unless end_pos[0].between?(0,7) && end_pos[1].between?(0,7)

        raise "Illegal move" unless piece.moves.include?(end_pos)

        self[end_pos] = piece
        piece.position = end_pos
        self[start_pos] = NullPiece.instance
    end

    def in_check?(color)
        king = rows.flatten.find do |piece|
            piece.is_a?(King) && piece.color == color
        end

        opponents = rows.flatten.select { |piece| piece.color != color && !piece.color.nil?}
        opponents.any? { |piece| piece.moves.include?(king.position) }
    end

    

    private

    def []=(pos, value)
        row, col = pos
        rows[row][col] = value
    end

    def fill_board
        #places pawns
        index = -1
        rows[1] = Array.new(8) do
            index += 1
            Pawn.new([1, index], self, "white")
        end
        index = -1
        rows[6] = Array.new(8) do
            index += 1
            Pawn.new([6, index], self, "black")
        end

        # places rooks
        rows[7][0], rows[7][7] = Rook.new([7, 0], self, "black"), Rook.new([7, 7], self, "black")
        rows[0][0], rows[0][7] = Rook.new([0, 0], self, "white"), Rook.new([0, 7], self, "white")

        # places knights
        rows[0][1], rows[0][6] = Knight.new([0, 1], self, "white"), Knight.new([0, 6], self, "white")
        rows[7][1], rows[7][6] = Knight.new([7, 1], self, "black"), Knight.new([7, 6], self, "black")

        # place_bishops
        rows[0][2], rows[0][5] = Bishop.new([0, 2], self, "white"), Bishop.new([0, 5], self, "white")
        rows[7][2], rows[7][5] = Bishop.new([7, 2], self, "black"), Bishop.new([7, 5], self, "black")

        # place_queens
        rows[0][3], rows[7][3] = Queen.new([0, 3], self, "white"), Queen.new([7, 3], self, "black")

        #place_kings
        rows[0][4], rows[7][4] = King.new([0, 4], self, "white"), King.new([7, 4], self, "black")
    end


end