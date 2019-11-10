
local class = require 'middleclass'
local lume = require 'lume'

-- クラス：アーマークラス
local ArmorClass = class 'ArmorClass'

-- 組み込み
ArmorClass:include(require 'Class')
ArmorClass:include(require 'Numeric')
ArmorClass:include(require 'Readonly')

-- 初期化
function ArmorClass:initialize(v)
    self:initializeNumeric(v)
end

-- オーバーライド：文字列化
function ArmorClass:__tostring()
    if self.value <= -10 then
        return 'LO'
    else
        return tostring(self.value)
    end
end

return ArmorClass
