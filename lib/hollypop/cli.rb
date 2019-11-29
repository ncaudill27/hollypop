class HollyPop::Cli

    def call
        puts "Welcome to HollyPop!"
        start_game
    end
    
    def start_game
        puts "Which artist would you like to choose?"
        # call #list_artists or Artists.all
        artists = ["Hugh Jackman", "Ryan Reynolds"]
        #input = gets.chomp
        generate_question
    end

    def generate_question
        puts "Question related to chosen Artist"
    end
end