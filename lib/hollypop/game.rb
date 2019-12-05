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
            puts 
            case input

            when "quiz"
                begin
                    @points += new_question
                rescue TypeError
                    spray("You lose.\n", :red).ducks(0.2)
                    return @points
                end
                puts spray("Current score: #{@points}")
                puts spray("Current artist: #{@artist}")
            when "new artist"
                choose_artist
            when "main menu"
                return @points
            when "exit"
                exit
            end
        end
    end

    def list_options
        puts candy("==============================================")
        sleep 0.2
        print spray("*Quiz*")
        sleep 0.2
        print spray("\t*New Artist*")
        sleep 0.2
        print spray("\t*Main Menu*")
        sleep 0.2
        puts spray("\t*Exit*")
        puts candy("==============================================")
    end

    def new_question
        question = HollyPop::Question.new(@current_artist, @artists)
        question.challenge
    end
    
    def choose_artist
        puts spray("Which artist would you like to choose?")
        candy("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n").ducks(0.0005)
        prompt = TTY::Prompt.new(symbols: {marker: '>'})
        input = prompt.select("Current artist:", game_artists_names)
        @current_artist = HollyPop::Artist.find(input.downcase)
    end

    def game_artists
        HollyPop::Artist.game_list
    end

    def game_artists_names
        @artists.collect{|artist| artist.name}.uniq
    end
    
    def add_movies
        @artists.each{|artist| artist.add_movies}
    end
end