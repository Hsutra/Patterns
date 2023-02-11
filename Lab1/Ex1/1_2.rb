a = ARGV[0]
puts "Здравствуй #{ARGV[0]}"
puts "Какой твой любимый язык программирования?"
case STDIN.gets.chomp
when "Ruby"
	puts "Подлиза"
when "C++"
	puts "Забавно"
when "Python"
	puts "Слабый"
else puts "Скоро будет Ruby:)"
end
