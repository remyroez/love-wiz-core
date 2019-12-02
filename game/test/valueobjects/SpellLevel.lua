local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local SpellLevel = require 'valueobjects.SpellLevel'

describe('SpellLevel', function ()
    it('instantiate', function ()
        expect(SpellLevel()).to.be.a('table')
    end)

    local data = {
        spells = {
            'foo'
        },
        point = 10
    }
    local instance

    it('instantiate from number', function ()
        instance = SpellLevel(data)
        expect(instance).to.be.a('table')
    end)

    it('__eq', function ()
        expect(instance == SpellLevel {
            spells = {
                'foo'
            },
            point = 10
        }).to.be.truthy()
        expect(instance == SpellLevel {
            spells = {
                'bar'
            },
            point = 10
        }).to_not.be.truthy()
        expect(instance == SpellLevel {
            spells = {
                'foo'
            },
            point = 20
        }).to_not.be.truthy()
    end)

    it('hasSpell', function ()
        expect(instance:hasSpell('foo')).to.be.truthy()
        expect(instance:hasSpell('bar')).to_not.be.truthy()
    end)

    it('canCast', function ()
        expect(instance:canCast('foo')).to.be.truthy()
        expect(instance:canCast('bar')).to_not.be.truthy()
    end)
end)
