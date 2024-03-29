
local class = require 'middleclass'

-- クラス：キャラクター
local Character = class 'Character'

-- モジュール
local Possession = require 'valueobjects.Possession'
local Spellbook = require 'valueobjects.Spellbook'
local Statistics = require 'valueobjects.Statistics'
local Whereabouts = require 'valueobjects.Whereabouts'
local Age = require 'valueobjects.Age'
local ArmorClass = require 'valueobjects.ArmorClass'
local HitPoint = require 'valueobjects.HitPoint'

local Alignment = require 'enums.Alignment'
local CharacterClass = require 'enums.CharacterClass'
local Race = require 'enums.Race'
local Status = require 'enums.Status'

-- 初期化
function Character:initialize(t)
    t = t or {}

    -- ＩＤ
    self.id = t.id or ''

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
    self.possessions = {}
    if t.possessions then
        for _, possession in ipairs(t.possessions) do
            table.insert(self.possessions, Possession(possession))
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

-- オーバーライド：比較
function Character:__eq(other)
    return self.id == other.id
end

return Character
