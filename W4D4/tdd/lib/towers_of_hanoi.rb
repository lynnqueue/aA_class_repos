require "byebug"

class TowersOfHanoi
    attr_accessor :poles 

    def initialize
        @poles = [[3,2,1], [], []]
    end
  
    def play
        until won?
            render
            puts "Please enter a start and destination tower"
            begin
                input = get_input
                # debugger
            rescue
                puts "Please try again"
                retry
            end
            move(input)
            # debugger
            system("clear")
        end
        puts "Congrats! You're officially a genius! :^)"
    end

    def move(input)
        start_pole, end_pole = input
        @poles[end_pole].push(@poles[start_pole].pop)
    end

    def won?
        @poles == [[], [], [3, 2, 1]]
    end
    

    def get_input
        input = gets.chomp.split(" ").map(&:to_i) #[1, 2]
        start_pole = input.first
        end_pole = input.last
        # debugger
        if input.any? {|n| !n.between?(0,2)} #if any of input's ele is not between 0 and 2
            raise "Please enter a start tower and destination tower with a space inbetween like: 1 2" 
        end
        raise "Start and destination towers have to be different" if start_pole == end_pole
        raise "There must be a disc at your starting tower" if @poles[start_pole].empty?
        raise "Can't stack bigger disc on smaller disc" if !@poles[end_pole].empty? && @poles[start_pole].last > @poles[end_pole].last 

        return input
    end

    def render
        puts "Tower 0: #{@poles[0].join("  ")}"
        puts "Tower 1: #{@poles[1].join("  ")}"
        puts "Tower 2: #{@poles[2].join("  ")}"
    end

end  

towers = TowersOfHanoi.new

p towers.play
# Towers of Hanoi

# Write a Towers of Hanoi game.

# Keep three arrays, which represents the piles of discs. Pick a representation
# of the discs to store in the arrays; maybe just a number representing their
# size. Don't worry too much about making the user interface pretty.

# In a loop, prompt the user (using gets) and ask what pile to select a disc from,
# and where to put it.

# After each move, check to see if they have succeeded in moving all the discs,
# to the final pile. If so, they win!

# Note: don't worry about testing the UI. Testing console I/O is tricky (don't
# bother checking gets or puts). Focus on: