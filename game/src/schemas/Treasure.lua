
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Treasure'

-- 初期化
function Schema:initialize(t)
    self.items = t.items or {}

    self.gold = t.gold or {}
    self.gold.probability = self.gold.probability or 0
    self.gold.min = self.gold.min or 0
    self.gold.max = self.gold.max or 0

    self.traps = t.traps or {}
end

return Schema
