
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Item'

-- クラス
local ArmorClass = require 'schemas.ArmorClass'
local Dice = require 'schemas.Dice'
local CharacterRequirement = require 'schemas.CharacterRequirement'
local SpecialPower = require 'schemas.SpecialPower'
local Price = require 'schemas.Price'
local EquipmentModifier = require 'schemas.EquipmentModifier'
local Element = require 'enums.Element'
local MonsterClass = require 'enums.MonsterClass'
local ItemFeature = require 'enums.ItemFeature'
local ItemClass = require 'enums.ItemClass'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    -- 名前
    self.name = t.name or ''

    -- 真名
    self.realname = t.realname or ''

    -- 種類
    self.klass = ItemClass(t.class)

    -- 装備可能
    self.equipable = CharacterRequirement(t.equipable)

    -- 呪いの対象
    self.cursable = CharacterRequirement(t.cursable)

    -- スペシャルパワー
    self.specialpower = SpecialPower(t.specialpower)

    -- 値段
    self.prices = Price(t.prices)

    -- スペル
    self.spell = t.spell or ''

    -- ヒーリング
    self.heal = t.heal or 0

    -- 倍打
    self.slay = MonsterClass(t.slay)

    -- 防御
    self.protection = MonsterClass(t.protection)

    -- アーマークラス
    self.ac = ArmorClass(t.ac)

    -- 呪われたときのアーマークラス
    self.cursedac = ArmorClass(t.cursedac)

    -- 攻撃ダイス
    self.attackdice = Dice(t.attackdice)

    -- 修正
    self.modifier = EquipmentModifier(t.modifier)

    -- 特徴
    self.features = ItemFeature.EnumSet(t.features)

    -- 抵抗
    self.resists = Element.EnumSet(t.resists)
end

return Schema
