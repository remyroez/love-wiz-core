
local class = require 'middleclass'

-- リードオンリー
local Readonly = { static = {} }

-- メタメソッド
local metamethods = {
    '__mode',
    '__call',
    '__tostring',
    '__len',
    '__pairs',
    '__ipairs',
    '__gc',
    '__unm',
    '__add',
    '__sub',
    '__mul',
    '__div',
    '__idiv',
    '__mod',
    '__pow',
    '__concat',
    '__band',
    '__bor',
    '__bxor',
    '__bnot',
    '__shl',
    '__shr',
    '__eq',
    '__lt',
    '__le',
}

-- 指定したテーブルをリードオンリーにする
-- http://lua-users.org/wiki/ReadOnlyTables
local function readonlytable(t)
    local mt = {
        __index = t,
        __newindex = function(...)
            error("attempt to modify read-only table")
        end,
        __metatable = false
    }
    for _, meta in ipairs(metamethods) do
        mt[meta] = t[meta]
    end
    return setmetatable({}, mt);
 end

 -- インスタンス化時にリードオンリーにする
function Readonly.static:new(...)
    assert(type(self) == 'table', "Make sure that you are using 'Class:new' instead of 'Class.new'")
    local instance = self:allocate()
    instance:initialize(...)
    return readonlytable(instance)
end

return Readonly
