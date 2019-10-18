
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Super = require 'Scene'

-- クラス
local Scene = class('Temple', Super)

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
        '[Temple of Cant]\n\n' ..
        'Welcome to The Temple of cant\n' ..
        'Who (letter) shall we help ?\n' ..
        'ENTER to leave'
        , 0, 0
    )
end

-- キー入力
function Scene:keypressed(key, scancode, isrepeat)
    local target = string.match(key, '^%a$')
    if target then
        self:pushState('Tithe', target)
    elseif key == 'return' then
        self:popScene()
    end
end

-- マウス入力
function Scene:mousepressed(x, y, button, istouch, presses)
    --self:popScene()
end

-- ステート追加
local Tithe = Scene:addState 'Tithe'

-- ステート開始時
function Tithe:enteredState(target)
    print(target)
    self.tithe = {
        target = target,
    }
end

-- 描画
function Tithe:draw()
    love.graphics.print(
        '[Temple of Cant]\n\n' ..
        'The donation will be ' .. 1750 .. '\n' ..
        'Who (#) will tithe ?\n' ..
        'ENTER to leave'
        , 0, 0
    )
end

-- キー入力
function Tithe:keypressed(key, scancode, isrepeat)
    if key == '1' or key == '2' or key == '3' or key == '4' or key == '5' or key == '6' then
        print('* Cheap apostates! Out! *')
    elseif key == 'return' then
        self:popState()
    end
end

return Scene
