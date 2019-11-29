class HollyPop::Cli

    def call
        puts "Welcome to HollyPop!"
        menu
    end
    
    def menu
        # Allow choice of next question, new artist, exit
        puts "What would you like do to?"
        puts "Start new game"
        puts "Exit"
        input = nil
        while input != 'exit'
            input = gets.strip.downcase
            case input

            when "start new game"
                active_game = HollyPop::Game.new
            when 'exit'
                break
            end
        end
    end

end