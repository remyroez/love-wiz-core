
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Race'

-- 初期化
function Schema:initialize(t)
    self.name = t.name or ''

    self.attribute = t.attribute or {}
    self.attribute.strength = self.attribute.strength or 0
    self.attribute.iq = self.attribute.iq or 0
    self.attribute.piety = self.attribute.piety or 0
    self.attribute.vitality = self.attribute.vitality or 0
    self.attribute.agility = self.attribute.agility or 0
    self.attribute.luck = self.attribute.luck or 0

    self.savingthrow = t.savingthrow or {}
    self.savingthrow[0] = self.savingthrow[0] or 0
    self.savingthrow[1] = self.savingthrow[1] or 0
    self.savingthrow[2] = self.savingthrow[2] or 0
    self.savingthrow[3] = self.savingthrow[3] or 0
    self.savingthrow[4] = self.savingthrow[4] or 0
end

return Schema
