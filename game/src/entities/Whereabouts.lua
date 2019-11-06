
local class = require 'middleclass'

-- クラス：現在位置
local Whereabouts = class 'Whereabouts'

-- 初期化
function Whereabouts:initialize(t)
    t = t or {}

    self.place = t.place or ''
    self.x     = t.x or 0
    self.y     = t.y or 0
    self.level = t.level or ''
end

return Whereabouts
