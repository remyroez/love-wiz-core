
local class = require 'middleclass'
local lume = require 'lume'
local util = require 'util'

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

-- オーバーライド：比較
function SpellLevel:__eq(other)
    return util.equalarray(self.spells, other.spells)
        and self.point == other.point
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
