class HollyPop::Scraper

    attr_accessor :doc

    def initialize(url)
        @doc = Nokogiri::HTML(open(url))
    end

    def self.url_to_artists(url)
        scrape = HollyPop::Scraper.new(url)
        scrape.doc.css("h3 a").each do |create|
            artist = HollyPop::Artist.new
            artist.name = create.text.strip.chomp
            artist.url = create.attribute("href").value
        end
    end

end