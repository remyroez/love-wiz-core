
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Attribute'

-- 初期化
function Schema:initialize(t)
    self.strength = t.strength or 0
    self.iq = t.iq or 0
    self.piety = t.piety or 0
    self.vitality = t.vitality or 0
    self.agility = t.agility or 0
    self.luck = t.luck or 0

    self.bonus = t.bonus or 0
end

return Schema
