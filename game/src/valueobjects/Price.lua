
local class = require 'middleclass'

-- クラス：値段
local Price = class 'Price'

-- 初期化
function Price:initialize(t)
    t = t or {}

    self.buy = t.buy or 0
    self.sell = t.sell or math.floor(self.buy / 2)
    self.identify = t.identify or math.floor(self.buy / 2)
    self.uncurse = t.uncurse or math.floor(self.buy / 2)
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
