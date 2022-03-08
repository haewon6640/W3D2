require_relative "card.rb"

class Board 

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n)}
        @size = n 
    end

    # def [](pos)
    #     @grid[pos[0]][pos[1]]
    # end

    
    def populate
        al = ("a".."z").to_a
        cards = al[0...@size**2/2] 
        
        positions = Array.new()
        
        (0...@size).each do |row|
            (0...@size).each do |col|
                positions << [row,col]
            end
        end
        i = 0
        while positions.length > 0
            sample1, sample2 = positions.sample(2)
            positions.delete(sample1)
            positions.delete(sample2)
            @grid[sample1[0]][sample1[1]] = Card.new(cards[i], false)
            @grid[sample2[0]][sample2[1]] = Card.new(cards[i], false)
            i+=1
        end
    end

    def render
        result = "  "
        (0...@size).each do |i|
            result << "#{i.to_s} "
        end
        result << "\n"

        i = 0
        @grid.each do |row|
            rowStr = "#{i} "
            row.each do |card|
                
                if card.val == nil
                    rowStr += "  "
                else 
                    rowStr += card.val.to_s + " "
                end
            end
            result << rowStr + "\n"
            i+=1
        end
        puts result
    end

    def won? 
        @grid.all? do |row|
            row.all? do |card|
                card.faceup
            end
        end
    end

    def reveal(pos)
        if !@grid[pos[0]][pos[1]].faceup 
            @grid[pos[0]][pos[1]].reveal
            return @grid[pos[0]][pos[1]]
        end
    end

end