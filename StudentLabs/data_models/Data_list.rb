require_relative 'Data_table'

class Data_list

  attr_accessor :selected_items, :list

  def initialize(list)
    self.list = list
    self.selected_items = []
    @observers = []
  end

  #Наблюдатель
  def add_observer(observer)
    @observers << observer
  end

  def notify
    @observers.each { |obs| obs.set_table_data(get_data) }
  end

  #Выделить элемент по номеру
  def select(*number)
    selected_items.append(*number)
  end

  #получаем массив выделеных элементов
  def get_select
    selected_items.inject([]) {|res, index| res << list[index].id}
  end

  def clear_selected
    self.selected_data = []
  end

  #Этот метод будтет реализован в наследнике
  def get_names; end

  def get_data
    index_id = 1
    dt = list.inject([]) do |res, object|
      row = [index_id]
      row.append(*get_fields(object))
      index_id += 1
      res << row
    end
    DataTable.new(dt)
  end

  def get_fields; end

  def get_new_list(list)
    self.list = list.dup
    notify
  end

end
