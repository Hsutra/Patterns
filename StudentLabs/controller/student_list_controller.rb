# frozen_string_literal: true
require_relative '../data_models/Data_list_student_short'
require_relative '../data_models/Student_list'
require_relative '../db_models/StudentListDB'
require 'sqlite3'

class Student_list_controller

  def initialize(view)
    @view = view
    db = SQLite3::Database.new('C:\Users\artus\RubymineProjects\Patterns\db_models\students.db')
    @student_list = StudentList.new(StudentListDB.instance(db))
    @data_list = Data_list_student_short.new([])
    @data_list.add_observer(@view)
  end
  
  def refresh_data(k, n)
    @data_list = @student_list.get_k_n_student_short_list(k, n, @data_list)
  end

  def count_students
    @student_list.get_student_count
  end
end





