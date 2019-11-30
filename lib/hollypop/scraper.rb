class HollyPop::Scraper

    attr_accessor :doc

    def initialize(url)
        @doc = Nokogiri::HTML(open(url))
    end

    def artist_list
        @doc.css("div.row.chart-row").collect do |artist|
            artist.css('h4').collect{|single| single.text.strip }
        end.flatten
    end

    def url_list
        @doc.css("div.row.chart-row").collect do |artist|
            artist.css('a').collect{|single| single.attribute('href').value }.uniq
        end.flatten
    end

    def artist_info
        pairs = artist_list.zip(url_list)
        artists = pairs.collect{|pair|{:name => pair[0],:url => pair[1]}}
    end

    def create_artists
        artist_info.each do |artist|
            HollyPop::Artist.new(artist)
        end
    end

end