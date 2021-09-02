class Ex3Controller < ApplicationController
  def index

    file = File.open("../inputEx3.txt")
    input = file.read

    def parseInput(input, right, down)
      visualMap = ""
      trees = 0
      x = 0
      y = 0

      input.each_line do |line|
        if(y %down !=  0) # Succifient because down will be 1 or 2
          y = y + 1
        else
          line = line.gsub("\n",'') # Remove newline
          multiplier = (x + 1 / line.length).ceil # Calculate how much we are missing
          line = line * multiplier # Multiply line until it's long enough
          
          if(line[x] == "#") # Check if there is a tree
            trees = trees + 1
          end

          line[x] = "X" # Replace tree with X for the visual
          visualMap = visualMap + "\n" + line  # Add newline to visual
          x = x + right # Move X position
          y = y + 1 # Increment y after function because we always process line 1
        end
      end
      return trees, visualMap
    end

    #### Part 1 ####
    part1 = parseInput(input, 3, 1)
    @trees = part1[0]
    @out = part1[1]

    #### Part 2 ####
    def doPart2(input)
      out1 = parseInput(input, 1, 1)[0]
      out2 = parseInput(input, 3, 1)[0]
      out3 = parseInput(input, 5, 1)[0]
      out4 = parseInput(input, 7, 1)[0]
      out5 = parseInput(input, 1, 2)[0]
      return out1 * out2 * out3 * out4 * out5
    end

    fileEx = File.open("../inputEx3.1.txt")
    inputEx = fileEx.read
    @example = doPart2(inputEx)

    @part2 = doPart2(input)

  end
end
