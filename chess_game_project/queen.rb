require_relative "piece.rb"
require_relative "slideable.rb"


class Queen < Piece 
    include Slideable

    def initialize (position, board, color)
        super(position, board, color,:Q)
        
    end

    def move_dir
        [:diagonal, :horizontal, :vertical]
    end


end