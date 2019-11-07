
local class = require 'middleclass'

-- クラス：種族
local Race = class 'Race'

-- クラス
local Statistics = require 'entities.Statistics'
local SavingThrow = require 'valueobjects.SavingThrow'

-- 初期化
function Race:initialize(t)
    t = t or {}

    -- 名前
    self.name = t.name or ''

    -- 初期能力値
    self.statistics = Statistics(t.statistics)

    -- セービングスロー
    self.savingthrow = SavingThrow(t.savingthrow)
end

return Race
