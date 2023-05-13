#Паттерн паттерн(шаблон)
class Car
  def drive
    puts "Driving a car"
  end
end

class Motorcycle
  def drive
    puts "Riding a motorcycle"
  end
end

class VehicleFactory
  def create_vehicle(type)
    case type
    when :car
      Car.new
    when :motorcycle
      Motorcycle.new
    else
      raise "Unknown vehicle type: #{type}"
    end
  end
end

factory = VehicleFactory.new
vehicle1 = factory.create_vehicle(:car)
vehicle1.drive
vehicle2 = factory.create_vehicle(:motorcycle)
vehicle2.drive
