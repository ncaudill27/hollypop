module HollyPop::Stylin

    module Motion
        def ducks(speed = 0.025)
            self.each_char{ |c| putc c; sleep speed; $stdout.flush }
        end
    end
    
    module Ux
        def candy(string) 
            colorized = string.each_char.collect do |c|
                Paint[c, Paint.random, :bright]
            end
            colorized.join
        end
        
        def spray(string, color = Paint.random)
            Paint[string, color, :bright]
        end

        def tty_options
            TTY::Prompt.new(symbols: {marker: '>'})
        end
    end
end

class HollyPop::Cli
    extend HollyPop::Stylin::Motion
    include HollyPop::Stylin::Ux
end

class HollyPop::Game
    extend HollyPop::Stylin::Motion
    include HollyPop::Stylin::Ux
end

class HollyPop::Question
    extend HollyPop::Stylin::Motion
    include HollyPop::Stylin::Ux
end

class HollyPop::Explore
    extend HollyPop::Stylin::Motion
    include HollyPop::Stylin::Ux
end

class String
    include HollyPop::Stylin::Motion
end