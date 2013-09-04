module Sudoku
  class Analyzer
  
    def initialize(condition, output)
      @initial_condition = condition
      @condition = @initial_condition
      @output = output
    end

    def start
      @output.puts("started analysis.")
      @output.puts(@initial_condition.join("\n"))
    end
    
    def set condition
      case condition
      when Array
        @condition = condition
      when String
        @condition = condition.split(//).each_slice(9).map{|a| a.join("")}
      end
    end
    
    def current
      @condition
    end
    
    def analyze_left_columns number
p "condition", @condition
      n = number.to_s
      r = [nil, nil, nil]
      column_condition = []
      @condition.each_slice(3).with_index do |block, block_index|
        block.each_with_index do |line, row_in_block|
          row = block_index * 3 + row_in_block
          column_condition << line[0,3]
          index = column_condition.last.index n
          if index
            r[block_index] = index
            puts "found #{n} at #{row}:#{index}"
            next
          end
        end
      end
p r, column_condition
      case r.count(nil)
      when 0
        p "done"
      when 1
        p "can search"
        row = nil
        column = nil
        case r.index nil
        when 0
          row = 0
          block = column_condition[0, 3]
        when 1
          row = 3
          block = column_condition[3, 3]
        when 2
          row = 6
          block = column_condition[6, 3]
        end
p block
        r.delete(nil)
        r.sort!
        line = nil
        if r[0] == 0
          if r[1] == 1
            #search 2 column
            line = block.map{|l| l[2]}
            column = 2
          else
            #search 1 column
            line = block.map{|l| l[1]}
            column = 1
          end
        else
          # search 0 column
          line = block.map{|l| l[0]}
          column = 0
        end
p line
        if line.count(" ") == 1
          row += line.index(" ")
          @condition[row][column] = n
p "condition", @condition, self.current
p "I god it!!!"
        end
      else
        p "I'm wondering"
      end
    end
    
  end

end
