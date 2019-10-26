
local class = require 'middleclass'
local lume = require 'lume'

-- スキーマ
local Schema = class 'ArmorClass'

-- インスタンスかどうか調べる
function Schema.static.isInstance(self, v)
    return lume.call(v.isInstanceOf, v, self)
end

-- 初期化
function Schema:initialize(v)
    self.value = v or 0
end

-- オーバーライド：文字列化
function Schema:__tostring()
    if self.value <= -10 then
        return 'LO'
    else
        return tostring(self.value)
    end
end

-- オーバーライド：加算
function Schema:__add(other)
    if type(other) == 'number' then
        return Schema(math.floor(self.value + other))
    elseif Schema:isInstance(other) then
        return Schema(math.floor(self.value + other.value))
    else
        error('Not an operational value')
    end
end

-- オーバーライド：減算
function Schema:__sub(other)
    if type(other) == 'number' then
        return Schema(math.floor(self.value - other))
    elseif Schema:isInstance(other) then
        return Schema(math.floor(self.value - other.value))
    else
        error('Not an operational value')
    end
end

-- オーバーライド：乗算
function Schema:__mul(other)
    if type(other) == 'number' then
        return Schema(math.floor(self.value * other))
    elseif Schema:isInstance(other) then
        return Schema(math.floor(self.value * other.value))
    else
        error('Not an operational value')
    end
end

-- オーバーライド：除算
function Schema:__div(other)
    if type(other) == 'number' then
        return Schema(math.floor(self.value / other))
    elseif Schema:isInstance(other) then
        return Schema(math.floor(self.value / other.value))
    else
        error('Not an operational value')
    end
end

-- オーバーライド：剰余
function Schema:__mod(other)
    if type(other) == 'number' then
        return Schema(math.floor(self.value % other))
    elseif Schema:isInstance(other) then
        return Schema(math.floor(self.value % other.value))
    else
        error('Not an operational value')
    end
end

-- オーバーライド：累乗
function Schema:__pow(other)
    if type(other) == 'number' then
        return Schema(math.floor(self.value ^ other))
    elseif Schema:isInstance(other) then
        return Schema(math.floor(self.value ^ other.value))
    else
        error('Not an operational value')
    end
end

-- オーバーライド：比較
function Schema:__eq(other)
    return self.value == other.value
end

-- オーバーライド：より小さい
function Schema:__lt(other)
    return self.value < other.value
end

-- オーバーライド：以下
function Schema:__le(other)
    return self.value <= other.value
end

return Schema
