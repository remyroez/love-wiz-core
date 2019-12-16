
local class = require 'middleclass'

-- 基底クラス
local Repository = require 'repository.Repository'

-- リポジトリ：種族
local RaceRepository = class('RaceRepository', Repository)

-- モジュール
local Race = require 'entities.Race'

-- 初期化
function RaceRepository:initialize(t)
    Repository.initialize(self, t)
end

-- データ読み込み
function RaceRepository:loadData(t)
    return Race(t)
end

return RaceRepository
