local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local Monster = require 'entities.Monster'

describe('Monster', function ()
    it('instantiate', function ()
        expect(Monster()).to.be.a('table')
    end)

    local data = {
        name = 'foo',
        realname = 'foobar',
        picture = 'foo.png',
        realpicture = 'foobar.png',
        numdice = {
            roll = 1,
            side = 2,
            modifier = 3,
        },
        hpdice = {
            roll = 1,
            side = 2,
            modifier = 3,
        },
        class = 'lycanthrope',
        ac = -10,
        attacktimes = 12,
        attackdices = {
            {
                roll = 1,
                side = 2,
                modifier = 3,
            },
            {
                roll = 1,
                side = 2,
                modifier = 3,
            },
        },
        exp = 12345,
        drain = 123,
        heal = 456,
        wanderingchest = 'hoge',
        lairchest = 'fuga',
        following = {
            probability = 50,
            follower = 42,
        },
        spelllevels = {
            mage = 3,
            priest = 4,
        },
        unique = -1,
        breath = 'poison',
        resistspell = 50,
        resists = {
            'fire',
            'stoning',
        },
        features = {
            'criticallyhit',
            'call',
        }
    }
    local instance

    it('instantiate from table', function ()
        instance = Monster(data)
        expect(instance).to.be.a('table')
    end)
end)
