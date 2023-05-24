load("C:/Users/artus/VsCodeProjects/RubyLabs/Lab2/Ex4/Student_list_strategy.rb")
require 'json'

class StudentListJson<StudentListStrategy
  public_class_method :new

  #получение массива хэшей из строки
  def list_hash_from_str(str)
    JSON.parse(str,  {symbolize_names: true })
  end

  #получение строки заданного вида из массива хэшей
  def list_hash_to_str(list_hash)
    JSON.generate(list_hash)
  end

end
