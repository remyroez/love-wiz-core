
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Super = require 'Scene'

-- クラス
local Scene = class('Scene', Super)

-- 組み込み
Scene:include(require 'stateful')

-- 初期化
function Scene:initialize(t)
    Super.initialize(self)

    self.app = t.app or {}

    self.trader = 0
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
        "[Boltac's Trading Post]\n\n" ..
        "Welcome to Boltac's Trading Post\n\n" ..
        'Who (#) will enter ?\n' ..
        'ENTER to leave'
        , 0, 0
    )
end

-- キー入力
function Scene:keypressed(key, scancode, isrepeat)
    if key == '1' or key == '2' or key == '3' or key == '4' or key == '5' or key == '6' then
        self:pushState('Trade', tonumber(key))
    elseif key == 'return' then
        self:popScene()
    end
end

-- マウス入力
function Scene:mousepressed(x, y, button, istouch, presses)
    --self:popScene()
end

-- ステート追加
local Trade = Scene:addState 'Trade'

-- ステート開始時
function Trade:enteredState(index)
    self.trader = index
end

-- 描画
function Trade:draw()
    love.graphics.print(
        "[Boltac's Trading Post]\n\n" ..
        'Welcome, ' .. self.trader .. '.\n' ..
        'You have ' .. 300 .. 'GP.\n\n' ..
        'B)uy\n' ..
        'S)ell\n' ..
        'U)ncurse\n' ..
        'I)dentify\n' ..
        'P)ool gold\n' ..
        'L)eave'
        , 0, 0
    )
end

-- キー入力
function Trade:keypressed(key, scancode, isrepeat)
    if key == 'b' then
        self:pushState 'Buy'
    elseif key == 's' then
        self:pushState 'Sell'
    elseif key == 'u' then
        self:pushState 'Uncurse'
    elseif key == 'i' then
        self:pushState 'Identify'
    elseif key == 'p' then
        print('Pool gold')
    elseif key == 'l' or key == 'return' then
        self:popState()
    end
end

-- ステート追加
local Buy = Scene:addState 'Buy'

-- 描画
function Buy:draw()
    love.graphics.print(
        "[Boltac's Trading Post]\n\n" ..
        '1)' .. 'LONG SWORD ' .. 25 .. ' USELESS\n' ..
        '2)' .. 'SHORT SWORD ' .. 15 .. ' USELESS\n' ..
        '3)' .. 'ANOINTED MACE ' .. 30 .. '\n' ..
        '4)' .. 'ANOINTED FLAIL ' .. 150 .. ' USELESS\n' ..
        '5)' .. 'STAFF ' .. 10 .. '\n' ..
        '6)' .. 'DAGGER ' .. 5 .. ' USELESS\n' ..
        '\n' ..
        300 .. ' GP LEFT\n' ..
        '\n\n' ..
        'P)urchase B)ackward L)eave\n' ..
        'F)orward S)tart'
        , 0, 0
    )
end

-- キー入力
function Buy:keypressed(key, scancode, isrepeat)
    if key == 'p' then
        self:pushState 'Purchase'
    elseif key == 'f' then
        print('Forward')
    elseif key == 'b' then
        print('Backward')
    elseif key == 's' then
        print('Start')
    elseif key == 'l' or key == 'return' then
        self:popState()
    end
end

-- ステート追加
local Purchase = Scene:addState 'Purchase'

-- 描画
function Purchase:draw()
    love.graphics.print(
        "[Boltac's Trading Post]\n\n" ..
        '1)' .. 'LONG SWORD ' .. 25 .. ' USELESS\n' ..
        '2)' .. 'SHORT SWORD ' .. 15 .. ' USELESS\n' ..
        '3)' .. 'ANOINTED MACE ' .. 30 .. '\n' ..
        '4)' .. 'ANOINTED FLAIL ' .. 150 .. ' USELESS\n' ..
        '5)' .. 'STAFF ' .. 10 .. '\n' ..
        '6)' .. 'DAGGER ' .. 5 .. ' USELESS\n' ..
        '\n' ..
        'Purchase (#) (ENTER to leave) ? >'
        , 0, 0
    )
