class HollyPop::Explore

    attr_accessor :artist

    def initialize
        set_artist
        output_movies # Loops funneled into #output_movies which begins #menu
    end

    def menu
        puts
        spray("So, what's next?\n").ducks
        candy("~~~~~~~~~~~~~~~~\n").ducks(0.0005)
        tty_options.select("Choices:") do |menu|
            menu.choice spray("Different artist?"), -> {set_artist}
            menu.choice spray("Movie details"), -> {open_movie}
            menu.choice spray("Main menu"), -> {HollyPop::Cli.new.main_menu}
            menu.choice spray("Exit"), -> {exit}
        end
    end

    def set_artist
        spray("Which artist would you like details for?\n").ducks
        # Following line will print output into columns
        HollyPop::Artist.all.each_slice(5) { |row| puts row.map{|artist| "%5s" % spray(artist.name)}.join("  "); sleep 0.1 }
        puts
        print("> ")
        input = gets.strip.downcase
        if HollyPop::Artist.has_artist?(input)
            @artist = HollyPop::Artist.find(input)
        else
            spray("Invalid input\n", :red).ducks(0.1)
            set_artist
        end
        @artist.add_movies
        output_movies
    end

    def output_movies
        puts
        spray("#{@artist.name}'s Movies:\n").ducks
        # Following line will print output into columns
        @artist.movies.each_slice(5) { |row| puts row.map{|movie| "%5s" % spray(movie.name)}.join("  "); sleep 0.1 }
        menu
    end

    def open_movie
        spray("Which movie would you like to choose?\n").ducks
        print("> ")
        input = gets.strip.downcase
        if @artist.has_movie?(input)
            movie = @artist.find_movie(input)
            movie.details # Movie details only scraped after user chooses movie.
            puts
            puts spray("#{movie.name}")
            candy("~~~~~~~~~~~~~~~~~~~~\n").ducks(0.0005)
            puts "#{movie.details}"
            menu
        else
            puts
            spray("Invalid input\n", :red).ducks(0.1)
            open_movie
        end
    end

end