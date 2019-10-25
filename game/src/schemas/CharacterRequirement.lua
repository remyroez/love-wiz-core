
local class = require 'middleclass'

-- スキーマ
local Schema = class 'CharacterRequirement'

-- クラス
local Whitelist = require 'Whitelist'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    self.classes = Whitelist(t.classes)
    self.races = Whitelist(t.races)
    self.alignments = Whitelist(t.alignments)
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
