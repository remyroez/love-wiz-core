
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Whereabouts'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    self.place = t.place or ''
    self.x     = t.x or 0
    self.y     = t.y or 0
    self.level = t.level or ''
end

return Schema
