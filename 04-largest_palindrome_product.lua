--[[
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.
]]


local function reverse(n)
    local reversed = 0
    while n > 0 do
        local digit = n % 10
        reversed = reversed * 10 + digit
        n = n // 10
    end
    return reversed
end

local function is_palindrome(n)
    return reverse(n) == n
end

--[[
    n = xyzzyx
    100000x + 10000y + 1000z + 100z + 10y + x
    100001x + 10010y + 1100z
    11(9091x + 910y + 100z)

    11 is a factor of n so 11 is also a factor of a or b
]]

local i = 999
local largest = 0
while i >= 100 do
    local decrement_j = 1
    local max_possible_j = 999
    -- if a not divides 11, b divides
    local b_divide_11 = i % 11 ~= 0
    -- if b divides, then can check each 11
    if b_divide_11 then
        decrement_j = 11
        max_possible_j = 990 -- 11 * 90
    end

    local j = max_possible_j
    while j > 110 do -- min possible j
        local product = i * j
        -- can break because next value should be also lesser
        if product < largest then
            break
        end
        if is_palindrome(product) then
            largest = product
            -- print(i, j, largest)
        end
        j = j - decrement_j
    end
    i = i - 1
end

print(largest)

-- using string
-- local function is_palindrome(n)
--     local as_str = tostring(n)
--     for i = 1, #as_str // 2 do
--         local a = as_str:sub(i, i)
--         local b = as_str:sub(#as_str - i + 1, #as_str - i + 1)
--         if a ~= b then
--             return false
--         end
--     end
--     return true
-- end

-- bad O(n²)
local largest = 0
for i = 999, 100, -1 do
    for j = 999, i, -1 do
        local product = i * j
        if reverse(product) and product > largest then
            largest = product
        end
    end
end
