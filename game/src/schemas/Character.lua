
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Character'

-- 初期化
function Schema:initialize(t)
    self.name = t.name or ''

    self.password = t.password or ''

    self.race = t.race or ''

    self.class = t.class or ''

    self.age = t.age or 0

    self.status = t.status or ''

    self.alignment = t.alignment or ''

    self.attribute = t.attribute or {}
    self.attribute.strength = self.attribute.strength or 0
    self.attribute.iq = self.attribute.iq or 0
    self.attribute.piety = self.attribute.piety or 0
    self.attribute.vitality = self.attribute.vitality or 0
    self.attribute.agility = self.attribute.agility or 0
    self.attribute.luck = self.attribute.luck or 0

    self.bonus = t.bonus or 0

    self.gold = t.gold or 0

    self.items = t.items or {}

    self.exp = t.exp or 0
    self.level = t.level or 0

    self.hp = t.hp or 0
    self.hpmax = t.hpmax or 0

    self.spells = t.spells or {}
    self.spells.mage = self.spells.mage or {}
    self.spells.priest = self.spells.priest or {}

    self.mp = t.mp or {}
    self.mp.mage = self.mp.mage or {}
    self.mp.priest = self.mp.priest or {}

    self.ac = t.ac or 0

    self.whereabouts = t.whereabouts or {}
    self.whereabouts.place = self.whereabouts.place or ''
    self.whereabouts.x = self.whereabouts.x or 0
    self.whereabouts.y = self.whereabouts.y or 0
    self.whereabouts.level = self.whereabouts.level or ''

    self.titles = t.titles or {}
end

return Schema
