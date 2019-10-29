
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Class'

-- クラス
local SavingThrow = require 'schemas.SavingThrow'
local Statistics = require 'schemas.Statistics'
local Spellbook = require 'schemas.Spellbook'

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
    self.savingthrow = SavingThrow(t.savingthrow)

    -- 初期スペルブック
    self.defaultspellbooks = {}
    if t.defaultspellbooks then
        for key, spellbook in pairs(t.defaultspellbooks) do
            self.properties[key] = Spellbook(spellbook)
        end
    end

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
