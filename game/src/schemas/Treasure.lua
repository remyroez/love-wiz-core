
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Treasure'

-- 初期化
function Schema:initialize(t)
    self.probability = t.probability or 0
    self.min = t.min or 0
    self.max = t.max or 0
end

function Schema:get(randomizer)
    randomizer = randomizer or math.random

    local value = nil
    if randomizer(100) <= self.probability then
        value = randomizer(self.min, self.max)
    end
    return value
end

return Schema
