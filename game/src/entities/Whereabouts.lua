
local class = require 'middleclass'
local util = require 'util'

-- クラス：現在位置
local Whereabouts = class 'Whereabouts'

-- 組み込み
Whereabouts:include(require 'Readonly')

-- 初期化
function Whereabouts:initialize(t)
    t = t or {}

    self.place = t.place or ''
    self.x     = t.x or 0
    self.y     = t.y or 0
    self.level = t.level or ''
end

-- オーバーライド：比較
function Whereabouts:__eq(other)
    return util.equaltable(self, other, { 'place', 'x', 'y', 'level' })
end

return Whereabouts
