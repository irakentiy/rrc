string_AZ = Hash[('a'..'z').to_a.zip((1..26).to_a)]
volwes = ["a", "o", "e", "u", "i"]
result = {}
volwes.each do |i| 
  result[i] = string_AZ[i]
end
puts result
