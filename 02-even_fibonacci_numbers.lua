--[[
Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be: 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
]]

local f = require 'util.fibonacci'

local n = 1
local sum_even = 0
local fib_n = f:fibonacci(n)
while fib_n < 4000000 do
    fib_n = f:fibonacci(n)
    if fib_n % 2 == 0 then
        sum_even = sum_even + fib_n
    end

    n = n + 1
end

print(sum_even)
