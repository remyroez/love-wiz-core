
local class = require 'middleclass'

-- ＤＩコンテナ
local container = class 'container'

-- 初期化
function container:initialize(t)
    self.bindings = t or {}
end

-- オーバーライド：呼び出し
function container:__call(...)
    return self:get(...)
end

-- バインド
function container:bind(from, to)
    self.bindings[from] = to
    return self
end

-- 取得
function container:get(from, ...)
    local to = self.bindings[from]

    -- インスタンス化
    if type(to) == 'table' and type(to.new) == 'function' then
        -- クラス
        to = to:new(...)
    elseif type(to) == 'function' then
        -- 関数
        to = to(...)
    end

    -- テーブルなら依存関係の解決
    if type(to) == 'table' and (to.dependencies or (to.class and to.class.dependencies)) then
        -- 依存テーブルの取得
        local dependencies = to.dependencies or (to.class and to.class.dependencies)
        if type(dependencies) == 'function' then
            dependencies = dependencies(to, ...)
        end
        if type(dependencies) == 'table' then
            if dependencies[1] then
                -- 配列
                for i, from in ipairs(dependencies) do
                    if type(to[from]) == 'function' then
                        to[from](to, self:get(from, ...))
                    else
                        to[from] = self:get(from, ...)
                    end
                end
            else
                -- テーブル
                for name, from in pairs(dependencies) do
                    if type(to[name]) == 'function' then
                        to[name](to, self:get(from, ...))
                    else
                        to[name] = self:get(from, ...)
                    end
                end
            end
        end
    end
    return to
end

return container
