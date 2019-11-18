
local class = require 'middleclass'

-- 基底クラス
local Repository = require 'repository.Repository'

-- リポジトリ：種族
local ItemRepository = class('ItemRepository', Repository)

-- モジュール
local Item = require 'entities.Item'

-- 初期化
function ItemRepository:initialize(t)
    Repository.initialize(self, t)
end

-- データ読み込み
function ItemRepository:loadData(t)
    return Item(t)
end

return ItemRepository
