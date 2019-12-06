class HollyPop::Game

    attr_accessor :current_artist, :artists, :points

    def initialize
        @points = 0
        @artists = game_artists # Populates game with random Artist objects
        add_movies              # Scrapes movies for those artists
        choose_artist           # Prompts user to set #current_artist
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
                    # 1/3 #new_question return nil on incorrect answers.
                    @points += new_question
                rescue TypeError
                    # 2/3 Allowing easy access to end game.
                    spray("You lose.\n", :red).ducks(0.2)
                    return @points
                end
                # 3/3 Loops continues here for correct answers.
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
        input = tty_options.select("Current artist:", game_artists_names).downcase
        @current_artist = HollyPop::Artist.find(input)
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