
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Monster'

-- 初期化
function Schema:initialize(t)
    self.name = t.name or ''
    self.pname = t.pname or ''
    self.realname = t.realname or ''
    self.prealname = t.prealname or ''

    self.picture = t.picture or ''

    self.numdice = t.numdice or {}
    self.numdice.roll = self.numdice.roll or 0
    self.numdice.side = self.numdice.side or 0
    self.numdice.modifier = self.numdice.modifier or 0

    self.hpdice = t.hpdice or {}
    self.hpdice.roll = self.hpdice.roll or 0
    self.hpdice.side = self.hpdice.side or 0
    self.hpdice.modifier = self.hpdice.modifier or 0

    self.class = t.class or 0

    self.ac = t.ac or 0

    self.attacktimes = t.attacktimes or 0

    self.attackdices = t.attackdices or {}

    self.exp = t.exp or 0

    self.drain = t.drain or 0
    self.heal = t.heal or 0

    self.treasures = t.treasures or {}
    self.treasures.wandering = self.treasures.wandering or ''
    self.treasures.lair = self.treasures.lair or ''

    self.team = t.team or {}
    self.team.monster = self.team.monster or ''
    self.team.probability = self.team.probability or 0

    self.spelllevels = t.spelllevels or {}
    self.spelllevels.mage = self.spelllevels.mage or 0
    self.spelllevels.priest = self.spelllevels.priest or 0

    self.unique = t.unique or 0

    self.breath = t.breath or ''

    self.resistspell = t.resistspell or 0

    self.resists = t.resists or {}

    self.features = t.features or {}
end

return Schema
