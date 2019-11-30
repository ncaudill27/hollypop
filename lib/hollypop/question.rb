class HollyPop::Question

    attr_accessor :artist, :points

    def initialize(artist, artists)
        @artist = artist
        @artists = artists
        @points = 1
    end

    def challenge
        puts "Which movie does #{@artist.name} appear in?"
        puts @artist.random_movie
        puts other_artist.random_movie
        puts other_artist.random_movie
        puts other_artist.random_movie
        input = gets.chomp
        if @artist.movies.include?(input)
            puts "Nice!"
            return self.points
        else
            puts "Nice try!"
        end
    end
    
    
    def other_artist
        all_others = @artists.select{|artist| artist.name != @artist.name}
        all_others[rand(all_others.size)]
    end
    
 #TODO Figure how to print question positions at random
    # def generate_format
    #     formats = {
    #         1 => user_format1,
    #         2 => user_format2,
    #         3 => user_format3,
    #         4 => user_format4
    #     }
    #     formats[rand(4)]
    # end
    # def user_format1
    #     puts "#{@artist.random_movie} | #{other_artist.random_movie} "
    #     puts "----------------------"
    #     puts "#{other_artist.random_movie} | #{other_artist.random_movie} "
    # end

    # def user_format2
    #     puts " #{other_artist.random_movie} | #{@artist.random_movie} "
    #     puts "----------------------"
    #     puts "#{other_artist.random_movie} | #{other_artist.random_movie} "
    # end

    # def user_format3
    #     puts " #{other_artist.random_movie} | #{other_artist.random_movie} "
    #     puts "----------------------"
    #     puts "#{@artist.random_movie} | #{other_artist.random_movie} "
    # end

    # def user_format4
    #     puts " #{other_artist.random_movie} | #{other_artist.random_movie} "
    #     puts "----------------------"
    #     puts "#{other_artist.random_movie} | #{@artist.random_movie} "
    # end

end