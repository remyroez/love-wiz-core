
local class = require 'middleclass'
local util = require 'util'

-- クラス：装備修正
local EquipmentModifier = class 'EquipmentModifier'

-- 組み込み
EquipmentModifier:include(require 'Readonly')

-- 初期化
function EquipmentModifier:initialize(t)
    t = t or {}

    self.tohit = t.tohit or 0
    self.attacktimes = t.attacktimes or 0
end

-- オーバーライド：比較
function EquipmentModifier:__eq(other)
    return util.equaltable(self, other, { 'tohit', 'attacktimes' })
end

-- オーバーライド：呼び出し
function EquipmentModifier:__call(...)
    return self:modify(...)
end

-- オーバーライド：加算
function EquipmentModifier:__add(other)
    if type(other) == 'table' then
        return self:modify(other)
    else
        error('Not an instance of EquipmentModifier')
    end
end

-- 修正
function EquipmentModifier:modify(t)
    t = t or {}

    local mod = {}

    mod.tohit = self.tohit + (t.tohit or 0)
    mod.attacktimes = self.attacktimes + (t.attacktimes or 0)

    return EquipmentModifier(mod)
end

return EquipmentModifier
