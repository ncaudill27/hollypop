class HollyPop::Artist

    @@all = []

    def self.all
        @@all
    end
    def self.all_names
        @@all.collect{|artist| artist.name.downcase}
    end

    def self.alpha_sort
        self.all.sort{|star_a, star_b| star_a.name <=> star_b.name }
    end

    def self.has_artist?(name)
        self.all_names.include?(name)
    end

    def self.find(name)
        @@all.find{|artist| artist.name.downcase == name}
    end

    def self.game_list
        [
        all[rand(all.size)],
        all[rand(all.size)],
        all[rand(all.size)],
        all[rand(all.size)],
        all[rand(all.size)]
        ]
    end

    attr_accessor :name, :url, :movies, :roles

    def initialize
        @movies = []
        @roles = {}
        @@all << self
    end

    def random_movie
        @movies[rand(@movies.size)]
    end

    def add_movies
        self.movies = HollyPop::Scraper.new.scrape_movies(@url)
    end

    def alpha_movie
        @movies.sort{|mov_a, mov_b| mov_a.name <=> mov_b.name}
    end

    def has_movie?(name)
        @movies.any?{|movie| movie.name.downcase == name}
    end

    def find_movie(name)
        @movies.find{|movie| movie.name.downcase == name}
    end
end 