class Piece
    attr_reader :name, :color 
    attr_accessor :pos
    def initialize(name, color)
        @name = name
        @color = color
        @pos = nil
    end

end
