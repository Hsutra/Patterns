def min(a)
	min = a[0]
  	for i in 0...a.size
    	if (a[i] < min)
    		min = a[i]
    	end
  end
  return min
end

def max(a)
	max = 0
 	for i in 0..a.size-1
    	if (a[i] > max)
      		max = a[i]
    	end
  	end
  	return max
end

def first_positive(a)
	k = 0
	for i in 0..a.size
    	if(a[i] > 0)
    		k = i
    		break
    	end
    end
    return k
end


path = ARGV[0]
file = File.new(path,"r:UTF-8")
arr = Array.new(file.readline.split.map(&:to_i))
puts "\nПолученный массив:", arr, "\n"
if(ARGV[1] == "1")
	puts "Результат: Минимальный элемент массива: ", min(arr)
elsif(ARGV[1] == "2")
	puts "Результат: Максимальный элемент массива: ", max(arr)
elsif(ARGV[1] == "3")
	if(first_positive(arr) == 0)
		puts "В массиве нету положительных элементов"
	else
		puts "Результат: Номер первого положительного элемента:", first_positive(arr)
	end
else 
	puts "Результат: Чел, собирай утром рюкзачек и иди на алгебру"
end

def cyclic_shift(mass) #сдвигает элементы массива на один в право
	return mass[0...-1].unshift(mass[-1])
end

def count_evan(mass) #возвращает количество четных элементов
	return mass.reduce(0) {|count, x| x % 2 == 0 ? count+=1 : count}
end

def count_min_el(mass) #возвращает количество минимальных элементов
	min = mass.min
	return mass.reduce(0) {|count, x| min == x ? count+=1 : count} 
end 

def sort_by_count(mass) #сортирует по частоте встречаемости элементов (по убыванию)
	return mass.sort_by {|x| mass.count(x)}.reverse
end

def select_method(num_method, file_name) #функция принимает два значения номер функция и имя файла (путь) с массивом чисел возвращает значение выбраной функции указаного массива 
	mass = IO.read(file_name).split.map(&:to_i)
	case num_method
		when "1"
			return cyclic_shift(mass)
		when "2"
			return count_evan(mass)
		when "3"
			return count_min_el(mass)
		when "4" 
			return sort_by_count(mass)
	end
end

puts select_method(ARGV[0], ARGV[1])
