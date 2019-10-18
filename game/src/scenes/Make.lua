
local class = require 'middleclass'
local lume = require 'lume'

-- 基底クラス
local Super = require 'Scene'

-- クラス
local Scene = class('Make', Super)

-- 組み込み
Scene:include(require 'stateful')

-- 初期化
function Scene:initialize(t)
    Super.initialize(self)

    self.app = t.app or {}
    self.character = {
        name = '',
        password = '',
        alignment = '',
        race = '',
        class = '',
    }
end

-- 破棄
function Scene:destroy()
end

-- 更新
function Scene:update(dt)
end

-- 描画
function Scene:draw()
    self:printCharacterData()
    love.graphics.print(
        '\n\n' ..
        '>\n\n' ..
        'ENTER A NAME FOR YOUR CHARACTER:'
        , 0, 0
    )
end

-- 描画
function Scene:printCharacterData()
    love.graphics.print(
        (#self.character.name == 0 and '???' or self.character.name) .. ' ' ..
        'L ' .. 1 .. ' ' ..
        (#self.character.alignment == 0 and '?' or self.character.alignment) .. '-' ..
        (#self.character.class == 0 and '???' or self.character.class) .. ' ' ..
        (#self.character.race == 0 and '???' or self.character.race)
        , 0, 0
    )
end

-- キー入力
function Scene:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        self.character.name = 'ROBERT'
        self:gotoState 'Password'
    elseif key == 'backspace' then
        self:popScene()
    end
end

-- マウス入力
function Scene:mousepressed(x, y, button, istouch, presses)
    --self:popScene()
end

-- ステート追加
local Password = Scene:addState 'Password'

-- 描画
function Password:draw()
    self:printCharacterData()
    love.graphics.print(
        '\n\n' ..
        '>\n\n' ..
        'ENTER PASSWORD:'
        , 0, 0
    )
end

-- キー入力
function Password:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        self:gotoState 'Race'
    end
end

-- ステート追加
local Race = Scene:addState 'Race'

-- 描画
function Race:draw()
    self:printCharacterData()
    love.graphics.print(
        '\n\n' ..
        'A) HUMAN\n' ..
        'B) ELF\n' ..
        'C) DWARF\n' ..
        'D) GNOME\n' ..
        'E) HOBBIT\n' ..
        '\n' ..
        'CHOOSE RACE:'
        , 0, 0
    )
end

-- 種族テーブル（仮）
local races = { a = 'HUMAN', b = 'ELF', c = 'DWARF', d = 'GNOME', e = 'HOBBIT' }

-- キー入力
function Race:keypressed(key, scancode, isrepeat)
    if races[key] then
        self.character.race = races[key]
        self:gotoState 'Alignment'
    end
end

-- ステート追加
local Alignment = Scene:addState 'Alignment'

-- 描画
function Alignment:draw()
    self:printCharacterData()
    love.graphics.print(
        '\n\n' ..
        'A) GOOD\n' ..
        'B) NEUTRAL\n' ..
        'C) EVIL\n' ..
        '\n' ..
        'CHOOSE ALIGNMENT:'
        , 0, 0
    )
end

-- アライメントテーブル（仮）
local alignments = { a = 'G', b = 'N', c = 'E' }

-- キー入力
function Alignment:keypressed(key, scancode, isrepeat)
    if alignments[key] then
        self.character.alignment = alignments[key]
        self:gotoState 'Bonus'
    end
end

-- ステート追加
local Bonus = Scene:addState 'Bonus'

-- 描画
function Bonus:draw()
    self:printCharacterData()
    love.graphics.print(
        '\n\n' ..
        'STRENGTH\n' ..
        'I.Q.\n' ..
        'PIETY\n' ..
        'VITALITY\n' ..
        'AGILITY\n' ..
        'LUCK\n' ..
        '\n' ..
        'BONUS\n' ..
        '\n' ..
        'enter MOVES POINTER, up AND down ALTER\n' ..
        'SCORES. PRESS  (ESC) WHEN FINISHED.'
        , 0, 0
    )
    love.graphics.print(
        '\n\n' ..
        8 .. '\n' ..
        8 .. '\n' ..
        5 .. '\n' ..
        8 .. '\n' ..
        8 .. '\n' ..
        9 .. '\n' ..
        '\n' ..
        6 .. '\n'
        , 100, 0
    )
    love.graphics.print(
        '\n\n' ..
        'A) FIGHTER\n' ..
        'B) MAGE\n' ..
        'C) PRIEST\n' ..
        'D) THIEF\n' ..
        'E) BISHOP\n' ..
        'F) LORD\n' ..
        'G) NINJA\n' ..
        'H) SAMURAI\n'
        , 200, 0
    )
end

-- キー入力
function Bonus:keypressed(key, scancode, isrepeat)
    if key == 'return' then
        print('move')
    elseif key == 'up' then
        print('up score')
    elseif key == 'down' then
        print('down score')
    elseif key == 'escape' then
        self:gotoState 'Class'
    end
end

-- ステート追加
local Class = Scene:addState 'Class'

-- 描画
function Class:draw()
    self:printCharacterData()
    love.graphics.print(
        '\n\n' ..
        'STRENGTH\n' ..
        'I.Q.\n' ..
        'PIETY\n' ..
        'VITALITY\n' ..
        'AGILITY\n' ..
        'LUCK\n' ..
        '\n' ..
        'BONUS\n' ..
        '\n' ..
        'SELECT CLASS:'
        , 0, 0
    )
    love.graphics.print(
        '\n\n' ..
        8 .. '\n' ..
        8 .. '\n' ..
        5 .. '\n' ..
        8 .. '\n' ..
        8 .. '\n' ..
        9 .. '\n' ..
        '\n' ..
        6 .. '\n'
        , 100, 0
    )
    love.graphics.print(
        '\n\n' ..
        'A) FIGHTER\n' ..
        'B) MAGE\n' ..
        'C) PRIEST\n' ..
        'D) THIEF\n' ..
        'E) BISHOP\n' ..
        'F) LORD\n' ..
        'G) NINJA\n' ..
        'H) SAMURAI\n'
        , 200, 0
    )
end

-- クラステーブル（仮）
local classes = {
    a = 'FIG',
    b = 'MAG',
    c = 'PRI',
    d = 'THI',
    e = 'BIS',
    f = 'LOR',
    g = 'NIN',
    h = 'SAM',
}

-- キー入力
function Class:keypressed(key, scancode, isrepeat)
    if classes[key] then
        self.character.class = classes[key]
        self:gotoState 'Confirm'
    end
end

-- ステート追加
local Confirm = Scene:addState 'Confirm'

-- 描画
function Confirm:draw()
    self:printCharacterData()
    love.graphics.print(
        '\n\n' ..
        'STRENGTH\n' ..
        'I.Q.\n' ..
        'PIETY\n' ..
        'VITALITY\n' ..
        'AGILITY\n' ..
        'LUCK\n' ..
        '\n' ..
        'BONUS\n' ..
        '\n' ..
        'KEEP THIS CHARACTER (Y/N)?'
        , 0, 0
    )
    love.graphics.print(
        '\n\n' ..
        8 .. '\n' ..
        8 .. '\n' ..
        5 .. '\n' ..
        8 .. '\n' ..
        8 .. '\n' ..
        9 .. '\n' ..
        '\n' ..
        6 .. '\n'
        , 100, 0
    )
    love.graphics.print(
        '\n\n' ..
        'A) FIGHTER\n' ..
        'B) MAGE\n' ..
        'C) PRIEST\n' ..
        'D) THIEF\n' ..
        'E) BISHOP\n' ..
        'F) LORD\n' ..
        'G) NINJA\n' ..
        'H) SAMURAI\n'
        , 200, 0
    )
end

-- キー入力
function Confirm:keypressed(key, scancode, isrepeat)
    if key == 'y' then
        self:popScene()
    elseif key == 'n' then
        self:popScene()
    end
end

return Scene
