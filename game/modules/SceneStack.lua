
local class = require 'middleclass'

-- 基底クラス
local EntityStack = require 'EntityStack'

-- シーンスタック クラス
local SceneStack = class('SceneStack', EntityStack)

-- 初期化
function SceneStack:initialize()
    EntityStack.initialize(self)
end

-- キー入力
function SceneStack:keypressed(key, scancode, isrepeat)
    self:call('keypressed', key, scancode, isrepeat)
end

-- キー離した
function SceneStack:keyreleased(key, scancode)
    self:call('keyreleased', key, scancode)
end

-- マウス入力
function SceneStack:mousepressed(x, y, button, istouch, presses)
    self:call('mousepressed', x, y, button, istouch, presses)
end

-- マウス離した
function SceneStack:mousereleased(x, y, button, istouch, presses)
    self:call('mousereleased', x, y, button, istouch, presses)
end

-- マウス移動
function SceneStack:mousemoved(x, y, dx, dy, istouch)
    self:call('mousemoved', x, y, dx, dy, istouch)
end

-- マウスホイール
function SceneStack:wheelmoved(x, y)
    self:call('wheelmoved', x, y)
end

-- ゲームパッド入力
function SceneStack:gamepadpressed(joystick, button)
    self:call('gamepadpressed', joystick, button)
end

-- テキスト入力
function SceneStack:textinput(text)
    self:call('textinput', text)
end

-- リサイズ
function SceneStack:resize(width, height)
    self:callAll('resize', width, height)
end

return SceneStack
