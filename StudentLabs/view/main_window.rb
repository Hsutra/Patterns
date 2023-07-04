# frozen_string_literal: true
require 'fox16'
require_relative 'student_list_view'
require_relative '../controller/student_list_controller'
include Fox

#view = Student_list_controller.new(MyWindow)

# Создание приложения
app = FXApp.new

# Создание главного окна
MyWindow.new(app)

# Запуск главного цикла приложения
app.create
app.run