
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Price'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    self.buy = t.buy or 0
    self.sell = t.sell or math.floor(self.buy / 2)
    self.identify = t.identify or math.floor(self.buy / 2)
    self.uncurse = t.uncurse or math.floor(self.buy / 2)
end

function Schema:buyprice()
    return self.buy
end

function Schema:sellprice()
    return self.sell
end

function Schema:identifyprice()
    return self.identify
end

function Schema:uncurseprice()
    return self.uncurse
end

return Schema
