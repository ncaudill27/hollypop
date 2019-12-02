class HollyPop::Game

    attr_accessor :current_artist, :artists, :points

    def initialize
        @points = 0
        @artists = game_artists
        add_movies 
        choose_artist
        game_menu
    end

    def game_menu
        input = nil
        while input != 'exit'
            list_options
            print "> "
            input = gets.strip.downcase
            puts "\n"
            case input

            when "quiz"
                begin
                    @points += new_question
                rescue TypeError
                    return score
                    HollyPop::Cli.main_menu
                end
                puts "Current score: #{@points}\n"
            when "new artist"
                choose_artist
            when "new game"
                return score
                HollyPop::Game.new
            when "exit"
                exit
            else
                "Invalid input. Try again."
            end
        end
    end

    def list_options
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
    
    def choose_artist
        puts "Which artist would you like to choose?"
        puts "\n"
        puts game_artists_names
        print "> "
        input = gets.chomp
        puts "\n"
        if game_artists_names.include?(input)
            @current_artist = HollyPop::Artist.find(input)
        elsif input == 'exit'
            exit
        else
            puts "Invalid name"
            puts "\n"
            choose_artist
        end
    end

    def game_artists
        HollyPop::Artist.game_list
    end

    def add_movies
        @artists.each{|artist| artist.add_movies}
    end

    def game_artists_names
        @artists.collect{|artist| artist.name}
    end

    def score
        @points
    end
end