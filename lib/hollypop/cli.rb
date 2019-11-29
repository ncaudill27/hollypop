class HollyPop::Cli

    def call
        puts "Welcome to HollyPop!"
        start_game
    end
    
    def start_game
        puts "Which artist would you like to choose?"
        # call #list_artists or Artists.all
        generate_question
        Artist.list_all
    end

    def generate_question
        puts "Question related to chosen Artist"
    end
end