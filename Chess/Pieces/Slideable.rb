module Slideable 
    VERTICAL_HORIZONTAL_MOVES= [ [0,1], [0,-1] [-1,0] [1,0] ]
    
    DIAGONAL_MOVES = [ [1,1] ,[1,-1], [-1,-1] ,[-1, 1] ]

    # QUEEN_MOVES = [[0,1], [0,-1] [-1,0] [1,0], [1,1] ,[1,-1], [-1,-1] ,[-1, 1] ]

    def move_dirs(moves)
        start_pos = @piece.pos
        #[3,0]
        moves.each do |(dx, dy)|
            new_pos = start_pos[0] + dx
        end
    end

    # dont move if its our color
    # dont mpove if its outside board
    # dont stop moving if its their color
    # take piece
    
      # queen.include horizontal_moves && DIAGONAL_MOVES
    def horizontal_moves(pos)
        moves = []
        row, col = pos
        (col..7).each do |idx| 
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