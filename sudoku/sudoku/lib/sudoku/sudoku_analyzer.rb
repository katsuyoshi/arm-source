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
      # 左3列からnumberを探してrに該当列を入れる
      # 横に走査して数値があるか見ていく
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

      # rのnilの数で状態を判定
      case r.count(nil)
      when 0
        # nilがないなら既に数値は埋まっている
        p "done"
      when 1
        # nilが1つなら推測可能(但し埋められるかは分らない)
        p "can search"
        row = nil
        column = nil
        # nilの位置で上、中、下どの3行を探索するか判定
        # 該当する3行をblockに取出す
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

        # nilを削除して並べ替えてどの列を走査するか決定する
        r.delete(nil)
        r.sort!
        if r[0] == 0
          if r[1] == 1
            #search 2 column
            column = 2
          else
            #search 1 column
            column = 1
          end
        else
          # search 0 column
          column = 0
        end
        # 該当列を縦に取出す
        line = block.map{|l| l[column]}
        # 一つだけ空いている場合は数値を埋めれる
        if line.count(" ") == 1
          row += line.index(" ")
          @condition[row][column] = n
p "I god it!!!"
        end
      else
        # 複数nilがあれば埋められない
p "I'm wondering"
      end
    end
    
  end

end
