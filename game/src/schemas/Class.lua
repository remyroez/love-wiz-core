
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Class'

-- 初期化
function Schema:initialize(t)
    self.name = t.name or ''
    self.shortname = t.shortname or ''

    self.alignments = t.alignments or {}

    self.attribute = t.attribute or {}
    self.attribute.strength = self.attribute.strength or 0
    self.attribute.iq = self.attribute.iq or 0
    self.attribute.piety = self.attribute.piety or 0
    self.attribute.vitality = self.attribute.vitality or 0
    self.attribute.agility = self.attribute.agility or 0
    self.attribute.luck = self.attribute.luck or 0

    self.savingthrow = t.savingthrow or {}
    self.savingthrow[0] = self.savingthrow[0] or 0
    self.savingthrow[1] = self.savingthrow[1] or 0
    self.savingthrow[2] = self.savingthrow[2] or 0
    self.savingthrow[3] = self.savingthrow[3] or 0
    self.savingthrow[4] = self.savingthrow[4] or 0

    self.mp = t.mp or {}
    self.mp.mage = self.mp.mage or {}
    self.mp.priest = self.mp.priest or {}

    self.spells = t.spells or {}
    self.spells.mage = self.spells.mage or {}
    self.spells.priest = self.spells.priest or {}

    self.learnspells = t.learnspells or {}
    self.learnspells.mage = self.learnspells.mage or {}
    self.learnspells.mage.level = self.learnspells.mage.level or 0
    self.learnspells.mage.interval = self.learnspells.mage.interval or 0
    self.learnspells.priest = self.learnspells.priest or {}
    self.learnspells.priest.level = self.learnspells.priest.level or 0
    self.learnspells.priest.interval = self.learnspells.priest.interval or 0

    self.hpdice = t.hpdice or 0

    self.attacktimes = t.attacktimes or {}
    self.attacktimes.levelunit = self.attacktimes.levelunit or 0
    self.attacktimes.modifier = self.attacktimes.modifier or 0

    self.attackspeed = t.attackspeed or 0
end

return Schema
