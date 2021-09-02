class Ex1Controller < ApplicationController
  def index

    #### Basic file stuff ####
    file = File.open("../inputEx1.txt")
    
    file_data = file.read
    file_data.gsub!(/\r\n?/, "\n")
    @filedata = file_data
    # Remove first line:
    # @test2 = file_data.lines[1..-1].join
    file.close

    #### Part 1 ####
    done = false;
    while(!done) do
      file_data.each_line do |line1|
        file_data.each_line do |line2|
          if(line1.to_i + line2.to_i == 2020)
            @winner1 = line1
            @winner2 = line2
            @solution = line1.to_i * line2.to_i
            done = true
          end
        end
      end
      done = true;
    end

    #### Part 2 ####
    done = false;
    while(!done) do
      file_data.each_line do |line1|
        file_data.each_line do |line2|
          file_data.each_line do |line3|
            if(line1.to_i + line2.to_i + line3.to_i == 2020)
              @p2winner1 = line1
              @p2winner2 = line2
              @p2winner3 = line3
              @p2solution = line1.to_i * line2.to_i * line3.to_i
              done = true
            end
          end
        end
      end
      done = true;
    end
    
  end
end
