require 'sqlite3'
require_relative '../students/student_short'
require_relative '../students/student'
require_relative '../data_models/Data_list_student_short'

class StudentListDB

    private_class_method :new

    def self.instance(db)
        @instance ||= new(db)
    end

    def initialize(db)
        @database_object = db
    end
    
    def get_student_by_id(id)
        @database_object.execute "select surname, first_name, father_name, phone, telegram, email, git from students where id=#{id}"
    end

    def get_k_n_student_short_list(k, n, datalist)
        #@database_object.execute("select surname, first_name, father_name, phone, telegram, email, git from students limit ?, ?", (k - 1), n)
        students = @database_object.execute('SELECT * FROM students LIMIT ?, ?',(k - 1) * n, n)
        student_short = students.map{|st| StudentShort.from_student(Student.new(id: st[0],surname: st[1], name: st[2], father_name: st[3], phone: st[4], telegram: st[5], email: st[6], git: st[7]))}
        datalist.get_new_list(student_short)
        datalist
    end


    def insert_student(object)
        values = object.to_s.split(",")
        values.shift
        result = values.map { |item| item.split(":").last}
        query = "insert into students (surname, first_name, father_name, phone, telegram, email, git) values (?, ?, ?, ?, ?, ?, ?)"
        @database_object.execute(query, [result[0], result[1], result[2], result[3], result[4], result[5], result[6]]) 
    end

    def replace_student_by_id(id, object)
        values = object.to_s.split(",")
        values.shift
        result = values.map { |item| item.split(":").last}
        query = 'update students set surname = ?, first_name = ?, father_name = ?, phone = ?, telegram = ?, email = ?, git = ? where id = ?'
        @database_object.execute(query, [result[0], result[1], result[2], result[3], result[4], result[5], result[6], id]) 
    end

    def delete_student_by_id(id)
        @database_object.execute "delete from students where id=#{id}"
    end

    def get_student_count
        @database_object.execute "select count(*) from students"
    end
end
