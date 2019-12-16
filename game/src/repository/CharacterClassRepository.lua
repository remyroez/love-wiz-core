
local class = require 'middleclass'

-- 基底クラス
local Repository = require 'repository.Repository'

-- リポジトリ：クラス
local CharacterClassRepository = class('CharacterClassRepository', Repository)

-- モジュール
local CharacterClass = require 'entities.CharacterClass'

-- 初期化
function CharacterClassRepository:initialize(t)
    Repository.initialize(self, t)
end

-- データ読み込み
function CharacterClassRepository:loadData(t)
    return CharacterClass(t)
end

return CharacterClassRepository
