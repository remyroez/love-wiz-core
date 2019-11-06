
local class = require 'middleclass'

-- クラス：攻撃回数
local AttackTimeLevel = class 'AttackTimeLevel'

-- 初期化
function AttackTimeLevel:initialize(t)
    t = t or {}

    self.levelunit = t.levelunit or 0
    self.modifier = t.modifier or 0
end

-- オーバーライド：呼び出し
function AttackTimeLevel:__call(...)
    return self:get(...)
end

-- レベルに応じた攻撃回数を返す
function AttackTimeLevel:get(level)
    return 1 + math.fllor(level / 5) + self.modifier
end

return AttackTimeLevel
