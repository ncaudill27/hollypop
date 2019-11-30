class HollyPop::Game

    attr_accessor :current_artist, :artists, :points

    def initialize
        @points = 0
        @artists = game_artists
        prep_game
        intro
    end

    def intro
        puts "Which artist would you like to choose?"
        new_artist
        game_menu
    end

    def game_menu
        input = nil
        while input != 'exit'
            game_greet
            print "> "
            input = gets.strip.downcase
            case input

            when "quiz"
                begin
                    @points += new_question
                rescue TypeError
                    return score
                    HollyPop::Cli.main_menu
                end
                puts "Current score: #{@points}"
            when "new artist"
                new_artist
            when "new game"
                return score
                HollyPop::Game.new
            when "exit"
                exit
            end
        end
    end

    def game_greet
        puts "Current artist: #{@current_artist.name}"
        print "*Quiz*"
        print "\t*New Artist*"
        print "\t*New Game*"
        puts "\t*Exit*"
    end

    def new_question
        question = HollyPop::Question.new(@current_artist, @artists)
        question.challenge
    end
    
    def new_artist
        puts game_artist_names
        input = gets.chomp
        if game_artist_names.include?(input)
            @current_artist = HollyPop::Artist.find(input)
        else
            puts "Invalid name"
        end
    end

    def game_artists
        HollyPop::Artist.game_list
    end

    def prep_game
        @artists.each{|artist| artist.add_movies}
    end

    def game_artist_names
        @artists.collect{|artist| artist.name}
    end

    def score
        @points
    end
end