
local class = require 'middleclass'

-- スキーマ
local Schema = class 'HitPoint'

-- 組み込み
Schema:include(require 'Class')
Schema:include(require 'Clamp')

-- 初期化
function Schema:initialize(t)
    self:initializeClamp(t)
end

return Schema
