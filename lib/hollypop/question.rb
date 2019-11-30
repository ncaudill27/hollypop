class HollyPop::Question

    attr_accessor :artist, :points

    def initialize(artist)
        @artist = artist
        @points = 1
    end

    def challenge
        puts "Which movie does #{@artist.name} appear in?"
        @artist.movies.each{|elem| puts elem}
        input = gets.chomp
        if @artist.movies.include?(input)
            puts "Nice!"
            return self.points
        else
            puts "Nice try!"
        end
    end

    def user_format
        puts "#{@artist.random_movie} | #{other_artist.random_movie} "
        puts "----------------------"
        puts "#{other_artist.random_movie} | #{other_artist.random_movie} "
    end

    def other_artist
        all_others = HollyPop::Artist.all.select{|artist| artist.name != @artist.name}
        all_others[rand(all_others.size)]
    end
end