
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Super = require 'Scene'

-- クラス
local Scene = class('Castle', Super)

-- 初期化
function Scene:initialize(t)
    Super.initialize(self)

    self.app = t.app or {}

    self.text = '[Castle]\n\n'
    self.text = self.text .. 'G)ilgamesh\'s Tavern\n'
    self.text = self.text .. 'A)dventurer\'s Inn\n'
    self.text = self.text .. 'T)emple of Cant\n'
    self.text = self.text .. 'B)oltac\'s Trading Post\n'
    self.text = self.text .. 'E)dge of Town\n'
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
    if key == 'g' then
        self:pushScene(require 'scenes.Tavern' { app = self.app })
    elseif key == 'a' then
        self:pushScene(require 'scenes.Inn' { app = self.app })
    elseif key == 't' then
        self:pushScene(require 'scenes.Temple' { app = self.app })
    elseif key == 'b' then
        self:pushScene(require 'scenes.Shop' { app = self.app })
    elseif key == 'e' or key == 'return' then
        self:swapScene(require 'scenes.Edge' { app = self.app })
    end
end

-- マウス入力
function Scene:mousepressed(x, y, button, istouch, presses)
    --self:popScene()
end

return Scene
