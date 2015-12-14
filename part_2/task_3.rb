ary = [0]
fib = [0,1]
i = 2

while i < 101
  fib[i] = fib[i-1] + fib[i-2]
  ary << fib[i]
  i += 1
end
