class Piece

    attr_reader :color, :symbol, :board
    attr_accessor :position

    def initialize(position, board, color, symbol)
        @position = position
        @board = board
        @color = color
        @symbol = symbol
    end


end