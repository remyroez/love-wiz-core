
local class = require 'middleclass'
local lume = require 'lume'
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

-- 失敗の出力
local function fail(name, message)
    print(string.rep('\t', lust.level) .. red .. 'FAIL' .. normal .. ' ' .. name)
    print(string.rep('\t', lust.level + 1) .. red .. message .. normal)
end

-- 初期化
function Runner:initialize(...)
    Application.initialize(self, ...)

    -- 保留
    self.pending = {}
end

-- 読み込み
function Runner:load(args)
    -- 空行
    print()

    -- テストファイルのリストアップ
    local files = nil
    if type(args) ~= 'table' or #args == 0 then
        files = love.filesystem.getDirectoryItems('test')
    else
        files = lume.clone(args)
    end
    lume.remove(files, 'Runner.lua')
    lume.remove(files, 'lust.lua')

    -- テスト実行
    local time = lume.time(self.test, self, files)

    -- エラー数とパス数を出力
    if lust.errors > 0 then
        io.write(red .. lust.errors .. normal .. ' failed, ')
    end
    io.write(green .. lust.passes .. normal .. ' passed ')
    if #self.pending > 0 then
        io.write('and ' .. #self.pending .. ' pending ')
    end
    print('in ' .. time .. ' seconds.')

    -- 終了
    if #self.pending > 0 then
        -- 保留があるので後回し
    else
        self:quit()
    end
end

-- テスト
function Runner:test(files)
    for _, name in ipairs(files) do
        -- ロード
        local ok, chunk = pcall(love.filesystem.load, 'test/' .. name)
        if not ok then
            -- ロード失敗
            fail('load ' .. name, chunk)
        else
            -- ロード成功
            -- 実行
            local success, result = pcall(chunk)
            if not success then
                -- 実行失敗
                fail('do ' .. name, result)
            else
                -- 実行成功
                if result ~= nil then
                    table.insert(self.pending, result)
                end
            end
        end
    end
end

-- 終了
function Runner:quit()
    love.event.quit(lust.errors > 0 and 1 or 0)
end

-- 更新
function Runner:update(dt, ...)
end

-- 描画
function Runner:draw(...)
end

return Runner
