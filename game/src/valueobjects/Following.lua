
local class = require 'middleclass'
local util = require 'util'

-- クラス：後続
local Following = class 'Following'

-- 初期化
function Following:initialize(t)
    t = t or {}

    -- 確率
    self.probability = t.probability or 0

    -- ＩＤ
    self.id = t.id or 0
end

-- 取得
function Following:get(randomizer)
    randomizer = util.randomizer(randomizer)
    return (randomizer(100) <= self.probability) and self.id or nil
end

return Following
