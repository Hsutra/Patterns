require_relative '../data_models/Student_list_super'
require_relative '../data_models/Student_list_JSON'
require_relative '../students/student'

stud = Student.new(surname: "Иванов", name: "Иван", father_name: "Иванович", phone: '+79881238011', telegram: '@fsfddd', email: 'abc@mail.com', git: 'hggv.git')
studsh = StudentShort.from_student(stud)