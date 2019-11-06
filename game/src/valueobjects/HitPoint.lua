
local class = require 'middleclass'

-- クラス：ヒットポイント
local HitPoint = class 'HitPoint'

-- 組み込み
HitPoint:include(require 'Class')
HitPoint:include(require 'Clamp')

-- 初期化
function HitPoint:initialize(t)
    self:initializeClamp(t)
end

return HitPoint
