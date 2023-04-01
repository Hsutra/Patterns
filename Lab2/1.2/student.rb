class Student 

	def initialize(surname, name, father_name)
		@id
		@surname = surname
		@name = name
		@father_name = father_name
		@phone
		@telegram
		@email
		@git
	end
	
	def getid
		@id
	end

	def setid(id)
		@id = id
	end
	
	def getsurname
		@surname
	end

	def setsurname(surname)
		@surname = surname
	end
	
	def getname
		@name
	end

	def setname(name)
		@name = name
	end
	
	def getfather_name
		@father_name
	end

	def setfather_name(father_name)
		@father_name = father_name
	end
	
	def getphone
		@phone
	end
	def setphone(phone)
		@phone = phone
	end
	
	def gettelegram
		@telegram
	end
	def settelegram(telegram)
		@telegram = telegram
	end
	
	def getemail
		@email
	end

	def setemail(email)
		@email = email
	end
	
	def getgit
		@git
	end

	def setgit(git)
		@git = git
	end
	
	def to_s
    	"ID: #{@id}, Фамилия: #{@surname}, Имя: #{@name}, Отчество: #{@father_name}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}\n"
  	end

 end
