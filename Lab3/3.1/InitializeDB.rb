require 'sqlite3'
require_relative '../../Lab2/Ex2/student'
require_relative '../../Lab2/Ex2/student_short'
require_relative 'StudentListDB'

# Устанавливаем путь к файлу базы данных SQLite3

db_path = 'C:\Users\artus\RubymineProjects\RubyPatterns\Lab3\3.1\studentshort.db'

# Создаем объект подключения к базе данных SQLite3

db = SQLite3::Database.new(db_path)

# Выполняем скрипт создания таблицы

#create_table_script = File.read('C:\Users\artus\RubymineProjects\RubyPatterns\Lab3\3.1\sql\create_student_short_table.sql')
#db.execute_batch(create_table_script)

# Выполняем скрипт заполнения данных

#insert_data_script = File.read('C:\Users\artus\RubymineProjects\RubyPatterns\Lab3\3.1\sql\insert_student_short_data.sql')
#db.execute_batch(insert_data_script)

#student1 = Student.new(surname: "Иванов", name: "Иван", father_name: "Иванович", phone: "89182338282", git: "https://github.com/fds")

#sldb = StudentListDB.instance(db)
#n = sldb.get_student_count[0][0]
#db.execute('select surname, first_name, father_name, phone, telegram, email, git from students where id=1')

#sldb.insert(student1)
#sldb.replace_by_id(6, student1)
#result = db.execute('SELECT * FROM students')
#puts result
db.close
