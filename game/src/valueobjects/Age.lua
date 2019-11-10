
local class = require 'middleclass'

-- クラス：年齢
local Age = class 'Age'

-- 組み込み
Age:include(require 'Class')
Age:include(require 'Numeric')
Age:include(require 'Readonly')

-- １年の週数
Age.static.weekofyear = 52

-- 初期化
function Age:initialize(v)
    self:initializeNumeric(v)
end

-- オーバーライド：呼び出し
function Age:__call(...)
    return self:yearsold(...)
end

-- オーバーライド：文字列化
function Age:__tostring()
    return tostring(self:yearsold())
end

-- 年齢
function Age:yearsold()
    return math.floor(self.value / Age.weekofyear)
end

-- 週
function Age:week()
    return math.floor(self.value)
end

return Age
