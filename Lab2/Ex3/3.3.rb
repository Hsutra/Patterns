class Data_list

    private_class_method :new
    attr_reader :list

    def initialize(list)
      self.list = list
      self.select_items = []
    end
  
    #Выделить элемент по номеру
    def select(number)
      select_items.append(number)
    end
  
    #получаем массив выделеных элементов
    def get_selected
      return [] if select_items.empty?
      selected_id_list = []
      select_items.each do |num|
        selected_id_list.append(list[num].id)
      end
      selected_id_list
    end
    
    #Этот метод будтет реализован в наследнике
    def get_names
    end
    
    #Этот метод будтет реализован в наследнике
    def get_data
    end
  
    private
    attr_accessor :select_items
    attr_writer :list
  end
