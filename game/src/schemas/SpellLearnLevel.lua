
local class = require 'middleclass'
local lume = require 'lume'

-- スキーマ
local Schema = class 'SpellLearnLevel'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    self.first = t.first or 0
    self.interval = t.interval or 0
end

-- オーバーライド：呼び出し
function Schema:__call(...)
    return self:getAllNumSpells(...)
end

-- スペル数の取得
function Schema:getNumSpells(spelllevel, characterlevel)
    spelllevel = spelllevel or 0
    characterlevel = characterlevel or 0
    return math.max(0, math.min(characterlevel - self.first - self.interval * (spelllevel - 1), 9))
end

-- すべてのスペル数の取得
function Schema:getAllNumSpells(characterlevel)
    return
        self:getNumSpells(1, characterlevel),
        self:getNumSpells(2, characterlevel),
        self:getNumSpells(3, characterlevel),
        self:getNumSpells(4, characterlevel),
        self:getNumSpells(5, characterlevel),
        self:getNumSpells(6, characterlevel),
        self:getNumSpells(7, characterlevel)
end

return Schema
