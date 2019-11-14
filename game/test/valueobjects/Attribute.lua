local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local Attribute = require 'valueobjects.Attribute'

describe('entities/Attribute', function ()
    it('instantiate', function ()
        expect(Attribute()).to.be.a('table')
    end)

    local data = { value = 8, min = 3, max = 18 }
    local instance

    it('instantiate from table', function ()
        instance = Attribute(data)
        expect(instance).to.be.a('table')
    end)

    it('check types', function ()
        expect(instance.value).to.be.a('number')
        expect(instance.min).to.be.a('number')
        expect(instance.max).to.be.a('number')
    end)

    it('check values', function ()
        expect(instance.value).to.be(8)
        expect(instance.min).to.be(3)
        expect(instance.max).to.be(18)
    end)

    it('__tostring', function ()
        expect(tostring(instance)).to.be('8')
    end)

    it('__eq', function ()
        expect(instance == Attribute{ value = 8, min = 3, max = 18 }).to.be.truthy()
    end)

    it('__unm', function ()
        expect(-instance).to.be(Attribute{ value = -8, min = 3, max = 18 })
    end)

    it('__add', function ()
        local a = Attribute{ value = 18, min = 3, max = 18 }
        expect(instance + 25).to.be(a)
        expect(instance + Attribute{ value = 15, min = 3, max = 18 }).to.be(a)
        expect(function ()
            local _ = instance + Attribute{ value = 15, min = 1, max = 18 }
        end).to.fail()
    end)

    it('__sub', function ()
        local a = Attribute{ value = 3, min = 3, max = 18 }
        expect(instance - 10).to.be(a)
        expect(instance - Attribute{ value = 10, min = 3, max = 18 }).to.be(a)
        expect(function ()
            local _ = instance - Attribute{ value = 10, min = 1, max = 18 }
        end).to.fail()
    end)

    it('isSameRange', function ()
        expect(instance:isSameRange{ min = 3, max = 18 }).to.be.truthy()
        expect(instance:isSameRange{ min = 3, max = 5 }).to_not.be.truthy()
        expect(instance:isSameRange{ min = 1, max = 18 }).to_not.be.truthy()
    end)

    it('clamp', function ()
        expect(instance:clamp(1)).to.be(3)
        expect(instance:clamp(20)).to.be(18)
        expect(instance:clamp(5)).to.be(5)
    end)
end)
