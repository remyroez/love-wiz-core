
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Age'

-- 組み込み
Schema:include(require 'Class')
Schema:include(require 'Numeric')

-- １年の週数
Schema.static.weekofyear = 52

-- 初期化
function Schema:initialize(v)
    self:initializeNumeric(v)
end

-- オーバーライド：呼び出し
function Schema:__call(...)
    return self:yearsold(...)
end

-- オーバーライド：文字列化
function Schema:__tostring()
    return tostring(self:yearsold())
end

-- 年齢
function Schema:yearsold()
    return math.floor(self.value / Schema.weekofyear)
end

-- 週
function Schema:week()
    return math.floor(self.value)
end

return Schema
