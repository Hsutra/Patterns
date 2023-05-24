class Data_table

    attr_reader :row_number, :column_number
  
    def initialize(table)
      @table = table
      @row_number = table.size
      @column_number = max_size_column
    end
  
    #получить элемент по номеру столбца и строки
    def get_item(row,col)
      return nil if row>=@row_number||col>=@column_number
      table[row][col]
    end
  
    private
    attr_accessor :table
    attr_writer :row_number, :column_number
  
    #максимальный размер столбца
    def max_size_column
      max_size = 0
      table.each{|elem| max_size=elem.size if elem.size>max_size}
      max_size
    end
  end
