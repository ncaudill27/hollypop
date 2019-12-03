class HollyPop::Cli

    attr_accessor :highscore
    def initialize
        @highscore = 0
    end

    def call
        welcome    
        main_menu
    end

    def welcome
        puts candy("Welcome to...")
        sleep 1.5
        puts candy("================================================================")
        sleep 0.2
        puts candy("  __   __ _____ __    ___  ___  __________ _____ _______  __ ")
        sleep 0.2
        puts candy(" |  | |  ||    || |   | |  \\  \\/  /|   *  ||    ||   *  ||  |")
        sleep 0.2
        puts candy(" |  |_|  || /\\ || |   | |   \\    / |   ___|| /\\ ||   ___||  | ")
        sleep 0.2
        puts candy(" |  ___  || \\/ || |   | |    \\  /  |  |    | \\/ ||  |    |__|  ")
        sleep 0.2
        puts candy(" |  | |  ||    || |__ | |__  / /   |  |    |    ||  |     __")
        sleep 0.2
        puts candy(" |__| |__||____||____||____|/_/    |__|    |____||__|    |__| ")
        sleep 0.2
        puts candy("================================================================")
    end
    
    def main_menu
        puts 
        main_greet
        input = nil
        while input != 'exit'
            print "> "
            input = gets.strip.downcase
            puts 
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
        puts candy("What would you like do to?")
        puts candy("=======================================")
        print candy("*New Game*")
        print candy("\t*High Score*")
        puts candy("\t*Exit*")
        puts candy("=======================================")
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