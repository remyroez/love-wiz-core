
local class = require 'middleclass'

-- スキーマ
local Schema = class 'SavingThrow'

-- 組み込み
Schema:include(require 'Class')

-- 毒セーブ
function Schema.static.savePoison(randomizer, save)
    randomizer = randomizer or math.random
    return randomizer(0, 19) > save
end

-- 麻痺セーブ
function Schema.static.saveParalyze(randomizer, save)
    randomizer = randomizer or math.random
    return randomizer(0, 19) > save
end

-- クリティカルヒットセーブ
function Schema.static.saveCriticalHit(randomizer, save, save2)
    randomizer = randomizer or math.random
    return randomizer(0, 19) > save or randomizer(0, 100) > save2
end

-- 石化セーブ
function Schema.static.saveStone(randomizer, save)
    randomizer = randomizer or math.random
    return randomizer(0, 19) > save
end

-- ブレスセーブ
function Schema.static.saveBreath(randomizer, save)
    randomizer = randomizer or math.random
    return randomizer(0, 19) > save
end

-- ガス爆弾セーブ
function Schema.static.saveGasBomb(randomizer, save)
    randomizer = randomizer or math.random
    return randomizer(0, 19) < save
end

-- 沈黙セーブ
function Schema.static.saveSilence(randomizer, save)
    randomizer = randomizer or math.random
    return randomizer(0, 99) > save
end

-- メイジ／プリーストブラスターセーブ
function Schema.static.saveBlaster(randomizer, save)
    randomizer = randomizer or math.random
    return randomizer(0, 19) < save
end

-- 初期化
function Schema:initialize(t)
    t = t or {}

    -- 値
    self.values = t or {}
    self.values[1] = self.values[1] or 0
    self.values[2] = self.values[2] or 0
    self.values[3] = self.values[3] or 0
    self.values[4] = self.values[4] or 0
    self.values[5] = self.values[5] or 0
end

-- オーバーライド：文字列化
function Schema:__tostring()
    return self.values[1]
        .. '/' .. self.values[2]
        .. '/' .. self.values[3]
        .. '/' .. self.values[4]
        .. '/' .. self.values[5]
end

-- オーバーライド：加算
function Schema:__add(other)
    other = other or Schema {}
    if self.class:isInstance(other) then
        return self.class {
            self.values[1] + other.values[1],
            self.values[2] + other.values[2],
            self.values[3] + other.values[3],
            self.values[4] + other.values[4],
            self.values[5] + other.values[5]
        }
    else
        error('Not an operational value')
    end
end

-- オーバーライド：減算
function Schema:__sub(other)
    other = other or Schema {}
    if self.class:isInstance(other) then
        return self.class{
            self.values[1] - other.values[1],
            self.values[2] - other.values[2],
            self.values[3] - other.values[3],
            self.values[4] - other.values[4],
            self.values[5] - other.values[5]
        }
    else
        error('Not an operational value')
    end
end

-- オーバーライド：比較
function Schema:__eq(other)
    other = other or Schema {}
    return self.values[1] == other.values[1]
        and self.values[2] == other.values[2]
        and self.values[3] == other.values[3]
        and self.values[4] == other.values[4]
        and self.values[5] == other.values[5]
end

-- 毒
function Schema:poison()
    return self.values[1]
end

-- 麻痺
function Schema:paralyze()
    return self.values[1]
end

-- クリティカルヒット
function Schema:criticalhit()
    return self.values[1]
end

-- 石化
function Schema:stone()
    return self.values[2]
end

-- ブレス
function Schema:breath()
    return self.values[4]
end

-- ガス爆弾
function Schema:gasbomb()
    return self.values[4]
end

-- 沈黙
function Schema:silence()
    return self.values[5]
end

-- メイジ／プリーストブラスター
function Schema:blaster()
    return self.values[5]
end

return Schema
