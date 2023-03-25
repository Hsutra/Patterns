def min(a)
	min = a[0]
  	for i in 0..a.size
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
