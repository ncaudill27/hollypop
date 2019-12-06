class HollyPop::Artist

    @@all = []

    def self.all
        @@all
    end
    def self.all_names
        @@all.collect{|artist| artist.name.downcase}
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
        finder = HollyPop::Scraper.new('https://m.imdb.com' + self.url)
        finder.doc.css('ul .ellipse a').each do |movie|
            created = HollyPop::Movie.new
            created.name = movie.text.strip.chomp
            created.url = 'https://m.imdb.com' + movie.attribute('href').value
            self.movies << created
        end
    end

    def has_movie?(name)
        @movies.any?{|movie| movie.name.downcase == name}
    end

    def find_movie(name)
        @movies.find{|movie| movie.name.downcase == name}
    end
end 