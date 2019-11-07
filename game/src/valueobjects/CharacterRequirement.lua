
local class = require 'middleclass'
local util = require 'util'

-- クラス：キャラクター要件
local CharacterRequirement = class 'CharacterRequirement'

-- 組み込み
CharacterRequirement:include(require 'Readonly')

-- モジュール
local Whitelist = require 'Whitelist'
local Alignment = require 'enums.Alignment'
local CharacterClass = require 'enums.CharacterClass'
local Race = require 'enums.Race'

-- 初期化
function CharacterRequirement:initialize(t)
    t = t or {}

    self.alignments = util.freeze(Whitelist(Alignment.EnumSet(t.alignments)._values))
    self.classes = util.freeze(Whitelist(CharacterClass.EnumSet(t.classes)._values))
    self.races = util.freeze(Whitelist(Race.EnumSet(t.races)._values))
end

-- オーバーライド：呼び出し
function CharacterRequirement:__call(...)
    return self:allow(...)
end

-- チェック
function CharacterRequirement:allow(t)
    t = t or {}
    return self.classes(t.class or t.klass) and self.races(t.race) and self.alignments(t.alignment)
end

return CharacterRequirement
