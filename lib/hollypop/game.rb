class HollyPop::Game

    attr_accessor :current_artist, :points

    def initialize
        @points = 0
        intro
    end

    def intro
        puts "Which artist would you like to choose?"
        puts HollyPop::Artist.all_names
        input = gets.chomp
        @current_artist = HollyPop::Artist.find(input)
        menu
    end

    def menu
    input = nil
        while input != 'exit'
            puts "Current artist: #{@current_artist.name}"
            puts "Pop you?"
            puts "New artist?"
            puts "New game?"
            input = gets.strip.downcase
            case input

            when "pop me"
                HollyPop::Question.new(@current_artist).challenge
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
            @current_artist = HollyPop::Artist.find(input)
        else
            puts "Invalid name"
        end
    end
end