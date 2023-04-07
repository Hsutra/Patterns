class Student

  attr_accessor :id, :surname, :name, :father_name, :phone, :telegram, :email, :git

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

  def self.is_right_ID(id)
    id.match /^[0-9]$/
  end

  def id=(id)
    raise ArgumentError,"Формат индентификационного номера неверный!" if !id.nil? && !Student.is_right_ID(id)
    @id=id
  end

  def self.is_right_FIO(fio)
    fio.match /^[ЁёА-я]+$/ #только символы внутри регулярки
  end

  def surname=(surname)
    raise ArgumentError,"Формат фамилии неверный!" if !Student.is_right_FIO(surname)
    @surname=surname
  end
  
  def name=(name)
    raise ArgumentError,"Формат имени неверный!" if !Student.is_right_FIO(name)
    @name=name
  end
  
  def father_name=(father_name)
    raise ArgumentError,"Формат отчества неверный!" if !Student.is_right_FIO(father_name)
    @father_name=father_name
  end

  def self.is_right_phone(phone)
    phone.match /^((8|\+7))\d{10}+$/ 
  end

  def phone=(phone)
    raise ArgumentError,"Формат номера телефона неверный!" if !phone.nil? && !Student.is_right_phone(phone)
    @phone = phone
  end
  
  def self.is_right_telegram(telegram)
    telegram.match /^https:\/\/t.me\// 
  end

  def telegram=(telegram)
    raise ArgumentError,"Формат телеграма неверный!" if !telegram.nil? && !Student.is_right_telegram(telegram)
    @telegram = telegram
  end
  
  def self.is_right_email(email)
    email.match /(@gmail\.com)$/
  end

  def email=(email)
    raise ArgumentError,"Формат почты неверный!" if !email.nil? && !Student.is_right_email(email)
    @email = email
  end  

  def self.is_right_git(git)
    git.match /^https:\/\/github\.com/
  end

  def git=(git)
    raise ArgumentError,"Формат гита неверный!" if !git.nil? && !Student.is_right_git(git)
    @telegram = telegram
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
    self.telegram = telegram if(telegram) != nil)
    self.email = email if(email != nil)
  end

end