end

-- キー入力
function Purchase:keypressed(key, scancode, isrepeat)
    if key == '1' or key == '2' or key == '3' or key == '4' or key == '5' or key == '6' then
        print(key .. '\n' .. '* YOU CANNOT AFFORD THAT *')
    elseif key == 'return' then
        self:popState()
    end
end

-- ステート追加
local Sell = Scene:addState 'Sell'

-- 描画
function Sell:draw()
    love.graphics.print(
        "[Boltac's Trading Post]\n\n" ..
        '1)' .. '#KEYofSILVER ' ..  0 .. '\n' ..
        '2)' .. '#KEYofBRONZE ' ..  0 .. '\n' ..
        '3)' .. '#STATUEofFROG ' ..  0 .. '\n' ..
        '4)' .. '*ANOINTED MACE ' .. 15 .. '\n' ..
        '5)' .. '*ROBES ' ..  7 .. '\n' ..
        '6)' .. '#HELM ' .. 50 .. '\n' ..
        '7)' .. '#HELM ' .. 50 .. '\n' ..
        '8)' .. '#HELM ' .. 50 .. '\n' ..
        '\n' ..
        'Sell which (#) > >'
        , 0, 0
    )
end

-- キー入力
function Sell:keypressed(key, scancode, isrepeat)
    if key == '1' or key == '2' or key == '3' or key == '4' or key == '5' or key == '6' or key == '7' or key == '8' then
        print(key .. '\n' .. '* NOT INTERESTED IN THAT ITEM *')
    elseif key == 'return' then
        self:popState()
    end
end

-- ステート追加
local Uncurse = Scene:addState 'Uncurse'

-- 描画
function Uncurse:draw()
    love.graphics.print(
        "[Boltac's Trading Post]\n\n" ..
        '1)' .. '#KEYofSILVER ' .. 150000 .. '\n' ..
        '2)' .. '#KEYofBRONZE ' .. 150000 .. '\n' ..
        '3)' .. '#STATUEofFROG ' .. 150000 .. '\n' ..
        '4)' .. '*ANOINTED MACE ' .. 15 .. '\n' ..
        '5)' .. '*ROBES ' ..  7 .. '\n' ..
        '6)' .. '#HELM ' .. 50 .. '\n' ..
        '7)' .. '#HELM ' .. 50 .. '\n' ..
        '8)' .. '#HELM ' .. 50 .. '\n' ..
        '\n' ..
        'Uncurse which (#) > >'
        , 0, 0
    )
end

-- キー入力
function Uncurse:keypressed(key, scancode, isrepeat)
    if key == '1' or key == '2' or key == '3' or key == '4' or key == '5' or key == '6' or key == '7' or key == '8' then
        print(key .. '\n' .. '* THAT IS NOT A CURSED ITEM *')
    elseif key == 'return' then
        self:popState()
    end
end

-- ステート追加
local Identify = Scene:addState 'Identify'

-- 描画
function Identify:draw()
    love.graphics.print(
        "[Boltac's Trading Post]\n\n" ..
        '1)' .. '#KEYofSILVER ' .. 150000 .. '\n' ..
        '2)' .. '#KEYofBRONZE ' .. 150000 .. '\n' ..
        '3)' .. '#STATUEofFROG ' .. 150000 .. '\n' ..
        '4)' .. '*ANOINTED MACE ' .. 15 .. '\n' ..
        '5)' .. '*ROBES ' ..  7 .. '\n' ..
        '6)' .. '#HELM ' .. 50 .. '\n' ..
        '7)' .. '#HELM ' .. 50 .. '\n' ..
        '8)' .. '#HELM ' .. 50 .. '\n' ..
        '\n' ..
        'Identify which (#) > >'
        , 0, 0
    )
end

-- キー入力
function Identify:keypressed(key, scancode, isrepeat)
    if key == '1' or key == '2' or key == '3' or key == '4' or key == '5' or key == '6' or key == '7' or key == '8' then
        print(key .. '\n* THAT HAS BEEN IDENTIFIED *')
    elseif key == 'return' then
        self:popState()
    end
end

return Scene
