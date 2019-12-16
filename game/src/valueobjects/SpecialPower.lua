
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

    self.power = SpecialPowerEnum(t.power or 'none')
    self.changingprobability = t.changingprobability or 0
    self.changeditem = t.changeditem or ''
end

-- オーバーライド：比較
function SpecialPower:__eq(other)
    return util.equaltable(self, other, { 'power', 'changingprobability', 'changeditem' })
end

-- 変化
function SpecialPower:change(randomizer)
    randomizer = util.randomizer(randomizer)
    return (randomizer(100) <= self.changingprobability) and self.changeditem or nil
end

return SpecialPower
