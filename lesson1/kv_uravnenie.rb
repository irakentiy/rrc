puts "a"
a = gets.chomp
a = a.to_f
puts "b"
b = gets.chomp
b = b.to_f
puts "c"
c = gets.chomp
c = c.to_f
d = b**2 - 4 * a * c
if d > 0 
x1 = (-b + c) / (2 * a)
x2 =(-b - c) / (2 * a)
print " x1 = #{x1}. x2 = #{x2}"
end
if d == 0
x1 = –b / (2 * a)
x2 = x1
print " x1 = #{x1}. x2 = #{x2}"
end
if d < 0
print " no "
end