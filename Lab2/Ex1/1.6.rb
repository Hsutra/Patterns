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
end


student1 = Student.new(id:1, surname: "Абуюков", name: "Эуфар", father_name: "Маратович")
puts student1
