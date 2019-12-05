class HollyPop::Question

    attr_accessor :artist, :points

    def initialize(artist, artists)
        @artist = artist
        @artists = artists
        @points = 1
        #? Add challenge into initialize? Would relieve the .challenge call in #Game
    end

    def challenge
        prompt = TTY::Prompt.new(symbols: {marker: '>'})
        spray("Which production does #{@artist.name} appear in?\n").ducks
        candy("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n").ducks(0.0005)
        input = prompt.select("Choices:", quiz_choices)
        check_answer(input.downcase)
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
            win(input)
        else
            puts spray("Nice try!", :red)
        end
    end

    def win(name)
        spray("Awesome! You got it!\n", :green).ducks
        puts candy("======================")
        winner = @artist.find_movie(name.downcase)
        winner.details
        puts "A little about #{winner.name}:"
        puts "#{winner.description}"
        puts "Made in: #{winner.year}"
        puts  candy("======================")
        puts
        self.points
    end

    def other_artist
        all_others = @artists.select{|artist| artist.name != @artist.name}
        all_others[rand(all_others.size)]
    end

end