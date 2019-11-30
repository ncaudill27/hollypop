class HollyPop::Cli

    attr_accessor :highscore
    def initialize
        @highscore = 0
    end

    def call
        puts "Welcome to HollyPop!"
        main_menu
    end
    
    def main_menu
        # Allow choice of next question, new artist, exit
        puts "What would you like do to?"
        puts "New game?"
        puts "Type exit at any time"
        input = nil
        while input != 'exit'
            input = gets.strip.downcase
            case input

            when "new game"
                active_game = HollyPop::Game.new
                if active_game.score >  @highscore# && active_game.score != nil
                    self.highscore = active_game.score
                end
                puts "High Score: #{self.highscore}"
                main_menu
            when 'high score'
                puts "High Score: #{self.highscore}"
            when 'exit'
                exit
            end
        end
    end

end