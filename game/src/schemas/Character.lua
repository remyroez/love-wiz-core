
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Character'

-- クラス
local Age = require 'schemas.Age'
local ArmorClass = require 'schemas.ArmorClass'
local HitPoint = require 'schemas.HitPoint'
local Property = require 'schemas.Property'
local Spellbook = require 'schemas.Spellbook'
local Statistics = require 'schemas.Statistics'
local Whereabouts = require 'schemas.Whereabouts'
local Race = require 'enums.Race'
local CharacterClass = require 'enums.CharacterClass'
local Alignment = require 'enums.Alignment'
local Status = require 'enums.Status'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    -- 名前
    self.name = t.name or ''

    -- パスワード
    self.password = t.password or ''

    -- 種族
    self.race = Race(t.race)

    -- クラス
    self.klass = CharacterClass(t.class)

    -- 年齢
    self.age = Age(t.age)

    -- 状態
    self.status = Status(t.status)

    -- アライメント
    self.alignment = Alignment(t.alignment)

    -- 能力値
    self.statistics = Statistics(t.statistics)

    -- ボーナス
    self.bonus = t.bonus or 0

    -- ゴールド
    self.gold = t.gold or 0

    -- 所持品
    self.properties = {}
    if t.properties then
        for _, property in ipairs(t.properties) do
            table.insert(self.properties, Property(property))
        end
    end

    -- 経験値
    self.exp = t.exp or 0

    -- レベル
    self.level = t.level or 0

    -- 現在のＨＰ
    self.hp = HitPoint(t.hp)

    -- スペルブック
    self.spellbooks = {}
    if t.spellbooks then
        for key, spellbook in pairs(t.spellbooks) do
            self.spellbooks[key] = Spellbook(spellbook)
        end
    end

    -- アーマークラス
    self.ac = ArmorClass(t.ac)

    -- 現在位置
    self.whereabouts = Whereabouts(t.whereabouts)

    -- 称号
    self.titles = t.titles or {}
end

return Schema
