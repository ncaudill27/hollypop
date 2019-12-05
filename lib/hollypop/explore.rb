class HollyPop::Explore

    attr_accessor :artist

    def initialize
        set_artist
        output_movies
    end

    def menu
        puts
        prompt = TTY::Prompt.new(symbols: {marker: '>'})
        spray("So, what's next?\n").ducks
        candy("~~~~~~~~~~~~~~~~\n").ducks(0.0005)
        prompt.select("Choices:") do |menu|
            menu.choice spray("Different artist?"), -> {set_artist}
            menu.choice spray("Movie details"), -> {open_movie}
            menu.choice spray("Main menu"), -> {HollyPop::Cli.new.main_menu}
        end
    end

    def set_artist
        spray("Which artist would you like details for?\n").ducks
        HollyPop::Artist.all.each_slice(5) { |row| puts row.map{|artist| "%5s" % spray(artist.name)}.join("  "); sleep 0.1 }
        puts
        print("> ")
        input = gets.strip.downcase
        if HollyPop::Artist.all_names.include?(input)
            @artist = HollyPop::Artist.find(input)
        else
            spray("Invalid input\n", :red).ducks(0.2)
            set_artist
        end
        @artist.add_movies
        output_movies
    end

    def output_movies
        puts
        spray("#{@artist.name}'s Movies:\n").ducks
        @artist.movies.each_slice(5) { |row| puts row.map{|movie| "%5s" % spray(movie.name)}.join("  "); sleep 0.1 }
        menu
    end

    def open_movie
        spray("Which movie would you like to choose?\n").ducks
        print("> ")
        input = gets.strip.downcase
        if @artist.has_movie?(input)
            movie = @artist.find_movie(input)
            movie.details
            puts
            puts spray("#{movie.name}")
            candy("~~~~~~~~~~~~~~~~~~~~\n").ducks(0.0005)
            puts "#{movie.details}"
            menu
        else
            puts
            spray("Invalid input\n", :red).ducks(0.2)
            open_movie
        end
    end

end