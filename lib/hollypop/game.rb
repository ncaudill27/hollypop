class Game

    attr_accessor :current_artist, :points

    def initialize
        @points = 0
    end

    def intro
        puts "Which artist would you like to choose?"
        Artist.list_all
        input = gets.chomp
        current_artist = Artist.find(input)
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

    def generate_question
        Question.new(@current_artist)
    end
end