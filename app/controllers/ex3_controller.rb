class Ex3Controller < ApplicationController
  def index

    file = File.open('inputs/inputEx3.txt')
    input = file.read

    def parse_input(input, right, down)
      visual_map = ''
      trees = 0
      x = 0
      y = 0

      input.each_line do |line|
        if y % down == 0 # Succifient because down will be 1 or 2
          line = line.delete("\n") # Remove newline
          multiplier = (x + 1 / line.length).ceil # Calculate how much we are missing
          line *= multiplier # Multiply line until it's long enough

          if line[x] == '#' # Check if there is a tree
            trees += 1
          end

          line[x] = 'X' # Replace tree with X for the visual
          visual_map += "\n#{line}" # Add newline to visual
          x += right # Move X position
        end
        y += 1 # Increment y after function because we always process line 1
      end
      [trees, visual_map]
    end

    #### Part 1 ####
    part1 = parse_input(input, 3, 1)
    @trees = part1[0]
    @out = part1[1]

    #### Part 2 ####
    def do_part2 (input)
      out1 = parse_input(input, 1, 1)[0]
      out2 = parse_input(input, 3, 1)[0]
      out3 = parse_input(input, 5, 1)[0]
      out4 = parse_input(input, 7, 1)[0]
      out5 = parse_input(input, 1, 2)[0]
      out1 * out2 * out3 * out4 * out5
    end

    file_ex = File.open('inputss/inputEx3.1.txt')
    input_ex = file_ex.read
    @example = do_part2(input_ex)

    @part2 = do_part2(input)

  end
end
