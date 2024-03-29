
local lume = require 'lume'
local util = require 'util'

-- 数値
local Clamp = {}

-- 初期化
function Clamp:initializeClamp(t)
    t = t or {}

    if type(t) == 'number' then
        t = { value = t, min = t, max = t }
    end

    self.min = t.min or 0
    self.max = t.max or 0
    self.value = self:clamp(t.value or 0)
end

-- オーバーライド：文字列化
function Clamp:__tostring()
    return tostring(self.value)
end

-- 同じ範囲かどうか
function Clamp:isSameRange(t)
    t = t or {}
    return self.min == t.min and self.max == t.max
end

-- 範囲内に収める
function Clamp:clamp(v)
    return lume.clamp(v, self.min, self.max)
end

-- オーバーライド：符号反転
function Clamp:__unm()
    return self.class { value = -self.value, min = self.min, max = self.max }
end

-- オーバーライド：加算
function Clamp:__add(other)
    if type(other) == 'number' then
        return self.class { value = self:clamp(self.value + other), min = self.min, max = self.max }
    elseif self.class:isInstance(other) then
        if self:isSameRange(other) then
            return self.class { value = self:clamp(self.value + other.value), min = self.min, max = self.max }
        else
            error('Not a same range')
        end
    else
        error('Not an operational value')
    end
end

-- オーバーライド：減算
function Clamp:__sub(other)
    if type(other) == 'number' then
        return self.class { value = self:clamp(self.value - other), min = self.min, max = self.max }
    elseif self.class:isInstance(other) then
        if self:isSameRange(other) then
            return self.class { value = self:clamp(self.value - other.value), min = self.min, max = self.max }
        else
            error('Not a same range')
        end
    else
        error('Not an operational value')
    end
end

-- オーバーライド：比較
function Clamp:__eq(other)
    return self.value == other.value and self:isSameRange(other)
end

return Clamp
