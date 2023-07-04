require_relative 'student_super'

class Student < StudentSuper

  attr_accessor :surname, :name, :father_name

  def initialize(surname:, name:, father_name:, id:nil, phone:nil, telegram:nil, email:nil, git:nil)
    self.id=id
    self.surname = surname
    self.name = name
    self.father_name = father_name
    self.phone=phone
    self.telegram=telegram
    self.email=email
    self.git=git
  end
   
  def to_s
    "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@name}, Отчество: #{@father_name}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}\n"
  end

  def validate_git?()
    @git!=nil
  end

  def validate_contacts?()
    @phone!=nil or @telegram!=nil or @email!=nil
  end

  def validate?()
    validate_contacts && validate_git
  end

  def set_contacts(phone:nil, telegram:nil, email:nil)
    self.phone = phone if(phone != nil)
    self.telegram = telegram if(telegram != nil)
    self.email = email if(email != nil)
  end

  def fullname
    "#{surname} #{name[0]}. #{father_name[0]}."
  end

  def get_info
    gith = "git: #{git}" unless git.nil?
    contact = "#{get_contact}" unless get_contact.nil?
    "#{fullname} #{gith}#{contact}"
  end
end

#stud1 = Student.new(surname: 'Петров', name: 'Василий', father_name: 'Георгиевич', id: '1', phone: '89886288923', telegram: 'abc.tme', email: 'abc@gmail.com', git: 'abc.git')
#puts stud1
#puts stud1.get_info