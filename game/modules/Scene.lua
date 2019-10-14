
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Entity = require 'Entity'

-- シーン クラス
local Scene = class('Scene', Entity)

-- 初期化
function Scene:initialize()
    Entity.initialize(self)
end

-- シーンの追加
function Scene:addScene(scene)
    if self.parent then
        lume.call(self.parent.add, self.parent, scene)
    end
end

-- シーンの削除
function Scene:removeScene(scene)
    if self.parent then
        lume.call(self.parent.remove, self.parent, scene)
    end
end

-- シーンのプッシュ
function Scene:pushScene(scene)
    if self.parent then
        lume.call(self.parent.push, self.parent, scene)
    end
end

-- シーンのポップ
function Scene:popScene()
    if self.parent then
        lume.call(self.parent.pop, self.parent)
    end
end

-- シーンのスワップ
function Scene:swapScene(scene)
    if self.parent then
        lume.call(self.parent.swap, self.parent, scene)
    end
end

return Scene
