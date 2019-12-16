local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local EquipmentModifier = require 'valueobjects.EquipmentModifier'

describe('EquipmentModifier', function ()
    it('instantiate', function ()
        expect(EquipmentModifier()).to.be.a('table')
    end)

    local data = {
        tohit = 123,
        attacktimes = 456,
    }
    local instance

    it('instantiate from number', function ()
        instance = EquipmentModifier(data)
        expect(instance).to.be.a('table')
    end)

    it('__eq', function ()
        expect(instance == EquipmentModifier { tohit = 123, attacktimes = 456 }).to.be.truthy()
        expect(instance == EquipmentModifier { tohit = 789, attacktimes = 456 }).to_not.be.truthy()
        expect(instance == EquipmentModifier { tohit = 123, attacktimes = 789 }).to_not.be.truthy()
    end)

    it('__add', function ()
        expect(
            instance + EquipmentModifier { tohit = 1000, attacktimes = 2000 }
        ).to.be(EquipmentModifier { tohit = 1123, attacktimes = 2456 })
    end)

    it('modify', function ()
        expect(
            instance:modify { tohit = 1000, attacktimes = 2000 }
        ).to.be(EquipmentModifier { tohit = 1123, attacktimes = 2456 })
    end)

    it('__call == modify', function ()
        expect(
            instance { tohit = 1000, attacktimes = 2000 }
            == instance:modify { tohit = 1000, attacktimes = 2000 }
        ).to.be.truthy()
    end)
end)
