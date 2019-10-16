
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Super = require 'Scene'

-- クラス
local Scene = class('Tavern', Super)
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
        '[Gilgamesh\'s Tavern]\n' ..
        'A)dd\n' ..
        'R)emove\n' ..
        '#)Inspect\n' ..
        'D)ivvy gold\n' ..
        'L)eave\n'
        , 0, 0
    )
end

-- キー入力
function Scene:keypressed(key, scancode, isrepeat)
    if key == 'a' then
        self:pushState 'Add'
    elseif key == 'r' then
        self:pushState 'Remove'
    elseif key == '1' or key == '2' or key == '3' or key == '4' or key == '5' or key == '6' then
        self:pushState('Inspect', tonumber(key))
    elseif key == 'd' then
        print('Divvy gold')
    elseif key == 'l' or key == 'return' then
        self:popScene()
    end
end

-- マウス入力
function Scene:mousepressed(x, y, button, istouch, presses)
    self:popScene()
end

local Add = Scene:addState 'Add'

-- 描画
function Add:draw()
    love.graphics.print(
        '[Gilgamesh\'s Tavern]\n' ..
        '(Letter) Selects, Enter to leave\n'
        , 0, 0
    )
end

-- キー入力
function Add:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        self:popState()
    end
end

local Remove = Scene:addState 'Remove'

-- 描画
function Remove:draw()
    love.graphics.print(
        '[Gilgamesh\'s Tavern]\n' ..
        'Remove\n'
        , 0, 0
    )
end

-- キー入力
function Remove:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        self:popState()
    end
end

local Inspect = Scene:addState 'Inspect'

-- ステート開始
function Inspect:enteredState(index)
    self.inspect = {
        index = index,
    }
end

-- 描画
function Inspect:draw()
    love.graphics.print(
        '[Gilgamesh\'s Tavern]\n' ..
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

return Scene
