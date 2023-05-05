class Student_super

    attr_accessor :id, :phone, :telegram, :email, :git
    
    def fullname
        "#{surname} #{name[0]}. #{father_name[0]}."
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
        @git = git
    end


end
