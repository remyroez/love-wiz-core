
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Item'

-- 初期化
function Schema:initialize(t)
    self.name = t.name or ''
    self.realname = t.realname or ''

    self.category = t.category or ''

    self.equipable = t.equipable or {}
    self.equipable.classes = self.equipable.classes or {}
    self.equipable.races = self.equipable.races or {}
    self.equipable.alignments = self.equipable.alignments or {}

    self.curse = t.curse or {}
    self.curse.classes = self.curse.classes or {}
    self.curse.races = self.curse.races or {}
    self.curse.alignments = self.curse.alignments or {}

    self.ac = t.ac or 0
    self.curseac = t.curseac or 0

    self.modifier = t.modifier or {}
    self.modifier.strength = self.modifier.strength or 0
    self.modifier.attacktimes = self.modifier.attacktimes or 0

    self.attackdice = t.attackdice or {}
    self.attackdice.roll = self.attackdice.roll or 0
    self.attackdice.side = self.attackdice.side or 0
    self.attackdice.modifier = self.attackdice.modifier or 0

    self.specialpower = t.specialpower or {}
    self.specialpower.power = self.specialpower.power or ''
    self.specialpower.broke = self.specialpower.broke or 0

    self.resists = t.resists or {}

    self.features = t.features or {}

    self.prices = t.prices or {}
    self.prices.sell = self.prices.sell or 0
    self.prices.buy = self.prices.buy or 0
    self.prices.identify = self.prices.identify or 0
    self.prices.uncurse = self.prices.uncurse or 0
end

return Schema
