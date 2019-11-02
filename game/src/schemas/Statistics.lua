
local class = require 'middleclass'

-- スキーマ
local Schema = class 'Statistics'

-- クラス
local Attribute = require 'schemas.Attribute'
local AttributeEnum = require 'enums.Attribute'

-- 初期化
function Schema:initialize(t)
    t = t or {}

    for attribute, value in pairs(t) do
        self[AttributeEnum(attribute)] = Attribute(value)
    end
end

return Schema
