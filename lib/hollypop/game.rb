class HollyPop::Game

    attr_accessor :artist, :points

    def initialize
        @points = 0
        intro
    end

    def intro
        puts "Which artist would you like to choose?"
        puts HollyPop::Artist.all_names
        input = gets.chomp
        @artist = HollyPop::Artist.find(input)
        game_menu
    end

    def game_menu
        input = nil
        while input != 'exit'
            game_greet
            input = gets.strip.downcase
            case input

            when "pop me"
                hollypop
            when "new artist"
                new_artist
            when "new game"
                return score
                self.game_menu
            when "exit"
                exit
            end
        end
    end

    def game_greet
        puts "Current artist: #{@artist.name}"
        puts "Pop you?"
        puts "New artist?"
        puts "New game?"
    end
    
    def hollypop
        begin
            @points += new_question
        rescue TypeError
            return score
            HollyPop::Cli.game_menu
        end
        puts "Current score: #{self.points}"
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