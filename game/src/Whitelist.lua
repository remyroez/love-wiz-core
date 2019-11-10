
local class = require 'middleclass'
local lume = require 'lume'

-- ホワイトリスト
local Whitelist = class 'Whitelist'

-- 初期化
function Whitelist:initialize(t)
    self.list = t or {}
end

-- オーバーライド：比較
function Whitelist:__eq(other)
    local equal = true
    if #self.list ~= #other.list then
        equal = false
    else
        for i, value in ipairs(self.list) do
            if value ~= other.list[i] then
                equal = false
                break
            end
        end
    end
    return equal
end

-- オーバーライド：呼び出し
function Whitelist:__call(...)
    return self:allow(...)
end

-- チェック
function Whitelist:allow(v)
    return #self.list == 0 or not not lume.find(self.list, v)
end

return Whitelist
