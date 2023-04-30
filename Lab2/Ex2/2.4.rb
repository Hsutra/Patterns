
class Student_short

  attr_accessor :id, :fullname, :git, :contact
  
  def initialize(id:nil, fullname:nil, git:nil, contact:nil)
    self.id = id
    self.fullname = fullname
    self.git = git
    self.contact = contact
  end

  def self.from_str(id, str)
    parts = str.split(",")
    namepart = parts[0].split(" ")
    Student_short.new(id:id, fullname:"#{namepart[0]} #{namepart[1][0]}.#{namepart[2][0]}.", git: parts[1], contact: parts[2])
  end

  def self.from_student(student)
    id = student.id
    fullname = "#{student.surname} #{student.name[0]}. #{student.father_name[0]}."
    git = student.git
    contact = "#{student.phone} #{student.telegram} #{student.email}"
    Student_short.new(id:id, fullname: fullname, git: git, contact: contact)
  end

  def to_s
    "ID: #{@id}, ФИО: #{@fullname}, Гит: #{git}, Контакт: #{contact}"
  end
  
end
