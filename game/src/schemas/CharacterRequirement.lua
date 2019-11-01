
local class = require 'middleclass'

-- スキーマ
local Schema = class 'CharacterRequirement'

-- クラス
local Whitelist = require 'Whitelist'
local Alignment = require 'enums.Alignment'
local CharacterClass = require 'enums.CharacterClass'
local Race = require 'enums.Race'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    self.alignments = Whitelist(Alignment.EnumSet(t.alignments)._values)
    self.classes = Whitelist(CharacterClass.EnumSet(t.classes)._values)
    self.races = Whitelist(Race.EnumSet(t.races)._values)
end

-- オーバーライド：呼び出し
function Schema:__call(...)
    return self:allow(...)
end

-- チェック
function Schema:allow(t)
    t = t or {}
    return self.classes(t.class) and self.races(t.race) and self.alignments(t.alignment)
end

return Schema
