
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Statistics'

-- クラス
local Attribute = require 'schemas.Attribute'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    self.strength = Attribute(t.strength)
    self.iq       = Attribute(t.iq)
    self.piety    = Attribute(t.piety)
    self.vitality = Attribute(t.vitality)
    self.agility  = Attribute(t.agility)
    self.luck     = Attribute(t.luck)

    self.bonus = t.bonus or 0
end

return Schema
