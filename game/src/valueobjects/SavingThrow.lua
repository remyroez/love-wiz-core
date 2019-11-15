
local class = require 'middleclass'
local util = require 'util'

-- クラス：セービングスロー
local SavingThrow = class 'SavingThrow'

-- 組み込み
SavingThrow:include(require 'Class')
SavingThrow:include(require 'Readonly')


-- 毒セーブ
function SavingThrow.static.savePoison(randomizer, save)
    randomizer = util.randomizer(randomizer)
    save = save or 0
    return randomizer(0, 19) > save
end

-- 麻痺セーブ
function SavingThrow.static.saveParalyze(randomizer, save)
    randomizer = util.randomizer(randomizer)
    save = save or 0
    return randomizer(0, 19) > save
end

-- クリティカルヒットセーブ
function SavingThrow.static.saveCriticalHit(randomizer, save1, save2)
    randomizer = util.randomizer(randomizer)
    save1 = save1 or 0
    save2 = math.max(0, math.min(save2 or 2, 50))
    return randomizer(0, 19) > save1 or randomizer(0, 100) > save2
end

-- 石化セーブ
function SavingThrow.static.saveStone(randomizer, save)
    randomizer = util.randomizer(randomizer)
    save = save or 0
    return randomizer(0, 19) > save
end

-- ブレスセーブ
function SavingThrow.static.saveBreath(randomizer, save)
    randomizer = util.randomizer(randomizer)
    save = save or 0
    return randomizer(0, 19) > save
end

-- ガス爆弾セーブ
function SavingThrow.static.saveGasBomb(randomizer, save)
    randomizer = util.randomizer(randomizer)
    save = save or 0
    return randomizer(0, 19) < save
end

-- 沈黙セーブ
function SavingThrow.static.saveSilence(randomizer, save)
    randomizer = util.randomizer(randomizer)
    save = save or 0
    return randomizer(0, 99) > save
end

-- メイジ／プリーストブラスターセーブ
function SavingThrow.static.saveBlaster(randomizer, save)
    randomizer = util.randomizer(randomizer)
    save = save or 0
    return randomizer(0, 19) < save
end

-- 初期化
function SavingThrow:initialize(t)
    t = t or {}

    -- 値
    self.values = t or {}
    self.values[1] = self.values[1] or 0
    self.values[2] = self.values[2] or 0
    self.values[3] = self.values[3] or 0
    self.values[4] = self.values[4] or 0
    self.values[5] = self.values[5] or 0
end

-- オーバーライド：比較
function SavingThrow:__eq(other)
    return util.equalarray(self.values, other.values)
end

-- オーバーライド：文字列化
function SavingThrow:__tostring()
    return self.values[1]
        .. '/' .. self.values[2]
        .. '/' .. self.values[3]
        .. '/' .. self.values[4]
        .. '/' .. self.values[5]
end

-- オーバーライド：加算
function SavingThrow:__add(other)
    other = other or SavingThrow {}
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
function SavingThrow:__sub(other)
    other = other or SavingThrow {}
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

-- 毒
function SavingThrow:poison()
    return self.values[1]
end

-- 麻痺
function SavingThrow:paralyze()
    return self.values[1]
end

-- クリティカルヒット
function SavingThrow:criticalhit()
    return self.values[1]
end

-- 石化
function SavingThrow:stone()
    return self.values[2]
end

-- ブレス
function SavingThrow:breath()
    return self.values[4]
end

-- ガス爆弾
function SavingThrow:gasbomb()
    return self.values[4]
end

-- 沈黙
function SavingThrow:silence()
    return self.values[5]
end

-- メイジ／プリーストブラスター
function SavingThrow:blaster()
    return self.values[5]
end

-- 毒セーブ
function SavingThrow:savePoison(randomizer)
    return SavingThrow.savePoison(randomizer, self:poison())
end

-- 麻痺セーブ
function SavingThrow:saveParalyze(randomizer)
    return SavingThrow.saveParalyze(randomizer, self:paralyze())
end

-- クリティカルヒットセーブ
function SavingThrow:saveCriticalHit(randomizer, save2)
    return SavingThrow.saveCriticalHit(randomizer, self:criticalhit(), save2)
end

-- 石化セーブ
function SavingThrow:saveStone(randomizer)
    return SavingThrow.saveStone(randomizer, self:stone())
end

-- ブレスセーブ
function SavingThrow:saveBreath(randomizer)
    return SavingThrow.saveBreath(randomizer, self:breath())
end

-- ガス爆弾セーブ
function SavingThrow:saveGasBomb(randomizer)
    return SavingThrow.saveGasBomb(randomizer, self:gasbomb())
end

-- 沈黙セーブ
function SavingThrow:saveSilence(randomizer)
    return SavingThrow.saveSilence(randomizer, self:silence())
end

-- メイジ／プリーストブラスターセーブ
function SavingThrow:saveBlaster(randomizer)
    return SavingThrow.saveBlaster(randomizer, self:blaster())
end

return SavingThrow
