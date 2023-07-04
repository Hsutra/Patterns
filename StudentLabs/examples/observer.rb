# frozen_string_literal: true
class Subject
  attr_reader :state

  def initialize
    @state = nil
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def set_state(state)
    @state = state
    notify_observers
  end

  def notify_observers
    @observers.each { |observer| observer.update(self) }
  end
end

# Наблюдатель
class Observer
  def update(subject)
    puts "Изменилось состояние наблюдаемого объекта: #{subject.state}"
  end
end

# Создание наблюдаемого объекта и наблюдателей
subject = Subject.new
observer1 = Observer.new
observer2 = Observer.new

# Регистрация наблюдателей у наблюдаемого объекта
subject.add_observer(observer1)
subject.add_observer(observer2)

# Установка состояния наблюдаемого объекта
subject.set_state("Состояние 1")

# Удаление одного из наблюдателей
subject.remove_observer(observer2)

# Изменение состояния наблюдаемого объекта
subject.set_state("Состояние 2")

