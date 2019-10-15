
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Super = require 'Scene'

-- クラス
local Scene = class('Tavern', Super)

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
    love.graphics.print('Tavern', 0, 0)
end

-- キー入力
function Scene:keypressed(key, scancode, isrepeat)
    self:popScene()
end

-- マウス入力
function Scene:mousepressed(x, y, button, istouch, presses)
    self:popScene()
end

return Scene
