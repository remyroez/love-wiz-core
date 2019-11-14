
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

-- 列挙
local function enumrate(file, folder)
    local path = folder .. '/' .. file
    local info = love.filesystem.getInfo(path)
    if info == nil then
        return ''
    elseif info.type == 'file' then
        return path
    elseif info.type == 'directory' then
        local files = love.filesystem.getDirectoryItems(path)
        local t = lume.map(files, function (v) return enumrate(v, path) end)
        t.path = file
        return t
    else
        return ''
    end
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
        files.path = 'test'
    else
        files = lume.clone(args)
    end
    lume.remove(files, 'Runner.lua')
    lume.remove(files, 'lust.lua')

    files = lume.map(files, function (v) return enumrate(v, 'test') end)

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
    for _, file in ipairs(files) do
        if type(file) == 'table' then
            if file.path then
                print(string.rep('\t', lust.level) .. file.path)
                lust.level = lust.level + 1
            end
            self:test(file)
            if file.path then
                lust.level = lust.level - 1
            end
        else
            -- ロード
            local ok, chunk = pcall(love.filesystem.load, file)
            if not ok then
                -- ロード失敗
                fail('load ' .. file, chunk)
            else
                -- ロード成功
                -- 実行
                local success, result = pcall(chunk)
                if not success then
                    -- 実行失敗
                    fail('do ' .. file, result)
                else
                    -- 実行成功
                    if result ~= nil then
                        table.insert(self.pending, result)
                    end
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
