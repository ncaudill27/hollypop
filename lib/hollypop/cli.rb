class HollyPop::Cli

    attr_accessor :highscore
    def initialize
        @highscore = 0
    end

    def call
        welcome  
        HollyPop::Scraper.url_to_artists('https://www.imdb.com/search/name/?gender=male%2Cfemale&ref_=nv_cel_m')
        HollyPop::Scraper.url_to_artists('https://www.imdb.com/search/name/?gender=male,female&start=51&ref_=rlm')
        main_menu
    end

    def welcome
        spray("Welcome to...\n").ducks
        sleep 1
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
        input = nil
        while input != 'exit'
            menu_options
            print "> "
            input = gets.strip.downcase
            puts 
            case input

            when "new game"
                start_game
            when 'exit'
                exit
            end
        end
    end

    def menu_options
        spray("What would you like do to?\n").ducks
        puts candy("======================")
        sleep 0.2
        print spray("*New Game*")
        sleep 0.2
        puts spray("\t*Exit*")
        puts candy("======================")
    end

    def start_game
        active_game = HollyPop::Game.new
        if active_game.score >  @highscore
            @highscore = active_game.score
        end
        highscore
        main_menu
    end

    def highscore
        puts spray("Current High Score: #{@highscore}")
    end

end