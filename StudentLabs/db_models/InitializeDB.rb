require 'sqlite3'
require_relative '../students/student'
require_relative '../students/student_short'

# Создаем объект подключения к базе данных SQLite3
db = SQLite3::Database.new('C:\Users\artus\RubymineProjects\Patterns\db_models\students.db')

# Выполняем скрипт создания таблицы
#create_table_script = File.read('C:\Users\artus\RubymineProjects\Patterns\db_models\sql\create_student_table.sql')
#db.execute_batch(create_table_script)

# Выполняем скрипт заполнения данных
#insert_data_script = File.read('C:\Users\artus\RubymineProjects\Patterns\db_models\sql\insert_student_data.sql')
#db.execute_batch(insert_data_script)

puts db.execute('select * from students')
#db.close
