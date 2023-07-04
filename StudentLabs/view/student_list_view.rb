# frozen_string_literal: true
require 'fox16'
require_relative '../controller/student_list_controller/'
include Fox

class MyWindow < FXMainWindow
  def initialize(app)
    @controller = Student_list_controller.new(self)
    @students_in_page = 5
    @cur_page = 1
    @count_students = @controller.count_students
    @count_pages = (@count_students / @students_in_page).ceil
    super(app, "Окошечко", nil, nil, DECOR_ALL, 0, 0, 1024, 512)
    # Создание вкладок
    tab_book = FXTabBook.new(self, :opts => LAYOUT_FILL)

    tab1 = FXTabItem.new(tab_book, "Вкладка 1")
    tab1_contents = FXVerticalFrame.new(tab_book, :opts => LAYOUT_FILL)

    tab2 = FXTabItem.new(tab_book, "Вкладка 2")
    tab2_contents = FXVerticalFrame.new(tab_book, :opts => LAYOUT_FILL)

    tab3 = FXTabItem.new(tab_book, "Вкладка 3")
    tab3_contents = FXVerticalFrame.new(tab_book, :opts => LAYOUT_FILL)

    # Создание горизонтального контейнера для разделения на 3 области
    layout = FXHorizontalFrame.new(tab1_contents, LAYOUT_FILL_X | LAYOUT_FILL_Y)

    # Создание левой области
    left_area = FXVerticalFrame.new(layout, FRAME_THICK|LAYOUT_FILL_Y)
    FXLabel.new(left_area, "Область фильтрации")

    # Создание вертикального контейнера для полей ввода
    input_frame = FXVerticalFrame.new(left_area, LAYOUT_FILL_X)

    # Создание полей ввода
    FXLabel.new(input_frame, "Поле для ввода фамилии и инициалов")
    input1 = FXTextField.new(input_frame, 35)

    FXLabel.new(input_frame, "Поле для ввода гита")
    input2 = FXTextField.new(input_frame, 35)
    input2.disable
    radiobtn(input_frame,input2)

    FXLabel.new(input_frame, "Поле для ввода почты")
    input3 = FXTextField.new(input_frame, 35)
    input3.disable
    radiobtn(input_frame,input3)

    FXLabel.new(input_frame, "Поле для ввода телефона")
    input4 = FXTextField.new(input_frame, 35)
    input4.disable
    radiobtn(input_frame,input4)

    FXLabel.new(input_frame, "Поле для ввода телеграмма")
    input5 = FXTextField.new(input_frame, 35)
    input5.disable
    radiobtn(input_frame,input5)

    # Создание центральной области
    center_area = FXVerticalFrame.new(layout, FRAME_THICK|LAYOUT_FILL_X | LAYOUT_FILL_Y)
    FXLabel.new(center_area, "Таблица")

    # Создание таблицы
    @table = FXTable.new(center_area, :opts => LAYOUT_FILL)
    @table.setTableSize(@students_in_page, 4)
    @table.editable = false

    @table.setColumnText(0, "Номер")
    @table.setColumnText(1, "ФИО")
    @table.setColumnText(2, "Гит")
    @table.setColumnText(3, "Контакт")


    @table.getColumnHeader.connect(SEL_COMMAND) do |a, b, col|
      sort_table_by_column(@table, col)
    end

    # Создание правой области
    right_area = FXVerticalFrame.new(layout, FRAME_THICK|LAYOUT_FILL_Y)
    FXLabel.new(right_area, "Область управления")

    # Создание кнопки ДОБАВЛЕНИЯ
    button1 = FXButton.new(right_area, "Добавить", :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT,:width => 160, :height => 40)
    button1.connect(SEL_COMMAND) do |sender, sel, event|
      if input1.text.empty?
        FXMessageBox.warning(self, MBOX_OK, "Ошибка", "ФИО должно быть заполнено.")
      else
        contact = [input3.text, input4.text, input5.text].reject(&:empty?).join(", ")
      end
    end

    # Создание кнопки ИЗМЕНЕНИЯ
    button2 = FXButton.new(right_area, "Изменить", :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT,:width => 160, :height => 40)
    button2.enabled= false

    # Создание кнопки УДАЛЕНИЯ
    button3 = FXButton.new(right_area, "Удалить", :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT,:width => 160, :height => 40)
    button3.enabled= false

    # Создание кнопки ОБНОВЛЕНИЯ
    button4 = FXButton.new(right_area, "Обновить", :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT,:width => 160, :height => 40)

    selected_items = []
    @table.connect(SEL_SELECTED) do |sender, sel, pos|
      item = [pos.row, pos.col]
      selected_items << item unless selected_items.include? item

      if selected_items.length == 4 && self.inOneRow(selected_items)
        button2.enabled=true
        button3.enabled=true
      elsif
      selected_items.length != 4 && selected_items.length % 4 == 0 && self.inRows(selected_items)
        button2.enabled=false
        button3.enabled=true
      end
    end

    @table.connect(SEL_DESELECTED) do |sender, sel, pos|
      selected_items.delete([pos.row, pos.col])
      button2.enabled = false
      button3.enabled = false
    end

    #Область ДНА
    bottom_area = FXHorizontalFrame.new(tab1_contents, FRAME_THICK|LAYOUT_FILL_X|LAYOUT_SIDE_BOTTOM)
    @page_label = FXLabel.new(bottom_area, "Страница: #{@cur_page} из #{@count_pages}")

    arrow = FXHorizontalFrame.new(bottom_area, LAYOUT_CENTER_X)
    arrow.padRight = 130
    btn_back = FXArrowButton.new(arrow, nil, 0, FRAME_RAISED|FRAME_THICK|ARROW_LEFT|LAYOUT_FIX_WIDTH,:width => 60)
    btn_back.connect(SEL_COMMAND) do
      if @cur_page != 1
        @cur_page -= 1
        refresh
        update_page_label

      end
    end
    btn_front = FXArrowButton.new(arrow, nil, 0, FRAME_RAISED|FRAME_THICK|ARROW_RIGHT|LAYOUT_FIX_WIDTH,:width => 60)
    btn_front.connect(SEL_COMMAND) do
      if @cur_page < (@count_students / @students_in_page.to_f).ceil
        @cur_page += 1
        refresh
        update_page_label
      end
    end
  end

  def update_page_label
    @page_label.text = "Страница: #{@cur_page} из #{@count_pages}"
  end

  #Сортировка по названиям колонок
  def sort_table_by_column(table, column_index)
    table_data = []
    (0...table.getNumRows).each do |row_index|
      if table.getItemText(row_index, column_index)!= nil
        row=[]
        (0...table.getNumColumns).each do |col_index|
          row[col_index] = table.getItemText(row_index, col_index)
        end
        table_data<<row
      end
    end
    sorted_table_data = table_data.sort_by { |row_data| row_data[column_index] }
    sorted_table_data.each_with_index do |row_data, row_index|
      row_data.each_with_index do |cell_data, col_index|
        table.setItemText(row_index, col_index, cell_data)
      end
    end
  end

  # Активация/Деактивация кнопочек
  def inRows(arr_rows_cols)
    arr = []
    arr_rows_cols.each do |el|
      arr << el[0]
    end
    counts = arr.group_by(&:itself).map { |k, v| [v.count] if v.count != 4}.compact
    counts.empty?()
  end

  def inOneRow(arr_rows_cols)
    row = arr_rows_cols[0][0]
    arr_rows_cols.each do |el|
      return false if row != el[0]
    end
  end

  #Функция создающая radiobutton
  def radiobtn(input_frame, input)

    check_button_lines = FXHorizontalFrame.new(input_frame)

    radio1 = FXRadioButton.new(check_button_lines, "Да")
    radio2 = FXRadioButton.new(check_button_lines, "Нет")
    radio3 = FXRadioButton.new(check_button_lines, "Не важно")

    radio1.connect(SEL_COMMAND) do
      input.enable
      if radio1.checked?
        radio2.check = false
        radio3.check = false
      end
    end

    radio2.connect(SEL_COMMAND) do
      input.disable
      if radio2.checked?
        radio1.check = false
        radio3.check = false
      end
    end

    radio3.connect(SEL_COMMAND) do
      input.disable
      if radio3.checked?
        radio1.check = false
        radio2.check = false
      end
    end
  end

  def self.update_data_table(table_self, new_table)
    row_number = 0
    (0...table_self.getNumRows).each do |row|
      (0...table_self.getNumColumns).each do |col|
        table_self.setItemText(row, col, "")
      end
    end
    new_table.each do |row|
      (0..3).each { |index_field| table_self.setItemText(row_number, index_field, row[index_field].to_s)  }
      row_number += 1
    end
  end

  def set_table_data(table)
    MyWindow.update_data_table(@table, table)
  end

  def refresh
    @controller.refresh_data(@cur_page, @students_in_page)
  end

  def create
    super
    refresh
    show(PLACEMENT_SCREEN)
  end
end

# Создание приложения
app = FXApp.new

# Создание главного окна
MyWindow.new(app)

# Запуск главного цикла приложения
app.create
app.run