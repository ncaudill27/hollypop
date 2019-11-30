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
        menu
    end

    def menu
        input = nil
        while input != 'exit'
            puts "Current artist: #{@artist.name}"
            puts "Pop you?"
            puts "New artist?"
            puts "New game?"
            input = gets.strip.downcase
            case input

            when "pop me"
                begin
                    @points += new_question
                rescue TypeError
                    return score
                    HollyPop::Cli.menu
                end
                puts "Current score: #{self.points}"
            when "new artist"
                puts HollyPop::Artist.all_names
                new_artist
            when "new game"
                
                HollyPop::Cli.new.call
            when "exit"
                exit
            end
        end
    end

    def new_artist
        input = gets.chomp
        if HollyPop::Artist.all_names.include?(input)
            @artist = HollyPop::Artist.find(input)
        else
            puts "Invalid name"
        end
    end

    def new_question
        question = HollyPop::Question.new(@artist)
        question.challenge
    end

    def score
        @points
    end
end