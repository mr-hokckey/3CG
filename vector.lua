-- Vector class from in-class coding.

Vector = {}

metatable = { -- Define Vector meta methods
  __call = function(self, a, b)
    local vec = {
      x = a or 0, -- if a or b are not given, it will default to 0
      y = b or 0  -- for more info, look up "lua ternary operator"
    }
    setmetatable(vec, metatable)
    return vec
  end,
  __add = function(a, b)
    if type(a) == "number" then return Vector(a + b.x, a + b.y) end
    if type(b) == "number" then return Vector(a.x + b, a.y + b) end
    return Vector(a.x + b.x, a.y + b.y)
  end,
  __sub = function(a, b)
    if type(a) == "number" then return Vector(a - b.x, a - b.y) end
    if type(b) == "number" then return Vector(a.x - b, a.y - b) end
    return Vector(a.x - b.x, a.y - b.y)
  end,
  __mul = function(a, b)
    if type(a) == "number" then return Vector(a * b.x, a * b.y) end
    if type(b) == "number" then return Vector(a.x * b, a.y * b) end
    return Vector(a.x * b.x, a.y * b.y)
  end,
  __eq = function(a, b)
    if type(a) ~= "table" or type(b) ~= "table" then return false end
    return a.x == b.x and a.y == b.y
  end,
  __tostring = function(a)
    return "(" .. tostring(a.x) .. ", " .. tostring(a.y) .. ")"
  end
}

setmetatable(Vector, metatable)
