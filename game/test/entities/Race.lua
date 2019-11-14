local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local Race = require 'entities.Race'
local Attribute = require 'valueobjects.Attribute'
local AttributeEnum = require 'enums.Attribute'

describe('entities/Race', function ()
    it('instantiate', function ()
        expect(Race()).to.be.a('table')
    end)

    local data = {
        name = 'foo',
        statistics = {
            strength = 18,
            iq = 15,
            piety = 12,
            vitality = 9,
            agility = 6,
            luck = 3,
        },
        savingthrow = {
            1, 2, 3, 4, 5
        }
    }
    local race

    it('instantiate from table', function ()
        race = Race(data)
        expect(race).to.be.a('table')
    end)

    it('check name', function ()
        expect(race.name).to.be('foo')
    end)

    it('check statistics', function ()
        expect(race.statistics:get(AttributeEnum.strength)).to.be(Attribute(18))
        expect(race.statistics:get(AttributeEnum.iq)).to.be(Attribute(15))
        expect(race.statistics:get(AttributeEnum.piety)).to.be(Attribute(12))
        expect(race.statistics:get(AttributeEnum.vitality)).to.be(Attribute(9))
        expect(race.statistics:get(AttributeEnum.agility)).to.be(Attribute(6))
        expect(race.statistics:get(AttributeEnum.luck)).to.be(Attribute(3))
    end)

    it('check savingthrow', function ()
        expect(race.savingthrow.values[1]).to.be(1)
        expect(race.savingthrow.values[2]).to.be(2)
        expect(race.savingthrow.values[3]).to.be(3)
        expect(race.savingthrow.values[4]).to.be(4)
        expect(race.savingthrow.values[5]).to.be(5)
    end)
end)
