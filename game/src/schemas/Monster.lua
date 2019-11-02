
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Monster'

-- クラス
local Dice = require 'schemas.Dice'
local Following = require 'schemas.Following'
local Realm = require 'enums.Realm'
local Element = require 'enums.Element'
local MonsterClass = require 'enums.MonsterClass'
local MonsterFeature = require 'enums.MonsterFeature'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    -- 名前／複数形
    self.name = t.name or ''
    self.pname = t.pname or ''

    -- 真名／複数形
    self.realname = t.realname or ''
    self.prealname = t.prealname or ''

    -- 姿／真の姿
    self.picture = t.picture or ''
    self.realpicture = t.picture or ''

    -- 頭数ダイス
    self.numdice = Dice(t.numdice)

    -- ＨＰダイス
    self.hpdice = Dice(t.hpdice)

    -- クラス
    self.klass = MonsterClass(t.class)

    -- アーマークラス
    self.ac = t.ac or 0

    -- 攻撃回数
    self.attacktimes = t.attacktimes or 0

    -- 攻撃ダイス
    self.attackdices = {}
    if t.attackdices then
        for _, dice in ipairs(t.attackdices) do
            table.insert(self.attackdices, Dice(dice))
        end
    end

    -- 経験値
    self.exp = t.exp or 0

    -- エナジードレイン
    self.drain = t.drain or 0

    -- ヒーリング
    self.heal = t.heal or 0

    -- チェストＩＤ（徘徊／玄室）
    self.chests = t.chests or {}
    self.chests.wandering = self.chests.wandering or ''
    self.chests.lair = self.chests.lair or ''

    -- 後続
    self.following = Following(t.following)

    -- スペルレベル
    self.spelllevels = {}
    if t.spelllevels then
        for realm, spelllevel in pairs(t.spelllevels) do
            self.spelllevels[Realm(realm)] = spelllevel
        end
    end

    -- 出現回数
    self.unique = t.unique or 0

    -- ブレス
    self.breath = Element(t.breath)

    -- 呪文抵抗
    self.resistspell = t.resistspell or 0

    -- 抵抗
    self.resists = Element.EnumSet(t.resists)

    -- 特徴
    self.features = MonsterFeature.EnumSet(t.features)
end

return Schema
