local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local Spellbook = require 'valueobjects.Spellbook'

describe('Spellbook', function ()
    it('instantiate', function ()
        expect(Spellbook()).to.be.a('table')
    end)

    local data = {
        levels = {
            {
                spells = {
                    'foo'
                },
                point = 10
            },
            {
                spells = {
                    'bar'
                },
                point = 0
            },
            {
                spells = {
                    'baz'
                },
                point = 30
            }
        }
    }
    local instance

    it('instantiate from number', function ()
        instance = Spellbook(data)
        expect(instance).to.be.a('table')
    end)

    it('__eq', function ()
        expect(instance == Spellbook {
            levels = {
                {
                    spells = {
                        'foo'
                    },
                    point = 10
                },
                {
                    spells = {
                        'bar'
                    },
                    point = 0
                },
                {
                    spells = {
                        'baz'
                    },
                    point = 30
                }
            }
        }).to.be.truthy()
        expect(instance == Spellbook {
            levels = {
                {
                    spells = {
                        'foo'
                    },
                    point = 10
                },
                {
                    spells = {
                        'bar'
                    },
                    point = 0
                }
            }
        }).to_not.be.truthy()
    end)

    it('hasSpell', function ()
        expect(instance:hasSpell('foo')).to.be(1)
        expect(instance:hasSpell('bar')).to.be(2)
        expect(instance:hasSpell('baz')).to.be(3)
    end)

    it('canCast', function ()
        expect(instance:canCast('foo')).to.be(1)
        expect(instance:canCast('bar')).to.be(2)
        expect(instance:canCast('baz')).to.be(3)
    end)
end)
