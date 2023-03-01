#Написать методы, которые находят минимальный,элементы, номер первого положительного элемента. 
#Каждая операция в отдельном методе. Решить задачу с помощью циклов(for и while).

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
	max = a[0]
  	for i in 0..a.size-1
    	if (a[i] > max)
      		max = a[i]
    	end
  	end
  	return max
end

def first_positive(a)
	k = -1
	for i in 0..a.size
    	if(a[i] > 0)
    		k = i
    		break
    	end
    end
    if(k == -1)
    	return puts "Нету положительных элементов"
    else
    	return puts "Номер первого положительного элемента: #{k}"
    end
end

n = 30
a = Array.new(n)
for i in 0..a.size
	a[i] = Random.rand(-50..50)
end
puts a
puts "Минимальный элемент массива: #{min(a)}"
puts "Максимальный элемент массива: #{max(a)}"
first_positive(a)
