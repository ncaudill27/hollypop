class HollyPop::Cli

    attr_accessor :highscore
    def initialize
        @highscore = 0
    end

    def call
        puts "Welcome to HollyPop!"
        puts "  __   __ _____ __    ___  ___  __________ _____ _______  __ "
        puts " |  | |  ||    || |   | |  \\  \\/  /|   *  ||    ||   *  ||  |"
        puts " |  |_|  || /\\ || |   | |   \\    / |   ___|| /\\ ||   ___||  | "
        puts " |  ___  || \\/ || |   | |    \\  /  |  |    | \\/ ||  |    |__|  "
        puts " |  | |  ||    || |__ | |__  / /   |  |    |    ||  |     __"
        puts " |__| |__||____||____||____|/_/    |__|    |____||__|    |__| "
        
        main_menu
    end
    
    def main_menu
        # Allow choice of next question, new artist, exit
        main_greet
        input = nil
        while input != 'exit'
            print "> "
            input = gets.strip.downcase
            puts "\n"
            case input

            when "new game"
                start_game
            when 'high score'
                highscore
            when 'exit'
                exit
            else
                "Invalid input. Try again."
            end
        end
    end

    def main_greet
        puts "What would you like do to?"
        print "*New Game*"
        print "\t*High Score*"
        puts "\t*Exit*"
    end

    def start_game
        active_game = HollyPop::Game.new
        if active_game.score >  @highscore# && active_game.score != nil
            @highscore = active_game.score
        end
        highscore
        main_menu
    end

    def highscore
        puts "Current High Score: #{@highscore}"
    end

end