
local class = require 'middleclass'

-- クラス：能力値
local Attribute = class 'Attribute'

-- 組み込み
Attribute:include(require 'Class')
Attribute:include(require 'Clamp')

-- 初期化
function Attribute:initialize(t)
    self:initializeClamp(t)
end

return Attribute
