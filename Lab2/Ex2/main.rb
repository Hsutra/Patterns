load('RubyLabs/student_short.rb')
load('RubyLabs/student.rb')

first_stud = Student.new(id:"1", surname: "Иванов", name: "Иван", father_name: "Иванович", phone: "89182338282", git: "https://github.com/fds", telegram:"https://t.me/asd")

short_stud = Student_short.from_student(first_stud)

puts short_stud
