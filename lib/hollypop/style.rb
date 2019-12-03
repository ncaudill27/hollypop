module HollyPop::Stylin

    module Motion #! Broken
        def char_print
            self.each_char{ |c| putc c; $stdout.flush; sleep 0.025 }
        end
    end
    
    module Colors
        def candy(string) 
            colorized = string.each_char.collect do |c|
                Paint[c, Paint.random, :bright]
            end
            colorized.join
        end
        
        def spray(string)
            Paint[string, Paint.random, :bright]
        end
    end
end

class HollyPop::Cli
    extend HollyPop::Stylin::Motion
    include HollyPop::Stylin::Colors
end

class HollyPop::Game
    extend HollyPop::Stylin::Motion
    include HollyPop::Stylin::Colors
end

class HollyPop::Question
    extend HollyPop::Stylin::Motion
    include HollyPop::Stylin::Colors
end

class String
    include HollyPop::Stylin::Motion
end