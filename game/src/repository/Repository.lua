
local class = require 'middleclass'
local lume = require 'lume'

-- リポジトリ
local Repository = class 'Repository'

-- 初期化
function Repository:initialize(t)
    t = t or {}
    self.file = t.file or ''
    self.entities = {}

    if type(t.entities) == 'table' then
        self:loadDataTable(t.entities)
    end
    if type(self.file) == 'string' and #self.file > 0 then
        self:load(self.file)
    end
end

-- リセット
function Repository:reset()
    lume.clear(self.entities)
    lume.clear(self.entities)
end

-- ファイル読み込み
function Repository:load(file)
    local succeeded = false
    file = file or ''
    local info = love.filesystem.getInfo(file)
    if info == nil then
        -- ファイルがない
        print('file not found')
    elseif info.type ~= 'file' then
        -- ファイルじゃない
        print('is not file')
    else
        -- ファイル読み込み
        local ok, fnOrErr = pcall(love.filesystem.load, file)
        if not ok then
            -- 読み込みエラー
            print(fnOrErr)
        else
            -- スクリプト実行
            local success, tableOrErr = pcall(fnOrErr)
            if not success then
                -- 実行失敗
                print(tableOrErr)
            elseif type(tableOrErr) ~= 'table' then
                -- テーブルじゃない
                print('not table')
            else
                -- データテーブル読み込み
                self:loadDataTable(tableOrErr)
                succeeded = true
            end
        end
    end
    return succeeded
end

-- データテーブル読み込み
function Repository:loadDataTable(t)
    local n = #self.entities
    for _, data in ipairs(t) do
        local loaded = self:loadData(data)
        table.insert(self.entities, loaded)
        if loaded.id then
            self.entities[loaded.id] = loaded
        end
    end
    return #self.entities - n
end

-- データ読み込み
function Repository:loadData(t)
    return t
end

-- ファイル書き込み
function Repository:save(file)
    return false
end

-- 取得
function Repository:get(id)
    return self.entities[id]
end

-- 設定
function Repository:set(data)
    if data.id then
        self.entities[data.id] = data
    end
    local found = false
    for i, value in ipairs(self.entities) do
        if value == data then
            self.entities[i] = data
            found = true
            break
        end
    end
    if not found then
        table.insert(self.entities, data)
    end
end

return Repository
