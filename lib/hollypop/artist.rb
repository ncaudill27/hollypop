class Artist

    @@all = []

    def self.list_all
        @@all.each{|artist|puts artist.name}
    end

    attr_accessor :name
   
    def initialize(name)
        @name = name
        @@all << self
    end

end 