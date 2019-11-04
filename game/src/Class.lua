
local class = require 'middleclass'
local lume = require 'lume'
local util = require 'util'

-- クラス
local Class = { static = {} }

-- インスタンスかどうか調べる
function Class.static.isInstance(self, v)
    return util.isInstance(self, v)
end

return Class
