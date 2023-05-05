load("RubyLabs/Lab2/Ex2/student_super.rb")

class Student < Student_super

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

  def get_Info
    "ФИО: #{@fullname}. Гит: #{@git} Контакт: #{@contact}"
  end
end

