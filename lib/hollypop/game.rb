class HollyPop::Game

    attr_accessor :artist, :points

    def initialize
        @points = 0
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
        puts "Current artist: #{@artist.name}"
        print "*Quiz*"
        print "\t*New Artist*"
        print "\t*New Game*"
        puts "\t*Exit*"
    end

    def new_question
        question = HollyPop::Question.new(@artist)
        question.challenge
    end
    
    def new_artist
        puts HollyPop::Artist.all_names
        input = gets.chomp
        if HollyPop::Artist.all_names.include?(input)
            @artist = HollyPop::Artist.find(input)
        else
            puts "Invalid name"
        end
    end

    def score
        @points
    end
end