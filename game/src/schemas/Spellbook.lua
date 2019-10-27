
local class = require 'middleclass'
local lume = require 'lume'

-- スキーマ
local Schema = class 'Spellbook'

-- クラス
local SpellLevel = require 'schemas.SpellLevel'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    self.levels = {}
    if t.levels then
        for _, level in ipairs(t.levels) do
            table.insert(self.levels, SpellLevel(level))
        end
    end
end

-- スペルがあるかどうか
function Schema:hasSpell(spell)
    for i, level in ipairs(self.levels) do
        local has = level:hasSpell(spell)
        if has then
            return i
        end
    end
    return nil
end

-- スペルを唱えられるかどうか
function Schema:canCast(spell)
    for i, level in ipairs(self.levels) do
        local has = level:hasSpell(spell)
        if level:hasSpell(spell) then
            return i
        end
    end
    return nil
end

return Schema
