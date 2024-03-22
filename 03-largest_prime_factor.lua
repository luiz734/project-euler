--[[
The prime factors of 13195 are 5, 7, 13, and 29.
What is the largest prime factor of the number 600851475143?
]]

local n = 600851475143
-- n = 999999000001
local factor = 2
local last_prime = 2

while n % 2 == 0 do
    n = n // 2
end
factor = 3

local max_factor = math.floor(math.sqrt(n))
while n > 1 and factor <= max_factor do
    while n % factor == 0 do
        n = n // factor
        last_prime = factor
        max_factor = math.floor(math.sqrt(n))
    end
    -- skip even numbers
    factor = factor + 2
end

last_prime = n > 1 and n or last_prime
print(last_prime)

-- bad solution O(n²)
-- local primes = {}
-- primes[1] = false
-- local target = 600851475143
-- local max_check = math.floor(math.sqrt(target))
--
-- for i = 2, max_check / 2 do
--     primes[i] = true
-- end
-- for i = 2, max_check / 2 do
--     for j = i + i, max_check / 2, i do
--         primes[j] = false
--     end
-- end
--
-- local i = #primes
-- while i > 1 do
--     if primes[i] and target % i == 0 then
--         print(i)
--         break
--     end
--     i = i - 1
-- end
