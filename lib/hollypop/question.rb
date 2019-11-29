class Question

    attr_accessor :artist

    def initialize(artist)
        @artist = artist
    end

    def challenge
        puts "Which movie does #{@artist.name} appear in?"
    end
end