class HollyPop::Cli

    def call
        puts "Welcome to HollyPop!"
        menu
    end
    
    def menu
        # Allow choice of next question, new artist, exit
        puts "What would you like do to?"
        puts "New game?"
        puts "Type exit at any time"
        input = nil
        while input != 'exit'
            input = gets.strip.downcase
            case input

            when "new game"
                active_game = HollyPop::Game.new
            when 'exit'
                exit
            end
        end
    end

end