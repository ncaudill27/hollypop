class HollyPop::Artist

    @@all = []

    def self.all
        @@all
    end
    def self.list_all
        @@all.each{|artist|puts artist.name}
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

end 