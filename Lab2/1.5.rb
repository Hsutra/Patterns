class Student

	attr_accessor :id, :surname, :name, :father_name, :phone, :telegram, :email, :git

	def initialize(id:nil, surname:, name:, father_name:, phone:nil, telegram:nil, email:nil, git:nil)
		self.id
		self.surname = surname
		self.name = name
		self.father_name = father_name
		self.phone
		self.telegram
		self.email
		self.git
	end
	 
	def to_s
    	"ID: #{@id}, Фамилия: #{@surname}, Имя: #{@name}, Отчество: #{@father_name}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}\n"
  	end

end

student1 = Student.new(surname:"Абуюков", name:"Эуфар", father_name:"Маратович")
