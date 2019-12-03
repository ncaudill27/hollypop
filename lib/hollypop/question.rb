class HollyPop::Question

    attr_accessor :artist, :points

    def initialize(artist, artists)
        @artist = artist
        @artists = artists
        @points = 1
    end

    def challenge
        prompt = TTY::Prompt.new(symbols: {marker: '>'})
        puts spray("Which movie does #{@artist.name} appear in?")
        puts candy("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        input = prompt.select("Choices:", quiz_choices)
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
            win(input)
        else
            puts spray("Nice try!")
        end
    end

    def win(name)
        puts spray("Awesome! You got it!")
        winner = @artist.find_movie(name)
        winner.details
        puts "#{winner.description}"
        puts "Made in: #{winner.year}"
        #TODO Scrape movie info
        return self.points
    end

    def other_artist
        all_others = @artists.select{|artist| artist.name != @artist.name}
        all_others[rand(all_others.size)]
    end

end