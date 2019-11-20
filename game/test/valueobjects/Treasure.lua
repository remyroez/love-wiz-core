local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local Treasure = require 'valueobjects.Treasure'

describe('Treasure', function ()
    it('instantiate', function ()
        expect(Treasure()).to.be.a('table')
    end)

    local data = {
        probability = 100,
        min = 1,
        max = 42,
    }
    local instance

    it('instantiate from table', function ()
        instance = Treasure(data)
        expect(instance).to.be.a('table')
    end)

    it('__eq', function ()
        expect(instance == Treasure {probability = 100, min = 1, max = 42 }).to.be.truthy()
        expect(instance == Treasure {probability = 10, min = 1, max = 42 }).to_not.be.truthy()
        expect(instance == Treasure {probability = 100, min = 2, max = 42 }).to_not.be.truthy()
        expect(instance == Treasure {probability = 100, min = 1, max = 30 }).to_not.be.truthy()
    end)

    local mindice = function (min, max)
        return min or max
    end
    local maxdice = function (min, max)
        return max or min
    end

    describe('get', function ()
        it('min', function ()
            local value = instance:get(mindice)
            expect(value).to.be(1)
        end)
        it('max', function ()
            local value = instance:get(maxdice)
            expect(value).to.be(42)
        end)
    end)

    it('__call == get', function ()
        expect(instance:get(mindice) == instance(mindice)).to.be.truthy()
        expect(instance:get(maxdice) == instance(maxdice)).to.be.truthy()
    end)
end)
