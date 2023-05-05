load("RubyLabs/Lab2/Ex2/student_super.rb")

class Student_short < Student_super

  attr_accessor :fullname, :contact
  
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
    contact = "#{student.phone} #{student.telegram} #{student.email}"
    Student_short.new(id:student.id, fullname: student.fullname, git: student.git, contact: contact)
  end
  
  def to_s
    "ID: #{@id}, ФИО: #{@fullname}, Гит: #{git}, Контакт: #{contact}"
  end
  
end

