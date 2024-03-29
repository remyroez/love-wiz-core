
local class = require 'middleclass'
local util = require 'util'

-- クラス：次のレベルまでの経験値
local NextLevel = class 'NextLevel'

-- 組み込み
NextLevel:include(require 'Readonly')

-- 初期化
function NextLevel:initialize(t)
    t = t or {}

    self.exps = t or {}
end

-- オーバーライド：比較
function NextLevel:__eq(other)
    return util.equalarray(self.exps, other.exps)
end

-- 累積経験値からレベルを算出する
function NextLevel:getLevel(exp)
    local level = 1
    for i, value in ipairs(self.exps) do
        if exp >= value then
            level = i + 1
        else
            break
        end
    end
    return level
end

-- レベルから累積経験値を返す
function NextLevel:getTotalExperience(level)
    local exp = 0
    if level <= 1 then
        exp = 0
    elseif level <= #self.exps then
        exp = self.exps[level - 1] or 0
    else
        exp = self.exps[#self.exps] + (self.exps[#self.exps] - self.exps[#self.exps - 1]) * (level - #self.exps - 1)
    end
    return exp
end

-- レベルから必要経験値を返す
function NextLevel:getRequireExperience(level)
    local exp = 0
    if level <= #self.exps then
        exp = self:getTotalExperience(level + 1) - self:getTotalExperience(level)
    else
        exp = (self.exps[#self.exps] - self.exps[#self.exps - 1]) or 0
    end
    return exp
end

return NextLevel
