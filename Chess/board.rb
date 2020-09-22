require_relative "pieces"
class Board
    attr_reader :board
    def initialize
        board = Array.new(8) {Array.new(8)}
        @board = board
        
        # place_pieces
    end

    def place_pieces
        @board[1].map! { |square| Piece.new(:pawn, :black) }
        @board[6].map! {|square| Piece.new(:pawn, :white)}
        @board[0][0] = Piece.new(:rook, :black)
        @board[0][7] = Piece.new(:rook, :black)
        @board[0][1] = Piece.new(:knight, :black)
        @board[0][6] = Piece.new(:knight, :black)
        @board[0][5] = Piece.new(:bishop, :black)
        @board[0][2] = Piece.new(:bishop, :black)
        @board[0][3] = Piece.new(:queen, :black)
        @board[0][4] = Piece.new(:king, :black)
       
        @board[7][0] = Piece.new(:rook, :white)
        @board[7][7] = Piece.new(:rook, :white)
        @board[7][1] = Piece.new(:knight, :white)
        @board[7][6] = Piece.new(:knight, :white)
        @board[7][5] = Piece.new(:bishop, :white)
        @board[7][2] = Piece.new(:bishop, :white)
        @board[7][3] = Piece.new(:queen, :white)
        @board[7][4] = Piece.new(:king, :white)
    end
    
    def place_positions
        @board[0].each_with_index { |piece, ind| piece.pos = [0, ind] }  
        @board[1].each_with_index { |piece, ind| piece.pos = [1, ind] }  
        @board[6].each_with_index { |piece, ind| piece.pos = [6, ind] }  
        @board[7].each_with_index { |piece, ind| piece.pos = [7, ind] } 
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @board[row][col] = piece
    end

    def valid_pos?(pos)
       pos.all? {|coordinate| coordinate.between?(0,7) }
    end

    def move_piece(start_pos, end_pos)
        if !self[start_pos].nil? && valid_pos?(end_pos)
            piece = self[start_pos]
            self[end_pos] = piece
            self[end_pos].pos = end_pos
            self[start_pos] = nil
        end 
    end

    def horizontal_moves(pos)
        moves = []
        row, col = pos
        (col+1..7).each do |idx| 
            break if @board[row][idx] != nil
            moves << [row, idx] 
        end   
        (0...col).each do |i| 
            break if @board[row][i] != nil
            moves << [row, i]
        end             
        moves
    end
    def vertical(pos)
        moves = []
        row, col = pos
        (row..7).each do |idx| 
            break if @board[idx][col] != nil
            moves << [idx, col] 
        end   
        (0...row).each do |i| 
            break if @board[idx][col] != nil
            moves << [idx, col]
        end             
        moves
    end
    

end

# a = Board.new #Array.new(8) {Array.new(8, [])}
# puts a.board
