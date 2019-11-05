
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Race'

-- クラス
local SavingThrow = require 'schemas.SavingThrow'
local Statistics = require 'schemas.Statistics'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    -- 名前
    self.name = t.name or ''

    -- 初期能力値
    self.statistics = Statistics(t.statistics)

    -- セービングスロー
    self.savingthrow = SavingThrow(t.savingthrow)
end

return Schema
