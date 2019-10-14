
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local EntityManager = require 'EntityManager'

-- エンティティスタック クラス
local EntityStack = class('EntityStack', EntityManager)

-- 初期化
function EntityStack:initialize()
    EntityManager.initialize(self)
end

-- 先頭のエンティティ
function EntityStack:top()
    return lume.last(self.entities)
end

-- 呼び出し（すべて）
function EntityStack:callAll(event, ...)
    EntityManager.call(self, event, ...)
end

-- 呼び出し
function EntityStack:call(event, ...)
    local entity = self:top()
    if entity then
        lume.call(entity[event], entity, ...)
    end
end

-- 先頭にエンティティを追加する
EntityStack.push = EntityStack.add

-- 先頭のエンティティを除外する
function EntityStack:pop()
    return self:remove(self:top())
end

-- 先頭のエンティティを入れ替える
function EntityStack:swap(entity)
    self:pop()
    return self:add(entity)
end

return EntityStack
