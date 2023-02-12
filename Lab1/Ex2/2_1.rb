#2.1 Сумма простых делителей числа

def prost(x)
	k = 0
	for i in 1..x
		if(x % i == 0)
			k = k + 1
		end
	end
	if(k == 2)
		return true
	else 
		return false
	end
end

def sums(x)
	sum = 0
	for i in 2..x
		if(x % i == 0 and prost(i))
			sum += i
		end
	end
	return sum
end

puts sums(154)
