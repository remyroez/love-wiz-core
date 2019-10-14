
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Scene = require 'Scene'

-- インゲーム クラス
local InGame = class('InGame', Scene)

-- 初期化
function InGame:initialize(t)
    Scene.initialize(self)

    self.app = t.app or {}
end

-- 破棄
function InGame:destroy()
end

-- 更新
function InGame:update(dt)
end

-- 描画
function InGame:draw()
    love.graphics.print('Hello, InGame Scene!', 0, 100)
end

-- キー入力
function InGame:keypressed(key, scancode, isrepeat)
    self:popScene()
end

-- マウス入力
function InGame:mousepressed(x, y, button, istouch, presses)
    self:popScene()
end

return InGame
