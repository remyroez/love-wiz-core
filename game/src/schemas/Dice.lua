
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Dice'

-- 初期化
function Schema:initialize(t)
    self.roll = t.roll or 0
    self.side = t.side or 0
    self.modifier = t.modifier or 0
end

return Schema
