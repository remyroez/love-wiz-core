
local class = require 'middleclass'
local lume = require 'lume'
local util = require 'util'

-- クラス：スペルブック
local Spellbook = class 'Spellbook'

-- モジュール
local SpellLevel = require 'valueobjects.SpellLevel'

-- 初期化
function Spellbook:initialize(t)
    t = t or {}

    self.levels = {}
    if t.levels then
        for _, level in ipairs(t.levels) do
            table.insert(self.levels, SpellLevel(level))
        end
    end
end

-- オーバーライド：比較
function Spellbook:__eq(other)
    return util.equalarray(self.levels, other.levels)
end

-- スペルがあるかどうか
function Spellbook:hasSpell(spell)
    for i, level in ipairs(self.levels) do
        local has = level:hasSpell(spell)
        if has then
            return i
        end
    end
    return nil
end

-- スペルを唱えられるかどうか
function Spellbook:canCast(spell)
    for i, level in ipairs(self.levels) do
        local has = level:hasSpell(spell)
        if level:hasSpell(spell) then
            return i
        end
    end
    return nil
end

return Spellbook
