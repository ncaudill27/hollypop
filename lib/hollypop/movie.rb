class HollyPop::Movie

    attr_accessor :name, :url, :year, :description


    def details
        scrape = HollyPop::Scraper.new(self.url)
        self.year = scrape.doc.css("h1 .sub-header").text.strip
        self.description = scrape.doc.css("div.media-body.relative").text.gsub("\n", "").strip.split(/(\s\s)/)[0] 
    end

    
end