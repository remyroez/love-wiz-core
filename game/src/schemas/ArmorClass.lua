
local class = require 'middleclass'
local lume = require 'lume'

-- スキーマ
local Schema = class 'ArmorClass'

-- 組み込み
Schema:include(require 'Class')
Schema:include(require 'Numeric')

-- 初期化
function Schema:initialize(v)
    self:initializeNumeric(v)
end

-- オーバーライド：文字列化
function Schema:__tostring()
    if self.value <= -10 then
        return 'LO'
    else
        return tostring(self.value)
    end
end

return Schema
