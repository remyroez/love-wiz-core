
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Super = require 'Scene'

-- クラス
local Scene = class('Maze', Super)

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
        '[Maze]\n' ..
        'C)amp\n' ..
        'S)tatus\n' ..
        'I)nspect\n' ..
        'O)ff',
        0, 0
    )
end

-- キー入力
function Scene:keypressed(key, scancode, isrepeat)
    if key == 'c' then
        self:pushScene(require 'scenes.Camp' { app = self.app })
    elseif key == 's' then
        print('Status')
    elseif key == 'i' then
        print('Inspect')
    elseif key == 'o' then
        print('Off')
    elseif key == 'return' then
        self:swapScene(require 'scenes.Castle' { app = self.app })
    end
end

-- マウス入力
function Scene:mousepressed(x, y, button, istouch, presses)
    --self:popScene()
end

return Scene
