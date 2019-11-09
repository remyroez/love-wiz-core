
local class = require 'middleclass'
local util = require 'util'

-- クラス：能力値
local Statistics = class 'Statistics'

-- 組み込み
Statistics:include(require 'Readonly')

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

-- オーバーライド：比較
function Statistics:__eq(other)
    return util.equaltable(self, other, AttributeEnum._enumvalues)
end

return Statistics
