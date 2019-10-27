
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Character'

-- クラス
local ArmorClass = require 'schemas.ArmorClass'
local HitPoint = require 'schemas.HitPoint'
local Property = require 'schemas.Property'
local Spellbook = require 'schemas.Spellbook'
local Statistics = require 'schemas.Statistics'
local Whereabouts = require 'schemas.Whereabouts'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    -- 名前
    self.name = t.name or ''

    -- パスワード
    self.password = t.password or ''

    -- 種族
    self.race = t.race or ''

    -- クラス
    self.class = t.class or ''

    -- 年齢
    self.age = t.age or 0

    -- 状態
    self.status = t.status or ''

    -- アライメント
    self.alignment = t.alignment or ''

    -- 能力値
    self.statistics = Statistics(t.statistics)

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

    -- スペル
    self.spellbook = Spellbook(t.spellbook)

    -- アーマークラス
    self.ac = ArmorClass(t.ac)

    -- 現在位置
    self.whereabouts = Whereabouts(t.whereabouts)

    -- 称号
    self.titles = t.titles or {}
end

return Schema
