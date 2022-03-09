require_relative "board.rb"
require_relative "tile.rb"
class Game
    def initialize
        @board = Board.new(Board.from_file("sudoku1.txt"))
    end

    def play
        while !@board.solved?
            @board.render
            posval =prompt
            @board.update([posval[0],posval[1]], posval[2])
        end
    end

    def prompt 
        p "pick coordinates and value like 2 3 4"
        response = gets.chomp.split(" ").map(&:to_i)
    end

end

game = Game.new
game.play 