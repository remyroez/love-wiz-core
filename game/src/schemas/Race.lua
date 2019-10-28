
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Race'

-- クラス
local Statistics = require 'schemas.Statistics'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    -- 名前
    self.name = t.name or ''

    -- 初期能力値
    self.statistics = Statistics(t.statistics)

    -- セービングスロー
    self.savingthrow = t.savingthrow or {}
    self.savingthrow[0] = self.savingthrow[0] or 0
    self.savingthrow[1] = self.savingthrow[1] or 0
    self.savingthrow[2] = self.savingthrow[2] or 0
    self.savingthrow[3] = self.savingthrow[3] or 0
    self.savingthrow[4] = self.savingthrow[4] or 0
end

return Schema
