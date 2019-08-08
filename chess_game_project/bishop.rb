require_relative "piece.rb"
require_relative "slideable.rb"


class Bishop < Piece 
    include Slideable

    def initialize (position, board, color)
        super(position, board, color,:B)
        
    end

    def move_dir
        [:diagonal]
    end


end