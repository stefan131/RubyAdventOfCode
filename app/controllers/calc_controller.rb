class CalcController < ApplicationController
  def index
    file = File.open("../input.txt")
    
    file_data = file.read
    file_data.gsub!(/\r\n?/, "\n")
    file_data2 = file.readlines.map(&:chomp)
    @test = file_data
    @test2 = file_data.lines[1..-1].join

    

    line_num=0
    
    @test3 = line_num
    @test4 = line_num[5]
    file.close

    data1 = file_data
    data2 = file_data

    counter = 0

    done = false;
    @output = "nothing"
    while(!done) do
      data1.each_line do |line1|
        data2.each_line do |line2|
          if(line1.to_i + line2.to_i == 2020)
            @winner1 = line1
            @winner2 = line2
            @solution = line1.to_i * line2.to_i
            done = true
          end
        end
      end
      done = true;
      nLine = 0;
    end
    
  end
end
