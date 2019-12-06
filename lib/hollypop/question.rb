class HollyPop::Question

    attr_accessor :artist, :points

    def initialize(artist, artists) # Imports "environment" from Game
        @artist = artist
        @artists = artists
        @points = 1
    end

    def challenge
        spray("Which production does #{@artist.name} appear in?\n").ducks
        candy("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n").ducks(0.0005)
        input = tty_options.select("Choices:", quiz_choices).downcase
        check_answer(input)
    end

    def quiz_choices
        answers = [
            @artist.random_movie.name,
            other_artist.random_movie.name,
            other_artist.random_movie.name,
            other_artist.random_movie.name
        ]
        answers.shuffle
    end

    def check_answer(input)
        puts
        if @artist.has_movie?(input)
            correct(input)
        else
            puts spray("Nice try!", :red) # If wrong, return nil to begin error handling
        end
    end

    def correct(name)
        spray("Awesome! You got it!\n", :green).ducks
        puts candy("======================")
        winner = @artist.find_movie(name)
        winner.details # Scrapes movie details
        puts "A little about #{winner.name}:"
        puts "#{winner.description}"
        puts "Made in: #{winner.year}"
        puts  candy("======================")
        puts
        return @points
    end

    def other_artist
        all_others = @artists.select{|artist| artist.name != @artist.name}
        all_others[rand(all_others.size)]
    end

end