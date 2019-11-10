
local class = require 'middleclass'

-- クラス：キャラクタークラス
local CharacterClass = class 'CharacterClass'

-- モジュール
local Alignment = require 'enums.Alignment'
local Realm = require 'enums.Realm'

local Spellbook = require 'valueobjects.Spellbook'
local Statistics = require 'valueobjects.Statistics'
local AttackTimeLevel = require 'valueobjects.AttackTimeLevel'
local NextLevel = require 'valueobjects.NextLevel'
local SavingThrow = require 'valueobjects.SavingThrow'
local SpellLearnLevel = require 'valueobjects.SpellLearnLevel'

-- 初期化
function CharacterClass:initialize(t)
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

return CharacterClass
