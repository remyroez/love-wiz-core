local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local Statistics = require 'valueobjects.Statistics'
local Attribute = require 'valueobjects.Attribute'
local AttributeEnum = require 'enums.Attribute'

describe('entities/Statistics', function ()
    it('instantiate', function ()
        expect(Statistics()).to.be.a('table')
    end)

    local data = {
        strength = { value = 8, min = 3, max = 18 },
        iq = 15,
        piety = 12,
        vitality = 9,
        agility = 6,
        luck = 3,
    }
    local instance

    it('instantiate from table', function ()
        instance = Statistics(data)
        expect(instance).to.be.a('table')
    end)

    it('check values', function ()
        expect(instance:get(AttributeEnum.strength)).to.be(Attribute{ value = 8, min = 3, max = 18 })
        expect(instance:get(AttributeEnum.iq)).to.be(Attribute(15))
        expect(instance:get(AttributeEnum.piety)).to.be(Attribute(12))
        expect(instance:get(AttributeEnum.vitality)).to.be(Attribute(9))
        expect(instance:get(AttributeEnum.agility)).to.be(Attribute(6))
        expect(instance:get(AttributeEnum.luck)).to.be(Attribute(3))
    end)

    it('__eq', function ()
        expect(instance == Statistics(data)).to.be.truthy()
        expect(instance == Statistics()).to_not.be.truthy()
    end)
end)
