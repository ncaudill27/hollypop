module HollyPop::Stylin

    def candy(string) 
        Paint[string, Paint.random, :bold]
    end

end

class HollyPop::Cli
    include HollyPop::Stylin
end

class HollyPop::Game
    include HollyPop::Stylin
end

class HollyPop::Question
    include HollyPop::Stylin
end