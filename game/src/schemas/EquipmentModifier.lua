
local class = require 'middleclass'

-- スキーマ
local Schema = class 'EquipmentModifier'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    self.strength = t.strength or 0
    self.attacktimes = t.attacktimes or 0
end

-- オーバーライド：呼び出し
function Schema:__call(...)
    return self:modify(...)
end

-- オーバーライド：加算
function Schema:__add(other)
    if type(other) == 'table' then
        return self:modify(other)
    else
        error('Not an instance of EquipmentModifier')
    end
end

-- オーバーライド：比較
function Schema:__eq(other)
    return self.strength == other.strength and self.attacktimes == other.attacktimes
end

-- 修正
function Schema:modify(t)
    t = t or {}

    local mod = {}

    mod.strength = self.strength + (t.strength or 0)
    mod.attacktimes = self.attacktimes + (t.attacktimes or 0)

    return Schema(mod)
end

return Schema
