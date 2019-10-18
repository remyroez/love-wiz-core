
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Super = require 'Scene'

-- インゲーム クラス
local Scene = class('Training', Super)

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
        '[Training Grounds]\n\n' ..
        'C)reate a character\n' ..
        'I)nspect a character\n' ..
        'R)oster of characters\n' ..
        'L)eave'
        , 0, 0
    )
end

-- キー入力
function Scene:keypressed(key, scancode, isrepeat)
    if key == 'c' then
        self:pushState 'Create'
    elseif key == 'i' then
        self:pushState 'Inspect'
    elseif key == 'r' then
        self:pushState 'Roster'
    elseif key == 'l' or key == 'return' then
        self:popScene()
    end
end

-- マウス入力
function Scene:mousepressed(x, y, button, istouch, presses)
    --self:popScene()
end

-- ステート追加
local Create = Scene:addState 'Create'

-- 描画
function Create:draw()
    love.graphics.print(
        '[Training Grounds]\n\n' ..
        'Create'
        , 0, 0
    )
end

-- キー入力
function Create:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        self:popState()
    end
end

-- ステート追加
local Inspect = Scene:addState 'Inspect'

-- 描画
function Inspect:draw()
    love.graphics.print(
        '[Training Grounds]\n\n' ..
        '(LETTER) SELECTS, ENTER TO LEAVE\n\n' ..
        'A) LLEW'
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
local Roster = Scene:addState 'Roster'

-- 描画
function Roster:draw()
    love.graphics.print(
        '[Training Grounds]\n\n' ..
        'Press ENTER'
        , 0, 0
    )
end

-- キー入力
function Roster:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        self:popState()
    end
end

return Scene
