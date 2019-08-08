class Piece

    attr_reader :color, :symbol, :board
    attr_accessor :position

    def initialize(position, board, color, symbol)
        @position = position
        @board = board
        @color = color
        @symbol = symbol
    end

    def inspect 
        return self.color, self.symbol
    end

    def legal_moves
        potential_moves = self.moves
        
        potential = potential_moves.reject do |move|
            test_board = board.dup
            test_board.move_piece!(self.position, move)
            test_board.in_check?(self.color)
        end
        p self
        p potential
        potential
    end


end