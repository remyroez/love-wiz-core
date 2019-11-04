
local class = require 'middleclass'
local util = require 'util'

-- スキーマ
local Schema = class 'SpecialPower'

-- クラス
local SpecialPowerEnum = require 'enums.SpecialPower'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    self.power = SpecialPowerEnum(self.power)
    self.changingprobability = self.changingprobability or 0
    self.changeditem = self.changeditem or 0
end

function Schema:change(randomizer)
    randomizer = util.randomizer(randomizer)
    return randomizer(100) <= self.changingprobability
end

return Schema
