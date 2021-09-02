class Ex2Controller < ApplicationController
  def index

    ##### Part 1 #####
    file = File.open("../inputEx2.txt")
    input = file.read

    amtValid = 0

    input.each_line do |line1|
      @test1 = line1.split(" ")
      ln = line1.split(" ")
      min = ln[0].split("-")[0].to_i
      max = ln[0].split("-")[1].to_i
      letter = ln[1][0, 1]
      pw = ln[2]
      count = pw.count(letter)
      valid = (min..max) === pw.count(letter)
      if(valid)
        amtValid = amtValid + 1
      end
    end
    @valid = amtValid

    ##### Part 2 #####
    amtValid = 0
    input.each_line do |line1|
      ln = line1.split(" ")
      min = ln[0].split("-")[0].to_i
      max = ln[0].split("-")[1].to_i
      letter = ln[1][0, 1]
      pw = ln[2]
      count = 0
      if(pw.length < min || pw.length < max)
        break
      end
      pw[min  - 1] == letter ? count = count + 1 : count = count
      pw[max - 1] == letter ? count = count + 1 : count = count
      valid = count == 1
      if(valid)
        amtValid = amtValid + 1
      end
    end
    @valid2 = amtValid

  end
end
