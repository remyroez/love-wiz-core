
local class = require 'middleclass'
local util = require 'util'

-- クラス：宝物
local Treasure = class 'Treasure'

-- 組み込み
Treasure:include(require 'Readonly')

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

-- オーバーライド：比較
function Treasure:__eq(other)
    return util.equaltable(self, other, { 'probability', 'min', 'max' })
end

-- オーバーライド：呼び出し
function Treasure:__call(...)
    return self:get(...)
end

-- 獲得
function Treasure:get(randomizer)
    randomizer = util.randomizer(randomizer)

    local value = nil
    if randomizer(100) <= self.probability then
        value = randomizer(self.min, self.max)
    end
    return value
end

return Treasure
