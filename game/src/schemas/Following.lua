
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Following'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    -- 確率
    self.probability = t.probability or 0

    -- ＩＤ
    self.id = t.id or 0
end

-- 取得
function Schema:get(randomizer)
    randomizer = randomizer or math.random
    return (randomizer(100) <= self.probability) and self.id or nil
end

return Schema
