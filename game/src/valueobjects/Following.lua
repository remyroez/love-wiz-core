
local class = require 'middleclass'
local util = require 'util'

-- クラス：後続
local Following = class 'Following'

-- 組み込み
Following:include(require 'Readonly')

-- 初期化
function Following:initialize(t)
    t = t or {}

    -- 確率
    self.probability = t.probability or 0

    -- 後続者
    self.follower = t.follower or 0
end

-- オーバーライド：比較
function Following:__eq(other)
    return util.equaltable(self, other, { 'probability', 'follower' })
end

-- オーバーライド：呼び出し
function Following:__call(...)
    return self:get(...)
end

-- 取得
function Following:get(randomizer)
    randomizer = util.randomizer(randomizer)
    return (randomizer(100) <= self.probability) and self.follower or nil
end

return Following
