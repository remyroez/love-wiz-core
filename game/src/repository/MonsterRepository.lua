
local class = require 'middleclass'

-- 基底クラス
local Repository = require 'repository.Repository'

-- リポジトリ：モンスター
local MonsterRepository = class('MonsterRepository', Repository)

-- モジュール
local Monster = require 'entities.Monster'

-- 初期化
function MonsterRepository:initialize(t)
    Repository.initialize(self, t)
end

-- データ読み込み
function MonsterRepository:loadData(t)
    return Monster(t)
end

return MonsterRepository
