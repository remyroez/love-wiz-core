
local class = require 'middleclass'

-- 基底クラス
local Repository = require 'repository.Repository'

-- リポジトリ：チェスト
local ChestRepository = class('ChestRepository', Repository)

-- モジュール
local Chest = require 'entities.Chest'

-- 初期化
function ChestRepository:initialize(t)
    Repository.initialize(self, t)
end

-- データ読み込み
function ChestRepository:loadData(t)
    return Chest(t)
end

return ChestRepository
