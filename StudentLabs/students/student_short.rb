require_relative 'student_super'

class StudentShort < StudentSuper

  attr_accessor :fullname, :git, :contact
  
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
    contact = ["#{student.phone}", "#{student.telegram}", "#{student.email}"]
    contact = contact.sample
    fullname = "#{student.surname} #{student.name[0]}. #{student.father_name[0]}."
    StudentShort.new(id: student.id, fullname: fullname, git: student.git, contact: contact)
  end
  
  def to_s
    "ID: #{@id}, ФИО: #{@fullname}, Гит: #{git}, Контакт: #{contact}"
  end
  
end

