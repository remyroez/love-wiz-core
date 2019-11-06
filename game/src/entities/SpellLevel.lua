
local class = require 'middleclass'
local lume = require 'lume'

-- クラス：スキルレベル
local SpellLevel = class 'SpellLevel'

-- モジュール
local SpellPoint = require 'valueobjects.SpellPoint'

-- 初期化
function SpellLevel:initialize(t)
    t = t or {}

    self.spells   = t.spells or {}
    self.point = SpellPoint(t.point)
end

-- スペルがあるかどうか
function SpellLevel:hasSpell(spell)
    return not not lume.find(self.spells, spell)
end

-- スペルを唱えられるかどうか
function SpellLevel:canCast(spell)
    return self.point.value > 0 and self:hasSpell(spell)
end

return SpellLevel
