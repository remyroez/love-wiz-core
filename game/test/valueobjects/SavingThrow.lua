local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local SavingThrow = require 'valueobjects.SavingThrow'

describe('SavingThrow', function ()
    it('instantiate', function ()
        expect(SavingThrow()).to.be.a('table')
    end)

    local data = {
        1, 2, 3, 4, 5
    }
    local instance

    it('instantiate from table', function ()
        instance = SavingThrow(data)
        expect(instance).to.be.a('table')
    end)

    it('check values', function ()
        expect(instance.values[1]).to.be(1)
        expect(instance.values[2]).to.be(2)
        expect(instance.values[3]).to.be(3)
        expect(instance.values[4]).to.be(4)
        expect(instance.values[5]).to.be(5)
    end)

    it('__eq', function ()
        expect(instance == SavingThrow{ 1, 2, 3, 4, 5 }).to.be.truthy()
        expect(instance == SavingThrow{ 2, 2, 3, 4, 5 }).to_not.be.truthy()
    end)

    it('__tostring', function ()
        expect(tostring(instance)).to.be('1/2/3/4/5')
    end)

    it('__add', function ()
        expect(instance + SavingThrow{ 1, 2, 3, 4, 5 }).to.be(SavingThrow{ 2, 4, 6, 8, 10 })
        expect(function ()
            local _ = instance + 'foo'
        end).to.fail()
    end)

    it('__sub', function ()
        expect(instance - SavingThrow{ 1, 2, 3, 4, 5 }).to.be(SavingThrow{ 0, 0, 0, 0, 0 })
        expect(function ()
            local _ = instance - 'foo'
        end).to.fail()
    end)

    it('poison', function ()
        expect(instance:poison()).to.be(1)
    end)

    it('paralyze', function ()
        expect(instance:paralyze()).to.be(1)
    end)

    it('criticalhit', function ()
        expect(instance:paralyze()).to.be(1)
    end)

    it('stone', function ()
        expect(instance:stone()).to.be(2)
    end)

    it('breath', function ()
        expect(instance:breath()).to.be(4)
    end)

    it('gasbomb', function ()
        expect(instance:gasbomb()).to.be(4)
    end)

    it('silence', function ()
        expect(instance:silence()).to.be(5)
    end)

    it('blaster', function ()
        expect(instance:blaster()).to.be(5)
    end)

    local mindice = function (min, max)
        return min or max
    end

    local maxdice = function (min, max)
        return max or min
    end

    it('savePoison', function ()
        expect(instance:savePoison(mindice)).to_not.be.truthy()
        expect(instance:savePoison(maxdice)).to.be.truthy()
    end)

    it('saveParalyze', function ()
        expect(instance:saveParalyze(mindice)).to_not.be.truthy()
        expect(instance:saveParalyze(maxdice)).to.be.truthy()
    end)

    it('saveCriticalHit', function ()
        expect(instance:saveCriticalHit(mindice), 50).to_not.be.truthy()
        expect(instance:saveCriticalHit(maxdice), 50).to.be.truthy()
    end)

    it('saveStone', function ()
        expect(instance:saveStone(mindice)).to_not.be.truthy()
        expect(instance:saveStone(maxdice)).to.be.truthy()
    end)

    it('saveBreath', function ()
        expect(instance:saveBreath(mindice)).to_not.be.truthy()
        expect(instance:saveBreath(maxdice)).to.be.truthy()
    end)

    it('saveGasBomb', function ()
        expect(instance:saveGasBomb(mindice)).to.be.truthy()
        expect(instance:saveGasBomb(maxdice)).to_not.be.truthy()
    end)

    it('saveSilence', function ()
        expect(instance:saveSilence(mindice)).to_not.be.truthy()
        expect(instance:saveSilence(maxdice)).to.be.truthy()
    end)

    it('saveBlaster', function ()
        expect(instance:saveBlaster(mindice)).to.be.truthy()
        expect(instance:saveBlaster(maxdice)).to_not.be.truthy()
    end)
end)
