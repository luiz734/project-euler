--[[
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
]]


--[[
    2, 3, 5, 7, 11, 13, 17, 19

    4 = 2 * 2
    6 = 3 * 2
    8 = 2 * 2 * 2
    9 = 3 * 3
    10 = 5 * 2
    12 = 3 * 2 * 2
    14 = 7 * 2
    15 = 5 * 3
    16 = 2 * 2 * 2 * 2
    18 = 2 * 3 * 3
    20 = 2 * 2 * 5
--]]

-- local primes = {2, 3, 5, 7} -- 11, 13, 17}
-- local numbers = {4, 6, 8, 9, 10, 12, 14, 15, 16, 18, 20}
--

local inspect = require 'inspect'

local function get_prime_factors(n)
    local factors = {}
    while n % 2 == 0 do
        n = n // 2
        table.insert(factors, 2)
    end
    local factor = 3

    local max_factor = math.floor(math.sqrt(n))
    while n > 1 and factor <= max_factor do
        while n % factor == 0 do
            table.insert(factors, factor)
            n = n // factor
            max_factor = math.floor(math.sqrt(n))
        end
        -- skip even numbers
        factor = factor + 2
    end
    table.insert(factors, n)
    return factors
end

local up_to = 20
local prime_factos = {}
local prime_count = {}
for i = 1, up_to do
    table.insert(prime_factos, get_prime_factors(i))
    table.insert(prime_count, 0)
end

for i = 1, up_to do
    local current_count = {}
    for _ = 1, up_to do
        table.insert(current_count, 0)
    end
    for j, p in ipairs(prime_factos[i]) do
        current_count[p] = current_count[p] + 1
    end

    for j, p in ipairs(prime_factos[i]) do
        if current_count[p] > prime_count[p] then
            prime_count[p] = current_count[p]
        end
    end
end
local n = 1
for i, p in ipairs(prime_count) do
    while p > 0 do
        -- print(string.format("%s = %s * %s", n,n, i))
        n = n * i
        p = p - 1
    end
end

print(n)

os.exit(1)


-- bad way
local i = 2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 + 10
while true do
    local found = true
    print(i)
    for j = 20, 2, -1 do
        if i % j ~= 0 then
            found = false
            break
        end
    end
    if found then
        print(i)
        break
    end
    i = i + 20
end
