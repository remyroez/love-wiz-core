
local class = require 'middleclass'
local util = require 'util'

-- クラス：スペシャルパワー
local SpecialPower = class 'SpecialPower'

-- モジュール
local SpecialPowerEnum = require 'enums.SpecialPower'

-- 初期化
function SpecialPower:initialize(t)
    t = t or {}

    self.power = SpecialPowerEnum(self.power)
    self.changingprobability = self.changingprobability or 0
    self.changeditem = self.changeditem or 0
end

function SpecialPower:change(randomizer)
    randomizer = util.randomizer(randomizer)
    return randomizer(100) <= self.changingprobability
end

return SpecialPower
