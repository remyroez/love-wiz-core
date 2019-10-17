
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Super = require 'Scene'

-- クラス
local Scene = class('Maze', Super)

-- 組み込み
Scene:include(require 'stateful')

-- 初期化
function Scene:initialize(t)
    Super.initialize(self)

    self.app = t.app or {}

    self.visibleStatus = true
    self.visibleAll = true
end

-- 破棄
function Scene:destroy()
end

-- 更新
function Scene:update(dt)
end

-- 描画
function Scene:draw()
    if not self.visibleAll then return end
    love.graphics.print(
        '[Maze]\n' ..
        'C)amp\n' ..
        'S)tatus\n' ..
        'I)nspect\n' ..
        'O)ff\n\n' ..
        'Status = ' .. tostring(self.visibleStatus),
        0, 0
    )
end

-- キー入力
function Scene:keypressed(key, scancode, isrepeat)
    if key == 'c' then
        self:pushScene(require 'scenes.Camp' { app = self.app })
    elseif key == 's' then
        self.visibleStatus = not self.visibleStatus
    elseif key == 'i' then
        self:pushState 'Inspect'
    elseif key == 'o' then
        self.visibleAll = not self.visibleAll
    elseif key == 'return' then
        self:swapScene(require 'scenes.Castle' { app = self.app })
    end
end

-- マウス入力
function Scene:mousepressed(x, y, button, istouch, presses)
    --self:popScene()
end

-- ステート追加
local Inspect = Scene:addState 'Inspect'

-- 描画
function Inspect:draw()
    love.graphics.print(
        '[Maze]\n' ..
        'Inspect'
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
