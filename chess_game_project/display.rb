require "colorize"
require_relative "board"
require_relative "cursor"

class Display
    attr_reader :board, :cursor

    def initialize
        @board = Board.filled_board
        @cursor = Cursor.new([0,0],board)
    end

    def render
        puts ("  " + (0..7).to_a.join(" ")+ "   ").colorize( :background => :red)

        (0..7).each do |row|
            print (" " + row.to_s).colorize(:background => :red)
            (0..7).each do |col|
                background = (row+col).even? ? :light_red : :light_black
                background = nil if cursor.cursor_pos == [row, col]
                background ||= cursor.selected ? :blue : :light_green
                piece = board[[row,col]]
                print " ".colorize(:background => background)
                unless piece.is_a?(NullPiece)
                    print piece.symbol.to_s.colorize(:color => piece.color.to_sym, :background => background )
                else
                    print " ".colorize(:background => background)
                end
            end
            puts "  ".colorize(:background => :red)
        end
        print " ".colorize(:background => :red) * 20
    end

    # def test_render
    #     loop do 
    #         system("clear")
    #         self.render
    #         cursor.get_input
    #     end
    # end


end