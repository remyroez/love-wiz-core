
local class = require 'middleclass'
local util = require 'util'

-- リードオンリー
local Readonly = { static = {} }

 -- インスタンス化時にリードオンリーにする
function Readonly.static:new(...)
    assert(type(self) == 'table', "Make sure that you are using 'Class:new' instead of 'Class.new'")
    local instance = self:allocate()
    instance:initialize(...)
    if instance and instance.onFreeze then instance:onFreeze() end
    return util.freeze(instance)
end

return Readonly
