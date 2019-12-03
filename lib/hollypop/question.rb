class HollyPop::Question

    attr_accessor :artist, :points

    def initialize(artist, artists)
        @artist = artist
        @artists = artists
        @points = 1
    end

    def challenge
        prompt = TTY::Prompt.new(symbols: {marker: '>'})
        puts candy("Which movie does #{@artist.name} appear in?")
        puts candy("~~~~~~~~~~~~~~~~~~~~".each_char { |c| putc c; $stdout.flush; sleep 0.025 })
        input = prompt.select("Choices:", quiz_choices)
        check_answer(input)
    end

    def quiz_choices
        answers = [
            candy(@artist.random_movie),
            candy(other_artist.random_movie),
            candy(other_artist.random_movie),
            candy(other_artist.random_movie)
        ]
        answers.shuffle
    end

    def check_answer(input)
        puts
        if @artist.movies.include?(input)
            puts "Awesome! You got it! ".each_char { |c| putc c; $stdout.flush; sleep 0.10 }
            return self.points
        else
            puts "Nice try!"
        end
    end

    def other_artist
        all_others = @artists.select{|artist| artist.name != @artist.name}
        all_others[rand(all_others.size)]
    end

end