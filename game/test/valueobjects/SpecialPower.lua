local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local SpecialPower = require 'valueobjects.SpecialPower'

describe('SpecialPower', function ()
    it('instantiate', function ()
        expect(SpecialPower()).to.be.a('table')
    end)

    local data = {
        power = 'lose_strength',
        changingprobability = 50,
        changeditem = 'foobar',
    }
    local instance

    it('instantiate from number', function ()
        instance = SpecialPower(data)
        expect(instance).to.be.a('table')
    end)

    it('__eq', function ()
        expect(instance == SpecialPower {
            power = 'lose_strength',
            changingprobability = 50,
            changeditem = 'foobar',
        }).to.be.truthy()

        expect(instance == SpecialPower {
            power = 'to_samurai',
            changingprobability = 50,
            changeditem = 'foobar',
        }).to_not.be.truthy()

        expect(instance == SpecialPower {
            power = 'lose_strength',
            changingprobability = 10,
            changeditem = 'foobar',
        }).to_not.be.truthy()

        expect(instance == SpecialPower {
            power = 'lose_strength',
            changingprobability = 50,
            changeditem = 'hoge',
        }).to_not.be.truthy()
    end)

    describe('change', function ()
        local mindice = function (max)
            return 1
        end
        local maxdice = function (max)
            return max or 1
        end

        it('min', function ()
            expect(instance:change(maxdice)).to.be(nil)
        end)
        it('max', function ()
            expect(instance:change(mindice)).to.be('foobar')
        end)
    end)
end)
