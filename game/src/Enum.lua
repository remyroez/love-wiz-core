
local class = require 'middleclass'
local lume = require 'lume'

-- 列挙体
local Enum = class 'Enum'

-- 組み込み
Enum:include(require 'Readonly')

-- 定義済み EnumValue クラス
local enumValues = {}

-- EnumValue クラスの定義
function Enum.static.EnumValue(_, enum)
    if enumValues[enum] == nil then
        -- EnumValue
        local EnumValue = class (enum.name and 'EnumValue(' .. enum.name .. ')' or 'EnumValue')

        -- 元の Enum クラス
        EnumValue.static.enum = enum

        -- 組み込み
        EnumValue:include(require 'Readonly')

        -- 初期化
        function EnumValue:initialize(v)
            if type(v) == 'number' then
                self.key = EnumValue.enum:get(v)
            elseif type(v) == 'string' then
                self.key = v
            else
                error('invalid value')
            end
        end

        -- オーバーライド：比較
        function EnumValue:__eq(other)
            return self.key == other.key
        end

        -- オーバーライド：より小さい
        function EnumValue:__lt(other)
            return self:tonumber() < other:tonumber()
        end

        -- オーバーライド：以下
        function EnumValue:__le(other)
            return self:tonumber() <= other:tonumber()
        end

        -- オーバーライド：文字列化
        function EnumValue:__tostring()
            return self:tostring()
        end

        -- 文字列化
        function EnumValue:tostring()
            return self.key
        end

        -- 数値化
        function EnumValue:tonumber()
            return EnumValue.enum:get(self.key)
        end

        -- 保持
        enumValues[enum] = EnumValue
    end
    return enumValues[enum]
end

-- 初期化
function Enum:initialize(t)
    t = t or {}

    self._table = {}
    local value = 1
    for i, v in ipairs(t) do
        if v == 'class' then
            error("can't use 'class' key")
        elseif type(v) == 'string' then
            self._table[v] = value
            value = value + 1
        else
            error('invalid value')
        end
    end

    for k, v in pairs(self._table) do
        self[k] = self(v)
        self[v] = self(v)
    end
end

-- オーバーライド：呼び出し
function Enum:__call(...)
    return Enum:EnumValue(self)(...)
end

-- 取得
function Enum:get(v)
    if type(v) == 'number' then
        return lume.find(self._table, v)
    elseif type(v) == 'string' then
        return self._table[v]
    end
    return nil
end

-- 検索
function Enum:has(v)
    return not not self:get(v)
end

return Enum
