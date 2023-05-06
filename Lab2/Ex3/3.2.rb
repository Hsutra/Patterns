class Data_table

    attr_reader :table
  
    def initialize(table)
        @table = table
    end

    def get_value(row, col)
        @table[row][col]
    end
    
    def num_columns
        @table[0].length
    end

    def num_rows
        @table.length
    end

end

