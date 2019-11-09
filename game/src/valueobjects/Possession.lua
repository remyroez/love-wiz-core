
local class = require 'middleclass'
local util = require 'util'

-- クラス：所持品
local Possession = class 'Possession'

-- 初期化
function Possession:initialize(t)
    t = t or {}

    -- アイテム
    self.item = t.item or ''

    -- 装備済み
    self.equipped = t.equipped or false

    -- 鑑定済み
    self.identified = t.identified or false

    -- 呪い
    self.cursed = t.cursed or false
end

-- オーバーライド：比較
function Possession:__eq(other)
    return util.equaltable(self, other, { 'item', 'equipped', 'identified', 'cursed' })
end

-- 装備する
function Possession:equip(flag)
    if flag ~= self.equipped then
        return self.class { item = self.item, equipped = flag, identified = self.identified, cursed = self.cursed }
    else
        return self
    end
end

-- 鑑定する
function Possession:identify(flag)
    if flag ~= self.identified then
        return self.class { item = self.item, equipped = self.equipped, identified = flag, cursed = self.cursed }
    else
        return self
    end
end

-- 呪う
function Possession:curse(flag)
    if flag ~= self.cursed then
        return self.class { item = self.item, equipped = self.equipped, identified = self.identified, cursed = flag }
    else
        return self
    end
end

return Possession
