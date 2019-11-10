
local class = require 'middleclass'
local util = require 'util'

-- クラス：スペシャルパワー
local SpecialPower = class 'SpecialPower'

-- 組み込み
SpecialPower:include(require 'Readonly')

-- モジュール
local SpecialPowerEnum = require 'enums.SpecialPower'

-- 初期化
function SpecialPower:initialize(t)
    t = t or {}

    self.power = SpecialPowerEnum(self.power)
    self.changingprobability = self.changingprobability or 0
    self.changeditem = self.changeditem or 0
end

-- オーバーライド：比較
function SpecialPower:__eq(other)
    return util.equaltable(self, other, { 'power', 'changingprobability', 'changeditem' })
end

function SpecialPower:change(randomizer)
    randomizer = util.randomizer(randomizer)
    return randomizer(100) <= self.changingprobability
end

return SpecialPower
