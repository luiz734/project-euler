local M = {}
M.fibs = {}

function M:fibonacci(n)
    if n == 1 or n == 2 then
        return n
    else
        if not self.fibs[n] then
            self.fibs[n] = self:fibonacci(n - 1) + self:fibonacci(n - 2)
        end
        return self.fibs[n]
    end
end

return M
