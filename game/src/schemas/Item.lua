
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Item'

-- クラス
local Dice = require 'schemas.Dice'
local CharacterRequirement = require 'schemas.CharacterRequirement'
local SpecialPower = require 'schemas.SpecialPower'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    -- 名前
    self.name = t.name or ''

    -- 真名
    self.realname = t.realname or ''

    -- 種類
    self.category = t.category or ''

    -- 装備可能
    self.equipable = CharacterRequirement(t.equipable)

    -- 呪いの対象
    self.cursable = CharacterRequirement(t.cursable)

    -- アーマークラス
    self.ac = t.ac or 0

    -- 呪われたときのアーマークラス
    self.curseac = t.curseac or 0

    -- 修正
    self.modifier = t.modifier or {}
    self.modifier.strength = self.modifier.strength or 0
    self.modifier.attacktimes = self.modifier.attacktimes or 0

    -- 攻撃ダイス
    self.attackdice = Dice(t.attackdice)

    -- スペシャルパワー
    self.specialpower = SpecialPower(t.specialpower)

    -- 抵抗
    self.resists = t.resists or {}

    -- 特徴
    self.features = t.features or {}

    -- 値段
    self.prices = t.prices or {}
    self.prices.sell = self.prices.sell or 0
    self.prices.buy = self.prices.buy or 0
    self.prices.identify = self.prices.identify or 0
    self.prices.uncurse = self.prices.uncurse or 0
end

return Schema
