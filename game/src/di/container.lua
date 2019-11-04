
local class = require 'middleclass'

local container = class 'container'

function container:initialize(t)
    self.binded = t or {}
end

function container:__call(...)
    return self:get(...)
end

function container:bind(key, value)
    self.binded[key] = value
    return self
end

function container:get(key, ...)
    local value = self.binded[key]
    if type(value) == 'table' and type(value.new) == 'function' then
        value = value:new(...)
    elseif type(value) == 'function' then
        value = value(...)
    end
    if type(value) == 'table' and (value.dependencies or (value.class and value.class.dependencies)) then
        local dependencies = value.dependencies or (value.class and value.class.dependencies)
        if type(dependencies) == 'function' then
            dependencies = dependencies(value, ...)
        end
        if type(dependencies) == 'table' then
            if dependencies[1] then
                for k, dep in pairs(dependencies) do
                    value[dep] = self:get(dep, ...)
                end
            else
                for k, dep in pairs(dependencies) do
                    value[k] = self:get(dep, ...)
                end
            end
        end
    end
    return value
end

return container
