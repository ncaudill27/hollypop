class HollyPop::Artist

    @@all = []

    def self.all
        @@all
    end
    def self.all_names
        @@all.collect{|artist| artist.name}
    end

    def self.find(name)
        @@all.find{|artist| artist.name == name}
    end

    attr_accessor :name, :movies
   
    def initialize(name)
        @name = name
        @movies = []
        @@all << self
    end

    def random_movie
        @movies[rand(@movies.size)]
    end
end 