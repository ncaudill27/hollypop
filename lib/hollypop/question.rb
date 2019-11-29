class Question

    attr_accessor :artist

    def initialize(artist)
        @artist = artist
    end

    def challenge
        puts "Which movie does #{@artist.name} appear in?"
        @artist.movies.each{|elem| puts elem}
        binding.pry
        input = gets.chomp
        if @artist.movies.include?(input)
            puts "Nice!"
        else
            puts "Try again!"
        end
    end
end