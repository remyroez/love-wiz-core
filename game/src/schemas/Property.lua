
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Property'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    self.item = t.item or ''
    self.equipped = t.equipped or false
    self.identified = t.identified or false
    self.cursed = t.cursed or false
end

return Schema
