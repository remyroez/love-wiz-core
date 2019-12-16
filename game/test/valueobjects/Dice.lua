local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local Dice = require 'valueobjects.Dice'

describe('Dice', function ()
    it('instantiate', function ()
        expect(Dice()).to.be.a('table')
    end)

    local data = {
        roll = 1,
        side = 2,
        modifier = 3,
    }
    local instance

    it('instantiate from table', function ()
        instance = Dice(data)
        expect(instance).to.be.a('table')
    end)

    it('__eq', function ()
        expect(instance == Dice{ roll = 1, side = 2, modifier = 3 }).to.be.truthy()
        expect(instance == Dice{ roll = 0, side = 2, modifier = 3 }).to_not.be.truthy()
        expect(instance == Dice{ roll = 1, side = 0, modifier = 3 }).to_not.be.truthy()
        expect(instance == Dice{ roll = 1, side = 2, modifier = 0 }).to_not.be.truthy()
    end)

    it('__tostring', function ()
        expect(tostring(instance)).to.be('1d2+3')
    end)

    it('max', function ()
        expect(instance:max()).to.be(5)
    end)

    it('min', function ()
        expect(instance:min()).to.be(4)
    end)

    local mindice = function ()
        return 1
    end
    local maxdice = function (max)
        return max or 1
    end

    describe('throw', function ()
        it('min', function ()
            expect(instance:throw(mindice)).to.be(4)
        end)
        it('max', function ()
            expect(instance:throw(maxdice)).to.be(5)
        end)
    end)

    describe('__call == throw', function ()
        it('min', function ()
            expect(instance:throw(mindice)).to.be(instance(mindice))
        end)
        it('max', function ()
            expect(instance:throw(maxdice)).to.be(instance(maxdice))
        end)
    end)
end)
