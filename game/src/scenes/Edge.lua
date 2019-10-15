
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Super = require 'Scene'

-- クラス
local Scene = class('Edge', Super)

-- 初期化
function Scene:initialize(t)
    Super.initialize(self)

    self.app = t.app or {}

    self.text = '[Edge of Town]\n'
    self.text = self.text .. 'T)raining\n'
    self.text = self.text .. 'M)aze\n'
    self.text = self.text .. 'C)astle\n'
end

-- 破棄
function Scene:destroy()
end

-- 更新
function Scene:update(dt)
end

-- 描画
function Scene:draw()
    love.graphics.print(self.text, 0, 0)
end

-- キー入力
function Scene:keypressed(key, scancode, isrepeat)
    if key == 't' then
        self:pushScene(require 'scenes.Training' { app = self.app })
    elseif key == 'm' then
        self:pushScene(require 'scenes.Maze' { app = self.app })
    elseif key == 'c' then
        self:swapScene(require 'scenes.Castle' { app = self.app })
    end
end

-- マウス入力
function Scene:mousepressed(x, y, button, istouch, presses)
    --self:popScene()
end

return Scene
