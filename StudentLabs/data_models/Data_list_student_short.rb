require_relative 'Data_list'

class Data_list_student_short < Data_list

    def get_names
        ["number", "fullname", "git", "contact"]
    end

    # сеттер для массива объектов
    def get_fields(object)
        [object.fullname, object.git, object.contact]
    end
end

