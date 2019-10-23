
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Dice'

-- 初期化
function Schema:initialize(t)
    self.roll = t.roll or 0
    self.side = t.side or 0
    self.modifier = t.modifier or 0
end

-- ダイスロール
function Schema:throw(randomizer)
    randomizer = randomizer or math.random

    local value = self.modifier
    for i = 1, self.roll do
        value = value + randomizer(self.side)
    end

    return value
end

-- 最大値
function Schema:max()
    return self.side * self.roll + self.modifier
end

-- 最低値
function Schema:min()
    return 1 * self.roll + self.modifier
end

return Schema
