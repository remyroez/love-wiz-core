
local class = require 'middleclass'
local lume = require 'lume'

-- 列挙体
local Enum = class 'Enum'

-- 組み込み
Enum:include(require 'Readonly')

-- 定義済み EnumValue クラス
local enumValues = {}

-- 定義済み EnumSet クラス
local enumSets = {}

-- EnumValue クラスの定義
function Enum.static.EnumValue(_, enum)
    enum = enum or _
    if enumValues[enum] == nil then
        -- EnumValue
        local EnumValue = class (enum.name and 'EnumValue(' .. enum.name .. ')' or 'EnumValue')

        -- 元の Enum クラス
        EnumValue.static.enum = enum

        -- 組み込み
        EnumValue:include(require 'Class')
        EnumValue:include(require 'Readonly')

        -- 初期化
        function EnumValue:initialize(v)
            if type(v) == 'number' then
                self.key = EnumValue.enum:get(v)
            elseif type(v) == 'string' then
                self.key = v
            elseif EnumValue:isInstance(v) then
                self.key = v.key
            else
                error('invalid value [' .. tostring(v) .. '] You must choose from ' .. tostring(EnumValue.enum))
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

-- EnumSet クラスの定義
function Enum.static.EnumSet(_, enum)
    enum = enum or _
    if enumSets[enum] == nil then
        -- EnumSet
        local EnumSet = class (enum.name and 'EnumSet(' .. enum.name .. ')' or 'EnumSet')

        -- 元の Enum クラス
        EnumSet.static.enum = enum

        EnumSet.static.enumValue = Enum:EnumValue(enum)

        -- 組み込み
        EnumSet:include(require 'Class')

        -- 初期化
        function EnumSet:initialize(t)
            t = t or {}
            if type(t) ~= 'table' then
                error('invalid value [' .. tostring(t) .. '] table expected, got ' .. type(t))
            end
            self._values = {}
            for _, v in ipairs(t) do
                self:add(v)
            end
        end

        -- オーバーライド：文字列化
        function EnumSet:__tostring()
            return table.concat(lume.map(self._values, tostring), ', ')
        end

        -- オーバーライド：比較
        function EnumSet:__eq(other)
            local eq = true
            for k, v in pairs(self.set) do
                if self._values[k] ~= other._values[k] then
                    eq = false
                    break
                end
            end
            return eq
        end

        -- 持っているかどうか
        function EnumSet:has(v)
            if EnumSet.enum:has(v) then
                return not not lume.find(self._values, EnumSet.enumValue(v))
            else
                error('not same enum value')
            end
        end

        -- 追加
        function EnumSet:add(v)
            if EnumSet.enum:has(v) then
                table.insert(self._values, EnumSet.enumValue(v))
                self:sort()
            else
                error('not same enum value')
            end
        end

        -- 削除
        function EnumSet:remove(v)
            if EnumSet.enum:has(v) then
                lume.remove(self._values, EnumSet.enumValue(v))
            else
                error('not same enum value')
            end
        end

        -- クリア
        function EnumSet:clear()
            lume.clear(self._values)
        end

        -- ソート
        function EnumSet:sort()
            table.sort(self._values)
        end

        -- 保持
        enumSets[enum] = EnumSet
    end
    return enumSets[enum]
end

-- 初期化
function Enum:initialize(t)
    t = t or {}

    -- 要素を保持
    self._enumvalues = {}
    self._values = {}
    self._keys = {}
    local value = 1
    for i, v in ipairs(t) do
        if v == 'class' then
            error("can't use 'class' key")
        elseif type(v) == 'string' then
            self._values[v] = value
            value = value + 1
            table.insert(self._keys, v)
        else
            error('invalid value')
        end
    end

    -- 名前
    self.name = t.name or nil

    -- 各型を保持
    self.EnumValue = Enum:EnumValue(self)
    self.EnumSet = Enum:EnumSet(self)

    -- 各キーとインデックスに値をコピー
    for k, v in pairs(self._values) do
        local ev = self(v)
        self[k] = ev
        self[v] = ev
        table.insert(self._enumvalues, ev)
    end
end

-- オーバーライド：文字列化
function Enum:__tostring()
    return 'enum' .. (self.name and (' ' .. self.name) or '') .. ' [' .. table.concat(self._keys, ', ') .. ']'
end

-- オーバーライド：呼び出し
function Enum:__call(...)
    return self.EnumValue(...)
end

-- 取得
function Enum:get(v)
    if type(v) == 'number' then
        return lume.find(self._values, v)
    elseif type(v) == 'string' then
        return self._values[v]
    elseif Enum:EnumValue(self):isInstance(v) then
        return v
    end
    return nil
end

-- 検索
function Enum:has(v)
    return not not self:get(v)
end

return Enum
