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

    def self.game_list
        [
        all[rand(all.size)],
        all[rand(all.size)],
        all[rand(all.size)],
        all[rand(all.size)],
        all[rand(all.size)]
        ]
    end

    attr_accessor :name, :url, :movies

    def initialize(info)
        info.each{|key, value| self.send(("#{key}="), value)} 
        @movies = []
        @@all << self
    end

    def random_movie
        @movies[rand(@movies.size)]
    end

    #! Do I want this scraping responsibility in Artist class?
    def add_movies
        finder = HollyPop::Scraper.new('https://m.imdb.com' + self.url)
        self.movies = finder.doc.css('ul .ellipse a').collect do |movie|
            created = HollyPop::Movie.new(movie.text.strip.chomp)
            created.url = 'https://m.imdb.com' + movie.attribute('href').value
            created
        end
    end

    def has_movie?(name)
        @movies.any?{|movie| movie.name == name}
    end

    def find_movie(name)
        @movies.find{|movie| movie.name == name}
    end
end 