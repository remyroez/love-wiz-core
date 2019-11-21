local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local Following = require 'valueobjects.Following'

describe('Dice', function ()
    it('instantiate', function ()
        expect(Following()).to.be.a('table')
    end)

    local data = {
        probability = 50,
        follower = 42,
    }
    local instance

    it('instantiate from table', function ()
        instance = Following(data)
        expect(instance).to.be.a('table')
    end)

    it('__eq', function ()
        expect(instance == Following{ probability = 50, follower = 42 }).to.be.truthy()
        expect(instance == Following{ probability = 90, follower = 42 }).to_not.be.truthy()
        expect(instance == Following{ probability = 50, follower = 32 }).to_not.be.truthy()
    end)

    local mindice = function (max)
        return 1
    end
    local maxdice = function (max)
        return max or 1
    end

    describe('get', function ()
        it('gain follower', function ()
            expect(instance:get(mindice)).to.exist()
        end)
        it('nil', function ()
            expect(instance:get(maxdice)).to_not.exist()
        end)
    end)

    it('__call == get', function ()
        expect(instance:get(mindice) == instance(mindice)).to.be.truthy()
        expect(instance:get(maxdice) == instance(maxdice)).to.be.truthy()
    end)
end)
