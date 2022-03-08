require_relative('board.rb')
require_relative('card.rb')

class Game

    def initialize(n)
        @board = Board.new(n)
        @board.populate
        @previous_guess = -1
    end

    def play
        while !@board.won?
            system("clear")
            @board.render
            pos = prompt
            make_guess(pos)
        end
        @board.render 
        p "you won!"
    end

    def prompt
        p "Please write a coordinate like 2 3"
        response = gets.chomp.split(" ")
        response = response.map(&:to_i)
    end

    def make_guess(pos)
        card = @board.reveal(pos)
        if card == nil
            return
        end

        if @previous_guess == -1
            @previous_guess = card
        elsif @previous_guess.val != card.val
            @board.render
            sleep(3)
            @previous_guess.hide
            card.hide
            @previous_guess = -1
        else 
            @previous_guess = -1
        end
    end

end

p 'something'
game = Game.new(2) 
game.play 