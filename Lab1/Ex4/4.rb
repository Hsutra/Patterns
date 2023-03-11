arr = [12,76,2,98,2,23,19,77,123,4,99,12,12,43,2,2]

#7 Циклический сдвиг эелементов массива вправо на 2
puts arr[0..arr.size-3].unshift(arr[-2..arr.size-1])

#19 Циклический сдвиг эелементов массива вправо на 1
puts arr[0..arr.size-2].unshift(arr[-1])

#31 Количество четных элементов 43 55 
puts arr.reduce(0) {|count, x| x % 2 == 0 ? count+=1 : count}

#43 Количество минимальных элементов
min = arr.min
puts arr.reduce(0) {|count, x| min == x ? count+=1 : count} 

#55 Построить новый массив состоящий из упорядоченных по встречаемости эл-тов первого
puts arr.sort_by {|x| arr.count(x)}.reverse
