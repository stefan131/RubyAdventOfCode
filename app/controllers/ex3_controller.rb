class Ex3Controller < ApplicationController
  def index

    file = File.open('inputs/inputEx3.txt')
    input = file.read

    #### Part 1 ####
    @trees1 = parse_input(input, 3, 1)
    @out = visualiser(input, 3, 1)

    #### Part 2 ####
    file_ex = File.open('inputs/inputEx3.1.txt')
    @trees_example = do_part2(file_ex.read)
    @trees2 = do_part2(input)

  end

  private

  def parse_input(input, right, down = 1)
    trees = 0
    x = 0
    y = 0

    input.each_line do |line|
      if y % down == 0 # Succifient because down will be 1 or 2
        line = line.delete("\n") # Remove newline
        x = x >= line.length ? x % line.length : x # Trim x
        trees += line[x] == '#' ? 1 : 0 # Check if there is a tree, incr. trees
        line[x] = 'X' # Replace step with X for the visual
        x += right # Move X position
      end
      y += 1 # Increment y after function because we always process line 1
    end
    trees
  end

  def do_part2 (input)
    parse_input(input, 1) *
    parse_input(input, 3) *
    parse_input(input, 5) *
    parse_input(input, 7) *
    parse_input(input, 1, 2)
  end

  def visualiser(input, right, down)
    visual_map = ''
    x = 0
    y = 0

    input.each_line do |line|
      if y % down == 0 # Succifient because down will be 1 or 2
        line = line.delete("\n") # Remove newline
        x = x >= line.length ? x % line.length : x # Trim x
        line[x] = 'X' # Replace tree with X for the visual
        visual_map += "\n#{line}" # Add newline to visual
        x += right # Move X position
      end
      y += 1 # Increment y after function because we always process line 1
    end
    visual_map
  end
end
