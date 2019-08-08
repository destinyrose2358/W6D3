require_relative "piece.rb"
require_relative "slideable.rb"


class Rook < Piece 
    include Slideable

    def initialize (position, board, color)
        super(position, board, color,:R)
        
    end

    def move_dir
        [:horizontal, :vertical]
    end


end