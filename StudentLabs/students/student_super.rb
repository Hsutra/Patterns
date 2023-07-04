class StudentSuper

    attr_accessor :id, :phone, :telegram, :email, :git

    def self.is_right_ID(id)
        Integer(id) rescue false
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
        phone.match /^((8|\+7))\d{10}/
    end

    def phone=(phone)
        raise ArgumentError,"Формат номера телефона неверный! #{phone}" if !phone.nil? && !Student.is_right_phone(phone)
        @phone = phone
    end

    def self.is_right_telegram(telegram)
        telegram.match /\A@/
    end

    def telegram=(telegram)
        raise ArgumentError,"Формат телеграма неверный!" if !telegram.nil? && !Student.is_right_telegram(telegram)
        @telegram = telegram
    end

    def self.is_right_email(email)
        email.match /(@mail\.com)$/
    end

    def email=(email)
        raise ArgumentError,"Формат почты неверный!" if !email.nil? && !Student.is_right_email(email)
        @email = email
    end

    def self.is_right_git(git)
        git.match /(\.git)$/
    end

    def git=(git)
        raise ArgumentError,"Формат гита неверный!" if !git.nil? && !Student.is_right_git(git)
        @git = git
    end

    def get_contact
        if phone.nil? && telegram.nil? && email.nil?
            nil
        else
            str = ""
            str += " phone: #{phone}" unless phone.nil?
            str += " telegram: #{telegram}" unless telegram.nil?
            str += " email: #{email}" unless email.nil?
            str
        end
    end
end
