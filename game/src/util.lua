
local lume = require 'lume'

-- ユーティリティ
local util = {}

-- クラス (middleclass) かどうか調べる
function util.isClass(class)
    return type(class) == 'table'
        and type(class.name) == 'string'
        and type(class.static) == 'table'
end

-- インスタンスかどうか調べる
function util.isClassInstance(instance)
    return type(instance) == 'table' and util.isClass(instance.class)
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

-- モジュール引数からカレントパスを取得
function util.currentpath(...)
    return (...):gsub('%.init$', '') .. "."
end

-- モジュール読み込み関数を返す
function util.requirer(...)
    local path = util.currentpath(...)
    return function (v)
        if type(v) == 'table' then
            local modules = {}
            for _, name in ipairs(v) do
                modules[name] = require(path .. name)
            end
            return modules
        else
            return require(path .. tostring(v))
        end
    end
end

-- テーブル比較
function util.equaltable(a, b, keys)
    local equal = true
    if type(a) ~= type(b) then
        equal = false
    elseif type(a) ~= 'table' then
        equal = a == b
    else
        if not lume.isarray(keys) then
            keys = lume.keys(a)
        end
        for _, key in ipairs(keys) do
            if a[key] ~= b[key] then
                equal = false
                break
            end
        end
    end
    return equal
end

-- 配列比較
function util.equalarray(a, b)
    local equal = true
    if type(a) ~= type(b) then
        equal = false
    elseif not lume.isarray(a) then
        equal = false
    else
        for i, _ in ipairs(a) do
            if a[i] ~= b[i] then
                equal = false
                break
            end
        end
    end
    return equal
end

return util
