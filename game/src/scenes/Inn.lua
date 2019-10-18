
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Super = require 'Scene'

-- クラス
local Scene = class('Inn', Super)

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
        '[Adventurer\'s Inn]\n\n' ..
        'Who (#) will stay ?\n' ..
        'ENTER to leave'
        , 0, 0
    )
end

-- キー入力
function Scene:keypressed(key, scancode, isrepeat)
    if key == '1' or key == '2' or key == '3' or key == '4' or key == '5' or key == '6' then
        self:pushState('Stay', tonumber(key))
    elseif key == 'return' then
        self:popScene()
    end
end

-- マウス入力
function Scene:mousepressed(x, y, button, istouch, presses)
    --self:popScene()
end

-- ステート追加
local Stay = Scene:addState 'Stay'

-- ステート開始時
function Stay:enteredState(index)
    self.stay = {
        index = index,
    }
end

-- 描画
function Stay:draw()
    love.graphics.print(
        '[Adventurer\'s Inn]\n\n' ..
        'Welcome, ' .. self.stay.index .. '.  We have:\n\n' ..
        'A) The stables <FREE!>\n' ..
        'B) A cot. 10 GP/WEEK\n' ..
        'C) Economy rooms. 50 GP/WEEK\n' ..
        'D) Merchant suites. 200 GP/WEEK\n' ..
        'E) The royal suite. 500 GP/WEEK\n\n' ..
        'P)ool gold, or L)eave\n\n' ..
        'You have ' .. 60 .. ' G.P.'
        , 0, 0
    )
end

-- キー入力
function Stay:keypressed(key, scancode, isrepeat)
    if key == 'a' or key == 'b' or key == 'c' or key == 'd' or key == 'e' then
        self:pushState('Nap', key)
    elseif key == 'p' then
        print('Pool gold')
    elseif key == 'l' or key == 'return' then
        self:popState()
    end
end

-- ステート追加
local Nap = Scene:addState 'Nap'

-- ステート開始時
function Nap:enteredState(room)
    self.nap = {
        room = room,
    }
end

-- 描画
function Nap:draw()
    love.graphics.print(
        '[Adventurer\'s Inn]\n\n' ..
        self.stay.index .. ' is napping.\n' .. self.nap.room
        , 0, 0
    )
end

-- キー入力
function Nap:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        self:gotoState 'Grow'
    end
end

-- ステート追加
local Grow = Scene:addState 'Grow'

-- 描画
function Grow:draw()
    love.graphics.print(
        '[Adventurer\'s Inn]\n\n' ..
        'You need ' .. 28 .. ' move\n' ..
        'E.P. to make the next level.' ..
        '\n\nENTER to leave'
        , 0, 0
    )
end

-- キー入力
function Grow:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        self:gotoState('Stay', self.stay.index)
    end
end

return Scene
