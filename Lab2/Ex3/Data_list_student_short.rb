load("RubyLabs/Lab2/Ex3/Data_List.rb")
load("RubyLabs/Lab2/Ex3/Data_table.rb")

class Data_list_student_short < Data_list

    def get_names
        ["initials","git","contact"]
    end
  
    def get_date
        result = []
        id = 0
        list.each do |obj|
            row = []
            row << id
            row.push(*get_names(obj))
            result << row
            id += 1
        end
        Data_table.new(result)
    end

    # сеттер для массива объектов
    def table_fields(object)
        [object.shortname, object.git, object.contact]
    end
end


