
local class = require 'middleclass'

-- 基底クラス
local Repository = require 'repository.Repository'

-- リポジトリ：キャラクター
local CharacterRepository = class('CharacterRepository', Repository)

-- モジュール
local Character = require 'entities.Character'

-- 初期化
function CharacterRepository:initialize(t)
    Repository.initialize(self, t)
end

-- データ読み込み
function CharacterRepository:loadData(t)
    return Character(t)
end

return CharacterRepository
