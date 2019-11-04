
local lume = require 'lume'

-- ユーティリティ
local util = {}

-- クラス (middleclass) かどうか調べる
function util.isClass(class)
    return type(class) == 'table'
        and type(class.name) == 'string'
        and type(class.static) == 'table'
end

-- クラスのインスタンスかどうか調べる
function util.isInstance(class, instance)
    return lume.call(instance.isInstanceOf, instance, class)
end

-- メタメソッド
local freeze_metamethods = {
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
function util.freeze(t)
    local mt = {
        __index = t,
        __newindex = function(...)
            error("attempt to modify read-only table")
        end,
        __metatable = false
    }
    for _, meta in ipairs(freeze_metamethods) do
        mt[meta] = t[meta]
    end
    return setmetatable({}, mt);
end

-- 有効なランダマイザを返す
function util.randomizer(randomizer)
    return randomizer or love.math.random
end

return util
