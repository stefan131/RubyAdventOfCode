class Ex3Controller < ApplicationController
  def index

    file = File.open('inputs/inputEx3.txt')
    input = file.read

    fe = ForestExplorer.new
    fe.set_input(input)

    #### Part 1 ####

    @trees1 = fe.parse_input(input, 3, 1)
    @out = fe.visualiser(input, 3, 1)

    

    #### Part 2 ####
    file_ex = File.open('inputs/inputEx3.1.txt')
    @trees_example = fe.do_part2(file_ex.read)
    @trees2 = fe.do_part2(input)

  end
end
