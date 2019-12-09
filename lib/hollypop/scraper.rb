class HollyPop::Scraper

    def url_to_artists(url)
        doc = Nokogiri::HTML(open(url))
        doc.css("h3 a").each do |create|
            artist = HollyPop::Artist.new
            artist.name = create.text.strip.chomp
            artist.url = create.attribute("href").value
        end
    end

    def scrape_movies(url)
        base = 'https://m.imdb.com' + url
        doc = Nokogiri::HTML(open(base))
        doc.css('ul .ellipse a').map do |movie|
            created = HollyPop::Movie.new
            created.name = movie.text.strip.chomp
            created.url = 'https://m.imdb.com' + movie.attribute('href').value
            created
        end
    end

end