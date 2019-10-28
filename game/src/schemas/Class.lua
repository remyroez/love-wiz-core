
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Class'

-- クラス
local Statistics = require 'schemas.Statistics'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    -- 名前
    self.name = t.name or ''

    -- 短縮名
    self.shortname = t.shortname or ''

    -- アライメント
    self.alignments = t.alignments or {}

    -- 必要能力値
    self.statrequirement = Statistics(t.statrequirement)

    -- セービングスロー
    self.savingthrow = t.savingthrow or {}
    self.savingthrow[0] = self.savingthrow[0] or 0
    self.savingthrow[1] = self.savingthrow[1] or 0
    self.savingthrow[2] = self.savingthrow[2] or 0
    self.savingthrow[3] = self.savingthrow[3] or 0
    self.savingthrow[4] = self.savingthrow[4] or 0

    -- スペル回数
    self.mp = t.mp or {}
    self.mp.mage = self.mp.mage or {}
    self.mp.priest = self.mp.priest or {}

    -- 初期習得スペル
    self.spells = t.spells or {}
    self.spells.mage = self.spells.mage or {}
    self.spells.priest = self.spells.priest or {}

    -- 習得スペル
    self.learnspells = t.learnspells or {}
    self.learnspells.mage = self.learnspells.mage or {}
    self.learnspells.mage.level = self.learnspells.mage.level or 0
    self.learnspells.mage.interval = self.learnspells.mage.interval or 0
    self.learnspells.priest = self.learnspells.priest or {}
    self.learnspells.priest.level = self.learnspells.priest.level or 0
    self.learnspells.priest.interval = self.learnspells.priest.interval or 0

    -- ＨＰダイス数
    self.hpdice = t.hpdice or 0

    -- 攻撃回数
    self.attacktimes = t.attacktimes or {}
    self.attacktimes.levelunit = self.attacktimes.levelunit or 0
    self.attacktimes.modifier = self.attacktimes.modifier or 0

    -- 攻撃速度
    self.attackspeed = t.attackspeed or 0

    -- 経験値チャート
    self.expchart = t.expchart or {}
end

return Schema
