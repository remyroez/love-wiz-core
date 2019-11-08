
local class = require 'middleclass'
local util = require 'util'

-- クラス：ダイス
local Dice = class 'Dice'

-- 組み込み
Dice:include(require 'Readonly')

-- 初期化
function Dice:initialize(t)
    t = t or {}

    self.roll = t.roll or 0
    self.side = t.side or 0
    self.modifier = t.modifier or 0
end

-- オーバーライド：比較
function Dice:__eq(other)
    return util.equaltable(self, other, { 'roll', 'side', 'modifier' })
end

-- オーバーライド：呼び出し
function Dice:__call(...)
    return self:throw(...)
end

-- オーバーライド：文字列化
function Dice:__tostring()
    return '' .. self.roll .. 'd' .. self.side .. (self.modifier == 0 and '' or (self.modifier < 0 and self.modifier or ('+' .. self.modifier)))
end

-- ダイスロール
function Dice:throw(randomizer)
    randomizer = util.randomizer(randomizer)

    local value = self.modifier
    for i = 1, self.roll do
        value = value + randomizer(self.side)
    end

    return value
end

-- 最大値
function Dice:max()
    return self.side * self.roll + self.modifier
end

-- 最低値
function Dice:min()
    return 1 * self.roll + self.modifier
end

return Dice
