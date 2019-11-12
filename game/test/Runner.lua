
local class = require 'middleclass'
local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

-- 基底クラス
local Application = require 'Application'

-- アプリケーション：テストランナー
local Runner = class('Runner', Application)

-- コンソール色変更
local red = string.char(27) .. '[31m'
local green = string.char(27) .. '[32m'
local normal = string.char(27) .. '[0m'

-- 初期化
function Runner:initialize(...)
    Application.initialize(self, ...)

    -- 自動終了
    self.autoquit = true
end

-- 読み込み
function Runner:load(args)
    -- 空行
    print()

    -- テスト実行
    self:test(args)

    -- エラー数とパス数を出力
    if lust.errors > 0 then
        io.write(red .. lust.errors .. normal .. ' failed, ')
    end
    print(green .. lust.passes .. normal .. ' passed')

    -- エラー、または自動終了なら終了
    if lust.errors > 0 then
        love.event.quit(1)
    elseif self.autoquit then
        love.event.quit()
    end
end

-- テスト
function Runner:test(args)
    describe('requires', function ()
        it('entities', function ()
            expect(require 'entities').to.be.a('table')
        end)
        it('enums', function ()
            expect(require 'enums').to.be.a('table')
        end)
        it('valueobjects', function ()
            expect(require 'valueobjects').to.be.a('table')
        end)
        it('Game', function ()
            expect(require 'Game').to.be.a('table')
        end)
    end)
end

-- 更新
function Runner:update(dt, ...)
end

-- 描画
function Runner:draw(...)
end

return Runner
