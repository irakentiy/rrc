fibo = [0, 1]
while (result = fibo[-1] + fibo[-2]) < 100
  fibo << result
end
puts fibo
