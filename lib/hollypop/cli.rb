class HollyPop::Cli

    def call
        puts "Welcome to HollyPop!"
        menu
    end
    
    def start_game
        puts "Which artist would you like to choose?"
        Artist.list_all
        selection = gets.chomp
        game_artist = Artist.find(selection)
        generate_question(game_artist)
    end

    def generate_question(artist)
        puts "Question related to chosen #{artist.name}"
        Question.new(artist).challenge
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

end