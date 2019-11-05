
local class = require 'middleclass'

-- スキーマ
local Schema = class 'CharacterClass'

-- クラス
local Alignment = require 'enums.Alignment'
local SavingThrow = require 'schemas.SavingThrow'
local Statistics = require 'schemas.Statistics'
local Spellbook = require 'schemas.Spellbook'
local SpellLearnLevel = require 'schemas.SpellLearnLevel'
local AttackTimeLevel = require 'schemas.AttackTimeLevel'
local NextLevel = require 'schemas.NextLevel'
local Realm = require 'enums.Realm'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    -- 名前
    self.name = t.name or ''

    -- 短縮名
    self.shortname = t.shortname or ''

    -- アライメント
    self.alignments = Alignment.EnumSet(t.alignments)

    -- 必要能力値
    self.statrequirement = Statistics(t.statrequirement)

    -- セービングスロー
    self.savingthrow = SavingThrow(t.savingthrow)

    -- 初期スペルブック
    self.defaultspellbooks = {}
    if t.defaultspellbooks then
        for realm, spellbook in pairs(t.defaultspellbooks) do
            self.properties[Realm(realm)] = Spellbook(spellbook)
        end
    end

    -- スペル習得レベル
    self.spelllearnlevels = {}
    if t.spelllearnlevels then
        for realm, spelllearnlevel in pairs(t.spelllearnlevels) do
            self.spelllearnlevels[Realm(realm)] = SpellLearnLevel(spelllearnlevel)
        end
    end

    -- ＨＰダイス数
    self.hpdice = t.hpdice or 0

    -- 攻撃回数
    self.attacktimelevel = AttackTimeLevel(t.attacktimelevel)

    -- 次のレベル
    self.nextlevel = NextLevel(t.nextlevel)
end

return Schema
