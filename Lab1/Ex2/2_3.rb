#Найти произведение таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа

def sum(x)
	s = 0
	while x != 0
		s += x % 10
		x /= 10
	end
	return s
end

def delitel(x)
	p = 1
	for i in 1..x
		if(x % i == 0 && sum(i) < sum(x))
			p *= i
		end
	end
	return p
end

puts delitel(6453)
