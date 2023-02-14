#2.2 Количество нечетных цифр числа больших 3

def kol(x)
	k = 0
	while x != 0
		s = x % 10
		if(s % 2 != 0 and s > 3)
			k += 1
		end
		x /= 10
	end
	return k
end

puts kol(456789123)
