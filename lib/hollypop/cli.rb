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
                start_game
            when 'exit'
                break
            end
        end
    end

    def start_game
        Game.new.intro
    end

end