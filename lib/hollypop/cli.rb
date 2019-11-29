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
        puts "Which artist would you like to choose?"
        Artist.list_all
        input = gets.chomp
        game_artist = Artist.find(input)
        input = nil
        while input != 'menu'
            puts "Current artist: #{game_artist.name}"
            puts "Next question?"
            puts "New artist?"
            puts "Main menu?"
            input = gets.chomp
            case input
            when "Next question"
                generate_question(game_artist)
            when "New artist"
                start_game
            when "menu"
                menu
            end
        end

    end

    def generate_question(artist)
        puts "Question related to chosen #{artist.name}"
        Question.new(artist).challenge
    end


end