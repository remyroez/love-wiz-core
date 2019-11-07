
local class = require 'middleclass'

-- クラス：呪文ポイント
local SpellPoint = class 'SpellPoint'

-- 組み込み
SpellPoint:include(require 'Class')
SpellPoint:include(require 'Clamp')
SpellPoint:include(require 'Readonly')

-- 初期化
function SpellPoint:initialize(t)
    self:initializeClamp(t)
end

return SpellPoint
