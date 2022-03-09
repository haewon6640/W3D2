require_relative 'tile.rb'
require "set"
class Board

    def self.from_file(file)
        array = Array.new() 
        File.readlines(file).each do |line|
            arr = line.chomp.split("")
            arr.map! do |el| 
                Tile.new(el.to_i)
            end
            array << arr
        end  
        array
    end

    def initialize(grid)
        @board = grid
    end

    def update(pos,val)
        unless @board[pos[0]][pos[1]].given
            @board[pos[0]][pos[1]].value = val 
            @board[pos[0]][pos[1]].given = true
        else
            return nil
        end
    end


    def render
        result = ""
        @board.each do |row|
            str = "| "
            row.each do |tile|
                if tile.given
                    str += tile.value.to_s + " | "
                else
                    str += "  | " 
                end
            end
            result << str + "\n"
            result << "-------------------------------------\n"
        end

        puts result
    end

    def solved?
        col_win?(@board) && row_win? && box_win?
    end

    def col_win?(board)
        arr = Array.new()
        (0...9).each do |i|
            newArr = Array.new()
            board.each do |row| 
                return false if row[i].value == 0
                newArr << row[i].value
            end
            arr << newArr
        end
        arr.each do |row|
            if row.uniq.length != 9
                return false
            end
        end
        true
    end

    def row_win?
        col_win?(@board)
    end

    def box_win?
        arr = Array.new(3) {Array.new(3) {Set.new()} }
        (0...9).each do |i|
            (0...9).each do |j|
                arr[i/3][j/3].add(@board[i][j])
            end
        end
        arr.flatten.all? {|set| set.length == 9} 
    end
end
