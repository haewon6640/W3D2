class Tile

    attr_reader :value, :given
    attr_writer :given
    def initialize(num = 0)
        @value = num
        @given = num != 0 ? true : false
    end

    def value=(num)
        @value = num unless given
    end

    def to_s
        "#{@value}"
    end

end