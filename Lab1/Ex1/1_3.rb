puts "Введите команду ОС Linux"
b = STDIN.gets.chomp
system b

puts "Введите команду языка Ruby"
c = STDIN.gets.chomp
system "ruby -e \'#{c}\'"
