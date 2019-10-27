
local class = require 'middleclass'
local lume = require 'lume'

-- クラス
local Class = { static = {} }

-- インスタンスかどうか調べる
function Class.static.isInstance(self, v)
    return lume.call(v.isInstanceOf, v, self)
end

return Class
