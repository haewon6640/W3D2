class Card

    attr_reader :faceup

    def initialize(val,faceup)
        @val = val
        @faceup = faceup
    end

    def val
        @faceup ? @val : nil
    end

    def hide 
        @faceup = !@faceup if @faceup
    end

    def reveal
        @faceup = !@faceup if !@faceup
    end

    def to_s
        "Val: #{@val}, Face-up?: #{@faceup}"
    end

    # def ==(card)
    #     @val == card.val
    # end

end