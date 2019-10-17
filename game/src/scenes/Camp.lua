
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Super = require 'Scene'

-- クラス
local Scene = class('Camp', Super)

-- 組み込み
Scene:include(require 'stateful')

-- 初期化
function Scene:initialize(t)
    Super.initialize(self)

    self.app = t.app or {}
end

-- 破棄
function Scene:destroy()
end

-- 更新
function Scene:update(dt)
end

-- 描画
function Scene:draw()
    love.graphics.print(
        '[Camp]\n' ..
        '#)Inspect\n' ..
        'R)eorder\n' ..
        'E)quip\n' ..
        'L)eave',
        0, 0
    )
end

-- キー入力
function Scene:keypressed(key, scancode, isrepeat)
    if key == '1' or key == '2' or key == '3' or key == '4' or key == '5' or key == '6' then
        self:pushState('Inspect', tonumber(key))
    elseif key == 'r' then
        self:pushState 'Reorder'
    elseif key == 'e' then
        self:pushState 'Equip'
    elseif key == 'l' or key == 'return' then
        self:popScene()
    end
end

-- マウス入力
function Scene:mousepressed(x, y, button, istouch, presses)
    --self:popScene()
end

-- ステート追加
local Inspect = Scene:addState 'Inspect'

-- ステート開始時
function Inspect:enteredState(index)
    self.inspect = {
        index = index,
    }
end

-- 描画
function Inspect:draw()
    love.graphics.print(
        '[Camp]\n' ..
        'Inspect #' .. self.inspect.index
        , 0, 0
    )
end

-- キー入力
function Inspect:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        self:popState()
    end
end

-- ステート追加
local Reorder = Scene:addState 'Reorder'

-- 描画
function Reorder:draw()
    love.graphics.print(
        '[Camp]\n' ..
        'Reorder\n'
        , 0, 0
    )
end

-- キー入力
function Reorder:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        self:popState()
    end
end

-- キー入力
function Inspect:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        self:popState()
    end
end

-- ステート追加
local Equip = Scene:addState 'Equip'

-- 描画
function Equip:draw()
    love.graphics.print(
        '[Camp]\n' ..
        'Equip\n'
        , 0, 0
    )
end

-- キー入力
function Equip:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        self:popState()
    end
end

return Scene
