class Student

	attr_accessor :id, :surname, :name, :father_name, :phone, :telegram, :email, :git

	def initialize(surname:, name:, father_name:, id:nil, phone:nil, telegram:nil, email:nil, git:nil)
		
		if(id != nil)
			if(id.class != Integer)
				raise ArgumentError, "Формат индентификационного номера неверный!"
			end
		end

		if(surname == nil or name == nil or father_name == nil)
			raise ArgumentError, "ФИО не задано!"
		end

		if(phone != nil)
			if (is_right_phone(phone) == false)
				raise ArgumentError, "Формат номера телефона неверный!"
			end
		end
		
		if(telegram != nil)
			if(is_right_telegram == false)
				raise ArgumentError, "Формат ссылки на телеграм неверный!"
			end
		end
				
		if(email != nil)
			if(is_right_email == false)
				raise ArgumentError, "Формат почты неверный!"
			end
		end

		if(git != nil)
			if(is_right_git == false)
				raise ArgumentError, "Формат гита неверный!"
			end
		end

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

  	def is_right_phone(phone)
  		if phone =~ /^((8|\+7))\d{10}$/ then
  			return true
  		else 
  			return false
  		end
	end
	
	def is_right_telegram(telegram)
		if telegram =~ /^https:\/\/t.me\//
			return true
		else 
			return false
		end
	end

	def is_right_email(email)
		if email =~ /(@gmail\.com)$/
			return true
		else 
			return false
		end
	end

	def is_right_git(git)
		if git =~ /^https:\/\/github\.com/
			return true
		else
			return false
		end
	end

	def validate_contacts()
		if self.phone or self.email or self.telegram
			return true
		else
			return false
		end
	end

	def validate_git()
		if self.git
			return true
		else 
			return false
		end
	end

	def validate()
		if validate_git or validate_contacts
			return true
		else 
			return false
		end
	end

end


