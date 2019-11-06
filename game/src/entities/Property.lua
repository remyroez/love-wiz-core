
local class = require 'middleclass'

-- クラス：所持品
local Property = class 'Property'

-- 初期化
function Property:initialize(t)
    t = t or {}

    self.item = t.item or ''
    self.equipped = t.equipped or false
    self.identified = t.identified or false
    self.cursed = t.cursed or false
end

return Property
