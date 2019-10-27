
-- 数値
local Numeric = {}

-- 初期化
function Numeric:initializeNumeric(v)
    self.value = v or 0
end

-- オーバーライド：加算
function Numeric:__add(other)
    if type(other) == 'number' then
        return self.class(math.floor(self.value + other))
    elseif self.class:isInstance(other) then
        print(self, other)
        return self.class(math.floor(self.value + other.value))
    else
        error('Not an operational value')
    end
end

-- オーバーライド：減算
function Numeric:__sub(other)
    if type(other) == 'number' then
        return self.class(math.floor(self.value - other))
    elseif self.class:isInstance(other) then
        return self.class(math.floor(self.value - other.value))
    else
        error('Not an operational value')
    end
end

-- オーバーライド：乗算
function Numeric:__mul(other)
    if type(other) == 'number' then
        return self.class(math.floor(self.value * other))
    elseif self.class:isInstance(other) then
        return self.class(math.floor(self.value * other.value))
    else
        error('Not an operational value')
    end
end

-- オーバーライド：除算
function Numeric:__div(other)
    if type(other) == 'number' then
        return self.class(math.floor(self.value / other))
    elseif self.class:isInstance(other) then
        return self.class(math.floor(self.value / other.value))
    else
        error('Not an operational value')
    end
end

-- オーバーライド：剰余
function Numeric:__mod(other)
    if type(other) == 'number' then
        return self.class(math.floor(self.value % other))
    elseif self.class:isInstance(other) then
        return self.class(math.floor(self.value % other.value))
    else
        error('Not an operational value')
    end
end

-- オーバーライド：累乗
function Numeric:__pow(other)
    if type(other) == 'number' then
        return self.class(math.floor(self.value ^ other))
    elseif self.class:isInstance(other) then
        return self.class(math.floor(self.value ^ other.value))
    else
        error('Not an operational value')
    end
end

-- オーバーライド：比較
function Numeric:__eq(other)
    return self.value == other.value
end

-- オーバーライド：より小さい
function Numeric:__lt(other)
    return self.value < other.value
end

-- オーバーライド：以下
function Numeric:__le(other)
    return self.value <= other.value
end

return Numeric
