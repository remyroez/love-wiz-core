
local class = require 'middleclass'

-- クラス：能力値
local Statistics = class 'Statistics'

-- モジュール
local Attribute = require 'valueobjects.Attribute'
local AttributeEnum = require 'enums.Attribute'

-- 初期化
function Statistics:initialize(t)
    t = t or {}

    for attribute, value in pairs(t) do
        self[AttributeEnum(attribute)] = Attribute(value)
    end
end

return Statistics
