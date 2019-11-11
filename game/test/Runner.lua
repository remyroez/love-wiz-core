
local class = require 'middleclass'
local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

-- 基底クラス
local Application = require 'Application'

-- アプリケーション：テストランナー
local Runner = class('Runner', Application)

-- 初期化
function Runner:initialize(...)
    Application.initialize(self, ...)
end

-- 読み込み
function Runner:load(...)
    describe('test-describe', function ()
        it('test-it', function ()
            expect(1).to.be.a('number')
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
