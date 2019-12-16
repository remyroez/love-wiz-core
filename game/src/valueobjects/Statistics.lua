
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

    self.values = {}
    for attribute, value in pairs(t) do
        self.values[AttributeEnum(attribute)] = Attribute(value)
    end
end

-- オーバーライド：比較
function Statistics:__eq(other)
    for _, enum in ipairs(AttributeEnum._enumvalues) do
        if self:get(enum) ~= other:get(enum) then
            return false
        end
    end
    return true
end

-- 取得
function Statistics:get(key)
    key = AttributeEnum(key)
    for k, v in pairs(self.values) do
        if k == key then
            return v
        end
    end
    return nil
end

return Statistics
