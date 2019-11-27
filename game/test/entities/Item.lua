local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local Item = require 'entities.Item'

describe('Item', function ()
    it('instantiate', function ()
        expect(Item()).to.be.a('table')
    end)

    local data = {
        name = 'foo',
        realname = 'foobar',
        class = 'gauntlet',
        equipable = {
            alignments = {
                'neutral',
            },
            classes = {
                'bishop',
            },
            races = {
                'elf',
            }
        },
        cursable = {
            alignments = {
                'evil'
            },
            classes = {
                'ninja',
            },
            races = {
                'gnome',
            }
        },
        specialpower = {
            power = 'lose_strength',
            changingprobability = 50,
            changeditem = 'foobar',
        },
        prices = {
            buy = 123456,
        },
        spell = 'baz',
        heal = 123,
        slay = 'lycanthrope',
        protection = 'dragon',
        ac = -10,
        cursedac = 10,
        attackdice = {
            roll = 1,
            side = 2,
            modifier = 3,
        },
        modifier = {
            tohit = 123,
            attacktimes = 456,
        },
        features = {
            'criticallyhit'
        },
        resists = {
            'cold',
            'magic'
        }
    }
    local instance

    it('instantiate from table', function ()
        instance = Item(data)
        expect(instance).to.be.a('table')
    end)
end)
