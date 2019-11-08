
local class = require 'middleclass'
local util = require 'util'

-- クラス：値段
local Price = class 'Price'

-- 組み込み
Price:include(require 'Readonly')

-- 初期化
function Price:initialize(t)
    t = t or {}

    self.buy = t.buy or 0
    self.sell = t.sell or math.floor(self.buy / 2)
    self.identify = t.identify or math.floor(self.buy / 2)
    self.uncurse = t.uncurse or math.floor(self.buy / 2)
end

-- オーバーライド：比較
function Price:__eq(other)
    return util.equaltable(self, other, { 'buy', 'sell', 'identify', 'uncurse' })
end

function Price:buyprice()
    return self.buy
end

function Price:sellprice()
    return self.sell
end

function Price:identifyprice()
    return self.identify
end

function Price:uncurseprice()
    return self.uncurse
end

return Price
