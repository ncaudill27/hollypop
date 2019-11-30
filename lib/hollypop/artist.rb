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

    #! Initialize for testing
    # def initialize(name)
    #     @name = name
    #     @movies = []
    #     @@all << self
    # end
    
    #! Finished intialize
    def initialize(info)
        info.each{|key, value| self.send(("#{key}="), value)} 
        @movies = []
        @@all << self
    end

    def random_movie
        @movies[rand(@movies.size)]
    end

    def add_movies
        finder = HollyPop::Scraper.new('https://m.imdb.com' + self.url)
        self.movies = finder.doc.css('ul .ellipse a').collect do |movie|
            movie.text.strip.chomp
        end
    end
end 