# frozen_string_literal: true
require 'minitest/autorun'
require_relative '../students/student'

class StudentTest < Minitest::Test

  def setup
    @student = Student.new(surname: 'Петров', name: 'Василий', father_name: 'Георгиевич', id: '1', phone: '89886288923', telegram: 'abc.tme', email: 'abc@gmail.com', git: 'abc.git')
  end

  def test_student_values
    assert_equal 'Петров', @student.surname
    assert_equal 'Василий', @student.name
    assert_equal 'Георгиевич', @student.father_name
    assert_equal '1', @student.id
    assert_equal '89886288923', @student.phone
    assert_equal 'abc.tme', @student.telegram
    assert_equal 'abc@gmail.com', @student.email
    assert_equal 'abc.git', @student.git
  end

  def test_fullname
    assert_equal 'Петров В. Г.', @student.fullname
  end

  def test_set_contacts
    assert_equal 'abc@gmail.com', @student.set_contacts(phone: @student.phone, telegram: @student.telegram , email: @student.email )
  end

  def test_get_info
    assert_equal 'Петров В. Г. git: abc.git phone: 89886288923 telegram: abc.tme email: abc@gmail.com', @student.get_info
  end

end


