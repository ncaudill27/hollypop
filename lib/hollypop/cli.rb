class HollyPop::Cli

    def call
        puts "Welcome to HollyPop!"
        start_game
    end
    
    def start_game
        puts "Which artist would you like to choose?"
        # call #list_artists or Artists.all
        Artist.list_all
        selection = gets.chomp
        game_artist = Artist.find(selection)
        generate_question(game_artist)
    end

    def generate_question(artist)
        puts "Question related to chosen #{artist.name}"
    end
end