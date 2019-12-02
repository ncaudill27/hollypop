class HollyPop::Question

    attr_accessor :artist, :points

    def initialize(artist, artists)
        @artist = artist
        @artists = artists
        @points = 1
    end

    def challenge
        puts "Which movie does #{@artist.name} appear in?"
        puts "\n"
        randomize_question.each{|answer| puts answer}
        print "> "
        input = gets.chomp
        puts "\n"
        check_answer(input)
    end

    def randomize_question
        answers = [@artist.random_movie,
        other_artist.random_movie,
        other_artist.random_movie,
        other_artist.random_movie]
        answers.shuffle
    end

    def check_answer(input)
        if @artist.movies.include?(input)
            puts "Nice!"
            puts "\n"
            return self.points
        else
            puts "Nice try!"
            puts "\n"
        end
    end

    def other_artist
        all_others = @artists.select{|artist| artist.name != @artist.name}
        all_others[rand(all_others.size)]
    end

end