local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local CharacterClass = require 'entities.CharacterClass'

describe('CharacterClass', function ()
    it('instantiate', function ()
        expect(CharacterClass()).to.be.a('table')
    end)

    local data = {
        name = 'foobar',
        shortname = 'foo',
        alignments = { 'good' },
        statrequirement = {

        },
        savingthrow = {

        },
        defaultspellbooks = {

        },
        spelllearnlevels = {

        },
        hpdice = 10,
        attacktimelevel = {

        },
        nextlevel = {

        }
    }
    local instance

    it('instantiate from table', function ()
        instance = CharacterClass(data)
        expect(instance).to.be.a('table')
    end)
end)
