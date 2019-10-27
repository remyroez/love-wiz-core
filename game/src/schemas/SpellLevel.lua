
local class = require 'middleclass'
local lume = require 'lume'

-- スキーマ
local Schema = class 'SpellLevel'

-- クラス
local SpellPoint = require 'schemas.SpellPoint'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    self.spells   = t.spells or {}
    self.point = SpellPoint(t.point)
end

-- スペルがあるかどうか
function Schema:hasSpell(spell)
    return not not lume.find(self.spells, spell)
end

-- スペルを唱えられるかどうか
function Schema:canCast(spell)
    return self.point.value > 0 and self:hasSpell(spell)
end

return Schema
