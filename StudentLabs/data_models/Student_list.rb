# frozen_string_literal: true
class StudentList

  def initialize(adapter)
    @adapter = adapter
  end

  #Получение студента по id
  def get_student_by_id(id)
    @adapter.get_student_by_id(id)
  end

  #Получение k из n элементов
  def get_k_n_student_short_list(k, n, data_list)
    @adapter.get_k_n_student_short_list(k, n, data_list)
  end

  #добавление студента
  def insert_student(student)
    @adapter.insert_student(student)
  end

  #Удаление студента
  def delete_student_by_id(id)
    @adapter.delete_student_by_id(id)
  end

  #Изменение студента
  def replace_student_by_id(id)
    @adapter.replace_student(id)
  end

  def get_student_count
    @adapter.get_student_count[0][0]
  end

end
