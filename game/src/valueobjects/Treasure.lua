
local class = require 'middleclass'
local util = require 'util'

-- クラス：宝物
local Treasure = class 'Treasure'

-- 初期化
function Treasure:initialize(t)
    t = t or {}

    -- 確率
    self.probability = t.probability or 0

    -- 最低値
    self.min = t.min or 0

    -- 最大値
    self.max = t.max or 0
end

-- オーバーライド：呼び出し
function Treasure:__call(...)
    return self:get(...)
end

function Treasure:get(randomizer)
    randomizer = util.randomizer(randomizer)

    local value = nil
    if randomizer(100) <= self.probability then
        value = randomizer(self.min, self.max)
    end
    return value
end

return Treasure
