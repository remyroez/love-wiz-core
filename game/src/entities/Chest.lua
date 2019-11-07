
local class = require 'middleclass'

-- クラス：宝箱
local Chest = class 'Chest'

-- モジュール
local Treasure = require 'valueobjects.Treasure'

-- 初期化
function Chest:initialize(t)
    t = t or {}

    -- お金
    self.gold = Treasure(t.gold)

    -- アイテム
    self.items = {}
    if t.items then
        for _, item in ipairs(t.items) do
            table.insert(self.items, Treasure(item))
        end
    end

    -- 罠
    self.traps = t.traps or {}
end

-- オーバーライド：呼び出し
function Chest:__call(...)
    return self:get(...)
end

function Chest:get(randomizer)
    local treasures = {}

    treasures.gold = self.gold:get(randomizer) or 0

    treasures.items = {}
    for _, item in ipairs(self.items) do
        local treasure = item:get(randomizer)
        if treasure then
            table.insert(treasures.items, treasure)
        end
    end

    return treasures
end

return Chest
